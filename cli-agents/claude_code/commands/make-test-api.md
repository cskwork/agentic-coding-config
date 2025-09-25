API를 손쉽게 호출하기 위한 테스트 스크립트 작성해줘
- 필수 도구: curl
- 선택 도구: jq (요청/응답을 보기 좋게 출력)
- 기본값은 로컬 환경을 가정하며, 환경변수로 조정 가능. 예) : "${REL_TYPE:=RTQI}" 
- docs/scripts/ 폴더에 작성 
- 파일명은 test-{url주소} 예) https://host:port/v-api/ailearning/1161954 에 대한 테스트면 host, port 제외하고-> test-v-api-ailearning-aiLrnNo.sh