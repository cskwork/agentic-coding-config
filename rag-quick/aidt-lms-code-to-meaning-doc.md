# LMS CODE, CONSTANTS. code to meaning mappings

```java
package ai.aidt.lms.api.type.ai;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum AiLrnType {
    A100("코스웨어"),
    A110("학습수준"),
    A120("AI ITEM 유형"),
    A111("빠름"),
    A112("보통"),
    A113("느림"),
    A121("도입"),
    A122("차시별 평가"),
    A123("AI 맞춤 문항"),
    A124("마무리"),

    A300("자기주도학습"),
    A310("학습수준"),
    A320("AI ITEM 유형"),
    A311("빠름"),
    A312("보통"),
    A313("느림"),
    A321("도입"),
    A322("차시별 평가"),
    A323("AI 맞춤 문항"),
    A324("마무리"),

    C000("추천학습"),
    C010("학습수준"),
    C011("빠른"),
    C013("보통"),
    C015("느린"),
    C100("학습영역"),
    C110("말하기"),
    C120("듣기"),
    C130("쓰기"),
    C140("읽기"),
    C210("말하기|듣기"),
    C220("쓰기|문법"),
    C990("전체");
    private final String desc;

    /**
     * 학습 수준(레벨) 코드
     */
    @Getter
    @RequiredArgsConstructor
    public enum LrnLvType {
        EXCLNC(A111, A311, C011),
        NRML(A112, A312, C013),
        INSFFC(A113, A313, C015),  ;

        private final AiLrnType aiLrnType;  //코스웨어
        private final AiLrnType aiSelfType; //자기주도학습
        private final AiLrnType aiRcmdnType; //추천학습
    }

    /**
     * 수학 코스구성 코드
     */
    @Getter
    @RequiredArgsConstructor
    public enum AiItemType {
        AIM01(A121, A321),  //도입
        AIM02(A124, A324),  //마무리
        AIM03(A122, A322),  //차시별평가
        AIM04(A123, A323)   //AI맞춤문항;
        private final AiLrnType ailrnType;
        private final AiLrnType aiSelfType;
    }

    /**
     * 영어 추천학습 영역 코드
     */
    @Getter
    @RequiredArgsConstructor
    public enum LrnRelmType {
        E001("듣기"),     //초등 듣기
        E002("말하기"),     //초등 말하기
        E003("읽기"),     //초등 읽기
        E004("쓰기"),     //초등 쓰기
        M001("듣기/말하기"),     //중등 듣기/말하기
        M002("읽기"),     //중등 읽기
        M003("문법/쓰기"),     //중등 문법/쓰기
        H000("전체")      //고등 전체;
        private final String desc;
    }
}
```

EVL_TYPE
```java
package ai.aidt.lms.api.type;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * 평가 타입
 */
@Getter
@RequiredArgsConstructor
public enum EVL_TYPE {
    DGNS("단원 진단평가"),
    FMTV("형성평가"),
    GNRL("총괄평가"),
    FRDG("학기초 진단평가");
    private final String name;
}
```

