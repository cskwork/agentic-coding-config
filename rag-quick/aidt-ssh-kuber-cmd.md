# aidt-ssh-kuber-cmd

sudo su -
kubectl get namespaces

kubectl get pods --all-namespaces

kubectl get pod -n 네임스페이스명 --show-labels
kubectl get pod -n bo-api --show-labels

kubectl get pod -n lms-api --show-labels
# 로그
kubectl logs -l app=bo-api -n bo-api --tail=1000
kubectl logs -l app=lms-api -n lms-api --tail=1000
kubectl logs -l app=aidt-demo -n aidt-demo --tail=1000
# 메모리 
kubectl describe node worker-w-27p2

# 로그 follow
kubectl logs -l [레이블명 / app=lcms-was] -n [네임스페이스명 / lcms-was]

kubectl logs -l app=aidt-demo -n aidt-demo

# 마지막 1000줄 확인
kubectl logs -l [레이블명 / app=lcms-was] -n [네임스페이스명 / lcms-was] --tail=1000 -f
kubectl logs --tail=1000 -f -l app=sso-api -n sso-api
kubectl logs --tail=1000 -f -l app=lms-api -n lms-api

# pod 진입 
kubectl exec -it -n bo-was $(kubectl get pod -n bo-was -l app=bo-was -o name | head -n1) -- /bin/sh

kubectl exec -it -n lms-api $(kubectl get pod -n lms-api -l app=lms-api -o name | head -n1) -- /bin/sh

kubectl exec -it -n lcms-was $(kubectl get pod -n lcms-was -l app=lcms-was -o name | head -n1) -- /bin/sh

kubectl exec -it -n viewer-api $(kubectl get pod -n viewer-api -l app=viewer-api -o name | head -n1) -- /bin/sh

kubectl exec -it -n mat-lms-api $(kubectl get pod -n mat-lms-api -l app=mat-lms-api -o name | head -n1) -- /bin/sh

kubectl exec -it -n aidt-demo $(kubectl get pod -n aidt-demo -l app=aidt-demo -o name | head -n1) -- /bin/sh


kubectl get pods -n bo-was -l app=bo-was -o jsonpath="{.items[0].metadata.name}"


# Ready가 1/1인 Pod만 뽑기
POD=$(kubectl get pods -n lms-api -l app=lms-api --no-headers | awk '$2=="1/1"{print $1}' | head -n1)
echo "$POD"

# 단일 컨테이너면 -c 없이 바로 접속 (bash 있으면 bash)
kubectl exec -it -n lms-api "$POD" -- sh

kubectl logs --tail=1000 -f -l app=lms-api -n lms-api

# debug 소유자 확인
kubectl get events -n lms-api --sort-by=.metadata.creationTimestamp
kubectl get events -n viewer-api --sort-by=.metadata.creationTimestamp
kubectl get events -n lcms-was --sort-by=.metadata.creationTimestamp

# 파드 템플릿 보안컨텍스트/볼륨만 추출
kubectl get deploy lms-api -n lms-api -o json \
  | jq '.spec.template.spec
        | {securityContext, containers: ( .containers | map({name,securityContext,volumeMounts})), volumes}'
        
# (A) 파드 안에서 /logs 권한과 UID 확인
kubectl exec -n lms-api -it deploy/lms-api -- sh -c 'id && ls -ld /logs && ls -l /logs'

uid=1000(aidt) gid=1000(aidt) groups=1000(aidt)
drwxr-xr-x    2 root     root          4096 Sep  4 11:06 /logs
total 0

id가 uid=1000(aidt)인데 /logs가 drwxr-xr-x root:root(755)라 애플리케이션이 /logs에 쓸 권한이 없습니다. 그래서 파일 로그가 안 찍힌 거예요(콘솔 stdout은 가능).


kubectl get pods -n lms-api
kubectl logs -n lms-api $(kubectl get pod -n lms-api -l app=lms-api -o name | head -n1) --previous 

# DEBUG CONTAINER
# Check pod status and recent logs
kubectl get pods -n viewer-api
kubectl logs -n viewer-api $(kubectl get pod -n viewer-api -l app=viewer-api -o name | head -n1) --previous
kubectl logs -n viewer-api $(kubectl get pod -n viewer-api -l app=viewer-api -o name | head -n1) --follow


kubectl get pods -n aidt-demo
kubectl logs -n aidt-demo $(kubectl get pod -n aidt-demo -l app=aidt-demo -o name | head -n1) --previous
kubectl logs -n viewer-api $(kubectl get pod -n viewer-api -l app=viewer-api -o name | head -n1) --follow

kubectl get pods -n mat-lms-api
kubectl logs -n aidt-demo $(kubectl get pod -n aidt-demo -l app=aidt-demo -o name | head -n1) --previous
kubectl logs -n viewer-api $(kubectl get pod -n viewer-api -l app=viewer-api -o name | head -n1) --follow