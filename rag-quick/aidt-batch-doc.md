# aidt-batch-doc

### 데이터 생성 전달 프로세스
1. 학생 학습 함
2. 1시간 마다 케리스 5종 배치 수행
3. 2번에 의해 tb_view_mvout_tchr_lrn_trgt_stdnt_std_sys 테이블에 학생별 표준코드별 정보가 생성(성취수준 포함)
4. 새벽에 성취수준 배치 수행(dc-004), 빠져있는 표준코드별 성취수준 생성
5. lrs 케리스 일괄 배치 데이터 생성(lrs 배치)
6. 케리스 일괄 데이터 전송(dc-001 배치)
7. 새벽 5시 오류건에 대해서 lrs 일괄 배치 재생성
8. 오류건에 대해서 케리스 재전송

AIDT 배치 시스템 문서

## 등록된 배치 시스템 목록

| **배치아이디**   | **시스템명** | **배치명**                              | **스케줄**      | **Crontab**                                                                                                            |
| ----------- | -------- | ------------------------------------ | ------------ | ---------------------------------------------------------------------------------------------------------------------- |
| LMS-01-001  | LMS      | 오래된 로그성 데이터 삭제 일배치                   | 매일 새벽 4시     | 0 4 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-001 --spring.profiles.active=prod   |
| LMS-01-002  | LMS      | 학생역량지표 일일 데이터 저장 일배치                 | 매일 새벽 4시 10분 | 10 4 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-002 --spring.profiles.active=prod  |
| LMS-01-003  | LMS      | KC-성취기준코드 정보 매핑 저장 배치                | 매일 새벽 4시     | 0 4 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-003 --spring.profiles.active=prod   |
| LMS-01-004  | LMS      | 학습 관리 시스템 과제 마감 알림메세지 생성 일배치         | 30분마다        | _/30_ * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-004 --spring.profiles.active=prod |
| LMS-01-005  | LMS      | 학습 관리 시스템 칭찬 알림메세지 생성 일배치            | 매일 새벽 1시     | 0 1 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-005 --spring.profiles.active=prod   |
| LMS-01-006  | LMS      | 학생 학습 통계 일배치                         | 매일 새벽 6시     | 0 6 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-006 --spring.profiles.active=prod   |
| LMS-01-007  | LMS      | 개인정보 제공 미동의 학생정보 삭제 일배치              | 매일 새벽 3시 30분 | 30 3 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-007 --spring.profiles.active=prod  |
| LMS-01-008  | LMS      | Keris 대시보드 데이터 5종 배치                 | 매 정시마다       | 0 19 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-008 --spring.profiles.active=prod  |
| LMS-01-009  | LMS      | LLM DATASET 생성 및 업로드                 | 미정           | /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-009 --spring.profiles.active=prod             |
| LMS-01-010  | LMS      | 코스ID별 표준체계코드 저장                      | 매일 새벽 4시 30분 | 30 4 * * * /usr/lib/jdk/bin/java -jar /data/job/lms-batch-0.0.1-SNAPSHOT.jar lms-01-010 --spring.profiles.active=prod  |
| DC-01-001   | DC       | KERIS 학습 이력 데이터 일괄 전송                | 매일 새벽 1시 10분 | 10 1 * * * /usr/lib/jdk/bin/java -jar /data/job/dc-batch-0.0.1-SNAPSHOT.jar dc-01-001 --spring.profiles.active=prod    |
| DC-01-002   | DC       | KERIS 학습 이력 데이터 재전송                  | 매일 새벽 5시     | 0 5 * * * /usr/lib/jdk/bin/java -jar /data/job/dc-batch-0.0.1-SNAPSHOT.jar dc-01-002 --spring.profiles.active=prod     |
| DC-01-003   | DC       | 개인정보 미동의 데이터 일괄 삭제                   | 매일 새벽 3시     | 0 3 * * * /usr/lib/jdk/bin/java -jar /data/job/dc-batch-0.0.1-SNAPSHOT.jar dc-01-003 --spring.profiles.active=prod     |
| DC-01-004   | DC       | KERIS 성취 수준 업데이트                     | 미정           | /usr/lib/jdk/bin/java -jar /data/job/dc-batch-0.0.1-SNAPSHOT.jar dc-01-004 --spring.profiles.active=prod               |
| LRS-01-001  | LRS      | 공공 배치데이터 집계(xAPI) 일배치                | 매일 새벽 0시 10분 | 10 0 * * * /usr/lib/jdk/bin/java -jar /data/job/lrs-batch-0.0.1-SNAPSHOT.jar lrs-01-001 --spring.profiles.active=prod  |
| LRS-01-002  | LRS      | 공공 배치데이터 오류 재전송용 집계(xAPI) 일배치        | 매일 밤 23시 30분 | 30 23 * * * /usr/lib/jdk/bin/java -jar /data/job/lrs-batch-0.0.1-SNAPSHOT.jar lrs-01-002 --spring.profiles.active=prod |
| LCMS-01-001 | LCMS     | 콘텐츠, 문항 데이터 select 일배치               | 매일 새벽 1시     | 0 1 * * * /usr/lib/jdk/bin/java -jar /data/job/lcms-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod             |
| BO-01-001   | BO       | 통합관리시스템 승인 기준 15일 미접속자 일배치           | 매일 새벽 0시 35분 | 35 0 * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-001 --spring.profiles.active=prod    |
| BO-01-002   | BO       | 통합관리시스템 PM일정 일배치                     | 10분마다        | _/10_ * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-002 --spring.profiles.active=prod   |
| BO-01-003   | BO       | 통합관리시스템 LMS 접속자 집계 일배치               | 매일 새벽 2시 5분  | 5 2 * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-003 --spring.profiles.active=prod     |
| BO-01-004   | BO       | 통합관리시스템 LMS 로그인 집계 일배치               | 매일 새벽 3시 5분  | 5 3 * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-004 --spring.profiles.active=prod     |
| BO-01-005   | BO       | 통합관리시스템 공지사항 기간 비노출 일배치              | 매일 새벽 0시 5분  | 5 0 * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-005 --spring.profiles.active=prod     |
| BO-05-006   | BO       | 통합관리시스템 LMS 이용 주간 통계 메일 전송           | 매주 토요일 9시 5분 | 5 9 * * 6 /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-05-006 --spring.profiles.active=prod     |
| BO-01-007   | BO       | 통합관리시스템 LMS 로그인 유저기준 집계 일/주/월 통계 일배치 | 매일 새벽 4시 5분  | 5 4 * * * /usr/lib/jdk/bin/java -jar /data/job/bo-batch-0.0.1-SNAPSHOT.jar bo-01-007 --spring.profiles.active=prod     |