[[동아/재검정, 학년확장] AI 보조교사/튜터 데이터 설계_v.0.1.6 - Google Sheets](https://docs.google.com/spreadsheets/d/1yrjshbGwyLccXyo2dbALfnGUIIn5R_PgHWjnf2pjZZo/edit?gid=1686808985#gid=1686808985 "https://docs.google.com/spreadsheets/d/1yrjshbgwylccxyo2dbalfnguiin5r_pghwjnf2pjzzo/edit?gid=1686808985#gid=1686808985")

## 평가 타입 관련 약어

| 약어       | 영문 풀네임          | 한국어 의미   |
| -------- | --------------- | -------- |
| **DGNS** | Diagnosis       | 진단평가     |
| **GNRL** | General         | 총괄평가     |
| **FMTV** | Formative       | 형성평가     |
| **FRDG** | First Diagnosis | 학기초 진단평가 |
### 데이터/상태 관련 약어

| 약어        | 영문 풀네임   | 한국어 의미    |
| --------- | -------- | --------- |
| **EXPSR** | Exposure | 노출        |
| **YN**    | Yes/No   | 예/아니오 플래그 |
| **CNT**   | Count    | 개수/카운트    |
### 기타 필드명 약어

| 약어          | 영문 풀네임           | 한국어 의미 |
| ----------- | ---------------- | ------ |
| **chptSeq** | Chapter Sequence | 챕터 순서  |
| **evlType** | Evaluation Type  | 평가 타입  |
| **stdnt**   | Student          | 학생     |




NtcnCategory
```java 
package ai.aidt.lms.api.type;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum NtcnCategory {

    MY_LCTR("나의 학급"),
    CMPL("칭찬"),
    TXBK_MNG("교과서 관리"),
    ASMT_MNG("과제 관리"),
    ASMT_LEAN("과제 재촉"),
    ACTV_MNG("활동 관리"),
    DATA_MNG("자료 관리"),
    AI_DGNS_EVL("AI 진단 평가"),
    AI_FMTV_EVL("AI 형성 평가"),
    AI_GNRL_EVL("AI 총괄 평가"),
    STNG("설정"),
    INQUIRY("1:1문의 답변"),
    AI_LRN_CENTER("AI 학습관"),
    AI_LSCTR_ENG_RCMDN("선생님 추천 학습 "),
    AI_LRN_CENTER_FDB("AI 학습관 피드백");
    private final String desc;
}

```
# 수업 진행 정보 


CASE WHEN STDNT.STDNT_LRN_PRGRS_STTS = 'P900' THEN '학습 완료'
WHEN STDNT.STDNT_LRN_PRGRS_STTS = 'P500' THEN '학습중'
WHEN STDNT.STDNT_LRN_PRGRS_STTS = 'P810' THEN '학습중'
WHEN STDNT.STDNT_LRN_PRGRS_STTS = 'P100' THEN '학습전'

```java
package ai.aidt.lms.api.dto.llm;  
  
import ai.aidt.lms.api.type.llm.LlmApiType;  
import com.fasterxml.jackson.annotation.JsonFormat;  
import com.fasterxml.jackson.annotation.JsonIgnore;  
import com.fasterxml.jackson.annotation.JsonInclude;  
import com.fasterxml.jackson.annotation.JsonProperty;  
import lombok.AllArgsConstructor;  
import lombok.Getter;  
import lombok.NoArgsConstructor;  
import lombok.Setter;  
  
import java.util.*;  
import java.util.stream.Collectors;  
  
/**  
 * 교사의 수업 진행 정보를 담는 DTO  
 */@Getter  
@Setter  
@NoArgsConstructor  
@AllArgsConstructor  
public class LlmTchrDataSetDto {  
  
    /** 교사 ID */  
    private String tchrId;  
    /** 강의 코드 */  
    private String lctrCd;  
    /** 과정 ID */  
    private Integer crsId;  
    /** 단원 정보 */  
    private ChptInfoDto chapterInfo;  
  
  
  
    /**  
     * 단원 기본 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class BaseChptInfo {  
  
        /** 단원 ID */  
        private Integer chptId;  
        /** 단원명 */  
        private String chptNm;  
        /** 단원 순서 */  
        private Integer chptSeq;  
        /** 평가 유형 (DGNS, FMTV, GNRL) */  
        private String evlType;  
        /** 현재 진도중인 모듈 ID */  
        private Integer mdulId;  
        /** 현재 진도중인 모듈 순서 */  
        private Integer mdulSeq;  
        /** 현재 진도중인 모듈 명 */  
        private String mdulNm;  
        /** 해당 단원의 모듈이 한번이라도 재구성되었었는지 여부 */  
        public Boolean getIsModuleReconstructed() {  
            return "Y".equals(this.chptInitYn);  
        }  
        @JsonIgnore  
        /** 단원 초기화여부 */  
        private String chptInitYn;  
    }  
  
    /**  
     * 단원 학습 상세 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class ChptInfoDto extends BaseChptInfo {  
  
        /** API 타입 */  
        @JsonIgnore  
        private LlmApiType llmApiType;  
        /** 학습 목표 정보 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private LlmTchrDataSetDto.PlanInfoDto planInfo;  
  
        /** 학생별 성취/태도 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<StdntAchievementInfo> studentAchievementList;  
  
        /** 업로드 자료 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<RpstrInfo> repositoryList;  
  
        /** 모듈 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<MdulInfo> moduleList;  
  
        /** 과제 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<AsmtInfo> assignmentList;  
  
        /** 모둠활동 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<ActvInfo> activityList;  
  
        /** AI 평가 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<AIEvlInfo> aiEvaluationList;  
  
        /** AI 학습관 리스트 */  
        @JsonIgnore  
        private List<EngAILctrInfo> engAiLearningCenterList;  
  
        /** AI 학습관 리스트 */  
        @JsonIgnore  
        private List<MathAILctrInfo> mathAiLearningCenterList;  
  
        /** 통합 응답용 필드: AI 학습관 리스트 */  
        @JsonProperty("aiLearningCenterList")  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        public List<Object> getAiLearningCenterList() {  
            List<Object> merged = new ArrayList<>();  
            if (engAiLearningCenterList != null) merged.addAll(engAiLearningCenterList);  
            if (mathAiLearningCenterList != null) merged.addAll(mathAiLearningCenterList);  
            return  llmApiType.includes(LlmApiType.AI_LRN_CENTER_INFO) ? merged : null;  
        }  
  
        /** 오답노트 리스트  (삭제예정) */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private List<WransNoteInfo> wransNoteList;  
  
        /** 오답노트 리스트 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private WransNoteAnswerInfo wransNoteInfo;  
  
        /** 강약점 정보 */  
        @JsonInclude(JsonInclude.Include.NON_NULL)  
        private StrWeakInfo strongWeakInfo;  
  
    }  
  
    /**  
     * 단원 학습 목표 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class PlanInfoDto {  
  
        /** 목표 설정 비율 */  
        private Integer planRt;  
        /** 목표 달성 등록 비율 */  
        private Integer planAchieveRt;  
    }  
  
    /**  
     * 학생별 학습 성취 및 태도 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class StdntAchievementInfo {  
  
        /** 학생 ID */  
        private String stdntId;  
        /** 학습 성취 수준 */  
        private String lrnLvNm;  
        /** 학습 태도 수준 */  
        private String lrnAtitdNm;  
    }  
  
    /**  
     * 업로드 자료 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class RpstrInfo {  
  
        /** 모듈 ID */  
        private Integer mdulId;  
        /** 단원 ID */  
        private Integer chptId;  
        /** 단원 순서 */  
        private Integer chptSeq;  
        /** 파일 이름 */  
        private String contsFileNm;  
        /** 파일 유형 (CT01~CT07) */  
        private String contsType;  
    }  
  
    /**  
     * 모듈 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class MdulInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 모듈 ID */  
        private Integer mdulId;  
        /** 모듈 구분 (MS01=표준코스, MS02=보충학습) */  
        private String mdulSe;  
        /** 모듈 순서 */  
        private Integer mdulSeq;  
        /** 모듈 명 */  
        private String mdulNm;  
        /** 모듈 타입 */  
        private String mdulType;  
    }  
  
    /**  
     * 과제 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class AsmtInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 과제 ID */  
        private Integer asmtId;  
        /** 과제 타입 */  
        private String asmtType;  
        /** 과제 배포 상태 */  
        private String asmtMng;  
        /** 과제 수행 상태 */  
        private String asmtFlfmtStts;  
        /** 총 학생 수 */  
        private Integer totCnt;  
        /** 제출 학생 수 */  
        private Integer sbmsnCnt;  
        /** 등록일자 */  
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")  
        private Date regDt;  
        /** 과제 학생 리스트 */  
        private List<StdntInfo> stdntList;  
  
        /**  
         * 과제 학생 제출 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class StdntInfo {  
            /** 학생ID */  
            private String stdntId;  
            /** 제출 상태 */  
            private String sbmsnStts;  
        }  
    }  
  
    /**  
     * 모둠활동 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class ActvInfo {  
        /** 단원 ID */  
        private Integer chptId;  
  
        /** 활동 공개 여부 (PRV=비공개, PUB=공개) */  
        private String actvStts;  
  
        /** 등록일자 */  
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")  
        private Date regDt;  
  
        /** 총 학생 수 */  
        private Integer countTotalStdnt;  
  
        /** 참여 학생 수 */  
        private Integer countPrtcpStdnt;  
  
        /** 활동 ID */  
        private Integer actvId;  
    }  
  
    /**  
     * AI 평가 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class AIEvlInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 학습 진행 상태 (P100, P500, P900) */  
        private String lrnPrgrsStts;  
        /** 모듈 ID */  
        private Integer mdulId;  
        /** 모듈 순서 */  
        private Integer mdulSeq;  
        /** 모듈 명 */  
        private String mdulNm;  
        /** 평가 유형 (DGNS, FMTV, GNRL) */  
        private String evlType;  
        /** 총 학생 수 */  
        private Integer totStdntCnt;  
        /** 참여 학생 수 */  
        private Integer ptcpCnt;  
        /** 평균 점수 */  
        private Integer avgScore;  
        /** 평균 건너뛴 문항 수 */  
        private Integer avgSkippedQuestionNm;  
        /** 단원 */  
        private String chptNm;  
        /** 단원 순서 */  
        private Integer chptSeq;  
        /** 평가 배포일자 */  
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")  
        private Date aiLrnBgngDt;  
        /** AI 평가 정보 학생 응시현황 리스트 */  
        private List<StdntInfo> stdntList;  
        /**  
         * AI 평가 정보 학생 응시현황 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class StdntInfo {  
            /** 학생 ID */  
            private String stdntId;  
            /** 학습 진행 상태 (P100, P500, P900) */  
            private String lrnPrgrsStts;  
            /** 점수 */  
            private Integer solScr;  
            /** 맞은 갯수 */  
            private Integer solCransQitemCnt;  
            /** 총 문제 수 */  
            private Integer solQitemCnt;  
            /** 건너뛴 갯수 */  
            private Integer solSkipQitemCnt;  
        }  
    }  
  
    /**  
     * AI 학습관 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class AILctrInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 모듈 ID */  
        @JsonIgnore  
        private Integer mdulId;  
        /** 탭 ID */  
        private String tabId;  
        /** 탭 이름 */  
        private String tabValue;  
        /** 배포 일시 (수학) */  
        private String isPublished;  
    }  
    /**  
     * AI학습관(영어)  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class EngAILctrInfo extends AILctrInfo {  
        /** 학생별 학습 진행 정보 */  
        private List<EngAILctrInfo.StudentProgressDto> studentProgressList;  
        /**  
         * 학생 진행 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class StudentProgressDto {  
            /** 학생ID */  
            private String stdntId;  
            /** 진행 상태 */  
            private String lrnPrgrsStts;  
            /** 점수 */  
            private Object score;  
        }  
    }      
    /**  
     * AI학습관(수학)  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class MathAILctrInfo extends AILctrInfo {  
        /** 학생별 학습 진행 정보 */  
        private List<MathAILctrInfo.StudentProgressDto> studentProgressList;  
        /**  
         * 학생 진행 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class StudentProgressDto {  
            /** 학습자 코스웨어 유형 */  
            private String studentType;  
            /** 학생ID */  
            private String stdntId;  
            /** 진행 상태 */  
            private String lrnPrgrsStts;  
            /** 점수 */  
            private Score score;  
        }  
        /**  
         * 학생 진행 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class Score {  
            /** 도입 */  
            private String intrdct;  
            /** 차시 평가 점수 */  
            private Integer clsSesionEvl;  
            /** AI 맞춤 점수 */  
            private Integer cstmzQitem;  
            /** 마무리 */  
            private String fnsh;  
        }  
    }  
  
    /**  
     * 오답노트 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class WransNoteAnswerInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 단원 순서 */  
        private Integer chptSeq;  
        /** 단원명 */  
        private String chptNm;  
        /** 복습 완료 수 */  
        private Integer cmptnCnt;  
        /** 복습 전 수 */  
        private Integer doNotCnt;  
        /** 총 오답 수 */  
        private Integer totCnt;  
        /** 학생별 복습 여부 정보 리스트 */  
        private List<WransInfo> wransList;  
  
        /**  
         * 오답 노트 문항 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class WransInfo {  
            /** 모듈 ID */  
            private Integer mdulId;  
            /** 연관 번호 */  
            private Integer relNo;  
            /** 연관 타입 */  
            private String relType;  
            /** 학생별 복습 여부 정보 리스트 */  
            private List<StdntInfo> stdntList;  
            /**  
             * 학생별 복습 여부 정보 DTO  
             */            @Getter  
            @Setter            @NoArgsConstructor            @AllArgsConstructor            public static class StdntInfo {  
  
                /** 모듈 ID */  
                @JsonIgnore  
                private Integer mdulId;  
                /** 연관 번호 */  
                @JsonIgnore  
                private Integer relNo;  
                /** 연관 타입 */  
                @JsonIgnore  
                private String relType;  
  
  
                /** 학생 ID */  
                private String stdntId;  
                /** 복습 여부 */  
                @JsonIgnore  
                private String pageLrnCmptnYn;  
                /**  
                 * 학생 복습 여부 정보  
                 * @return  
                 */  
                public Boolean getRetry() {  
                    return "Y".equals(pageLrnCmptnYn);  
                }  
            }  
        }  
    }  
  
    /**  
     * 오답노트 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class WransNoteInfo {  
        /** 단원 ID */  
        private Integer chptId;  
        /** 단원 순서 */  
        private Integer chptSeq;  
        /** 단원 명 */  
        private String chptNm;  
        /** 모듈 ID */  
        private Integer mdulId;  
        /** 모듈 순서 */  
        private Integer mdulSeq;  
        /** 모듈 명 */  
        private String mdulNm;  
        /** 등록일자 */  
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")  
        private Date regDt;  
        /** 문항별 풀이 시도 리스트 */  
        private List<WransNoteInfo.SlvTryDto> qitemSlvTryNmList;  
        /**  
         * 풀이 시도 정보 DTO  
         */        @Getter  
        @Setter        @NoArgsConstructor        @AllArgsConstructor        public static class SlvTryDto {  
            /** 연관 번호 */  
            private Integer relNo;  
            /** 연관 명 */  
            private String relNm;  
            /** 연관 타입 */  
            private String relType;  
            /** 오답노트번호 */  
            private Integer wranNoteNo;  
            /** 학생ID */  
            private String stdntId;  
            /** 문항풀이 시도 횟수 */  
            private Integer qitemSlvTryNm;  
        }  
    }  
    /**  
     * 강약점 정보 DTO  
     */    @Getter  
    @Setter    @NoArgsConstructor    @AllArgsConstructor    public static class StrWeakInfo {  
  
        /** 강점 리스트 */  
        private List<String> strongList;  
        /** 약점 리스트 */  
        private List<String> weakList;  
    }  
  
    /**  
     * AI학습관 (수학) 학생 진행 정보 리스트 변환  
     * @param list  
     * @return  
     */  
    public static List<LlmTchrDataSetDto.MathAILctrInfo.StudentProgressDto> toStudentProgressList(List<LlmMathAILctrScoreInfoDto> list){  
  
        List<LlmTchrDataSetDto.MathAILctrInfo.StudentProgressDto> resultList = new ArrayList<>();  
  
        for(LlmMathAILctrScoreInfoDto dto : list) {  
            LlmTchrDataSetDto.MathAILctrInfo.StudentProgressDto info = new MathAILctrInfo.StudentProgressDto();  
  
            info.setStdntId(dto.getStdntId());  
            info.setLrnPrgrsStts(dto.getLrnPrgrsStts());  
            info.setStudentType(dto.getStudentType());  
            // Score 한단계 더 생성  
            info.setScore(new MathAILctrInfo.Score(  
                    dto.getIntrdct(),  
                    dto.getClsSesionEvl(),  
                    dto.getCstmzQitem(),  
                    dto.getFnsh()  
            ));  
            resultList.add(info);  
        }  
        return resultList;  
    }  
  
    /**  
     * 오답노트 오답정보 리스트 변환  
     * @param map  
     * @return  
     */  
    public static List<WransNoteInfo> toWransNoteList(Map<LlmWransNoteInfoSlvTryDto, List<LlmWransNoteInfoSlvTryDto>> map) {  
        return map.entrySet().stream()  
                .map(entry -> {  
                    LlmWransNoteInfoSlvTryDto key = entry.getKey();  
                    List<LlmWransNoteInfoSlvTryDto> value = entry.getValue();  
  
                    LlmTchrDataSetDto.WransNoteInfo wransNoteInfo = new LlmTchrDataSetDto.WransNoteInfo();  
                    wransNoteInfo.setChptId(key.getChptId());  
                    wransNoteInfo.setChptNm(key.getChptNm());  
                    wransNoteInfo.setChptSeq(key.getChptSeq());  
                    wransNoteInfo.setMdulId(key.getMdulId());  
                    wransNoteInfo.setMdulNm(key.getMdulNm());  
                    wransNoteInfo.setMdulSeq(key.getMdulSeq());  
                    wransNoteInfo.setRegDt(key.getRegDt());  
                    wransNoteInfo.setQitemSlvTryNmList(LlmTchrDataSetDto.toSlvTryList(value));  
  
                    return wransNoteInfo;  
                })  
                .collect(Collectors.toList());  
    }  
  
    /**  
     * 오답노트 오답풀이 리스트 변환  
     * @param list 원본 DTO 리스트  
     * @return 변환된 DTO 리스트  
     */  
    public static List<WransNoteInfo.SlvTryDto> toSlvTryList(List<LlmWransNoteInfoSlvTryDto> list) {  
        return list.stream()  
                .map(dto -> {  
                    LlmTchrDataSetDto.WransNoteInfo.SlvTryDto slvTryDto = new LlmTchrDataSetDto.WransNoteInfo.SlvTryDto();  
                    slvTryDto.setQitemSlvTryNm(dto.getQitemSlvTryNm());  
                    slvTryDto.setRelNm(dto.getRelNm());  
                    slvTryDto.setRelNo(dto.getRelNo());  
                    slvTryDto.setRelType(dto.getRelType());  
                    slvTryDto.setWranNoteNo(dto.getWranNoteNo());  
                    slvTryDto.setStdntId(dto.getStdntId());  
                    return slvTryDto;  
                })  
                .collect(Collectors.toList());  
    }  
}
```