---

## KERIS로 데이터를 전송하는 배치 목록

등록된 배치 시스템에서 **KERIS(한국교육학술정보원)**로 데이터를 전송하는 배치는 총 **5개**입니다:
배치는 owner aidt
### 1. **DC-01-001** - KERIS 학습 이력 데이터 일괄 전송
- **시스템**: DC (Data Controller)
- **스케줄**: 매일 새벽 1시 10분
- **기능**: 
  - MongoDB에서 학습 이력 데이터를 조회
  - KERIS API-007 엔드포인트로 청크 단위 전송
  - 파트너별 Transfer-ID와 Access-Token 인증
  - 학습 활동 데이터(xAPI 형식) 전송

### 2. **DC-01-002** - KERIS 학습 이력 데이터 재전송
- **시스템**: DC (Data Controller)
- **스케줄**: 매일 새벽 5시
- **기능**:
  - 전송 실패한 데이터 재전송
  - 오류 테이블(`tb_dc_error_data_info`)에서 재전송 대상 조회
  - KERIS API를 통한 데이터 재전송 수행

### 3. **DC-01-004** - KERIS 성취 수준 업데이트
- **시스템**: DC (Data Controller)
- **스케줄**: 미정 (임시 배치)
- **기능**:
  - KERIS 성취 수준 데이터 업데이트
  - 학습 성과 데이터 동기화

### 4. **LMS-01-008** - Keris 대시보드 데이터 5종 배치
- **시스템**: LMS (Learning Management System)
- **스케줄**: 매 정시마다
- **기능**:
  - KERIS 대시보드용 데이터 5종 전송
  - API-001 ~ API-005까지 5가지 API 호출
  - 학생 학습 진행률, 성취도 등 대시보드 데이터 전송

## 주요 특징

### 🔄 **전송 방식**:
- **DC 배치**: xAPI 표준 형식으로 학습 이력 데이터 전송
- **LMS 배치**: 대시보드용 실시간 데이터 및 AI 학습용 데이터 전송

### 📊 **데이터 유형**:
- 학습 활동 기록 (xAPI)
- 학생 성취도 데이터
- 대시보드 통계 데이터
- AI 모델 학습 데이터