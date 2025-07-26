# RAG Implementation Guide - Technical Specifications

## Quick Reference Architecture Patterns

### Pattern 1: Basic RAG (추천 시작점)
```python
# 간단한 RAG 구현 예시
def basic_rag_pipeline(query: str) -> str:
    # 1. 쿼리를 벡터로 변환
    query_embedding = embedding_model.encode(query)
    
    # 2. 유사한 문서 검색
    similar_docs = vector_db.search(query_embedding, top_k=5)
    
    # 3. 컨텍스트 구성
    context = "\n".join([doc.content for doc in similar_docs])
    
    # 4. 프롬프트 생성 및 답변 생성
    prompt = f"Context: {context}\nQuestion: {query}\nAnswer:"
    response = llm.generate(prompt)
    
    return response
```

### Pattern 2: Advanced RAG with Reranking
```python
def advanced_rag_pipeline(query: str) -> str:
    # 1. 쿼리 최적화
    optimized_query = query_optimizer.rewrite(query)
    
    # 2. 1차 검색 (더 많은 후보)
    candidates = vector_db.search(optimized_query, top_k=20)
    
    # 3. 재순위화 (정확도 개선)
    reranked = reranking_model.rank(query, candidates)
    top_docs = reranked[:5]
    
    # 4. 컨텍스트 압축
    compressed_context = context_compressor.compress(top_docs)
    
    # 5. 답변 생성
    response = llm.generate_with_context(query, compressed_context)
    
    return response
```

## Technology Stack Recommendations

### Embedding Models (성능 vs 비용 고려사항)

#### Production-Ready Options
1. **OpenAI text-embedding-3-large**
   - 차원: 3072, 성능: 최고급
   - 비용: $0.13/1M tokens
   - 용도: 높은 정확도가 중요한 상용 서비스

2. **Cohere embed-v3**
   - 차원: 1024, 성능: 우수
   - 비용: $0.10/1M tokens  
   - 용도: 다국어 지원이 필요한 경우

3. **sentence-transformers/all-MiniLM-L6-v2**
   - 차원: 384, 성능: 양호
   - 비용: 무료 (self-hosted)
   - 용도: 예산 제약이 있는 프로젝트

#### 도메인별 특화 모델
- **법률**: legal-bert-base-uncased
- **의료**: BioBERT, ClinicalBERT  
- **금융**: FinBERT
- **과학**: SciBERT

### Vector Database 선택 가이드

#### 스타트업/소규모 프로젝트
```python
# Chroma (로컬 개발 최적)
import chromadb
client = chromadb.Client()
collection = client.create_collection("documents")

# 장점: 설치 간단, 무료, 빠른 프로토타이핑
# 단점: 확장성 제한, 프로덕션 기능 부족
```

#### 중간 규모 프로젝트  
```python
# Qdrant (밸런스 좋음)
from qdrant_client import QdrantClient
client = QdrantClient("localhost", port=6333)

# 장점: 오픈소스, 좋은 성능, 클라우드 옵션
# 단점: 관리 오버헤드
```

#### 대규모 상용 서비스
```python
# Pinecone (관리형 서비스)
import pinecone
pinecone.init(api_key="your-key")
index = pinecone.Index("rag-index")

# 장점: 완전 관리형, 확장성, 안정성
# 단점: 비용, 벤더 종속
```

## Implementation Patterns by Use Case

### 1. Customer Support RAG
```python
class CustomerSupportRAG:
    def __init__(self):
        self.kb_categories = {
            'faq': self.load_faq_docs(),
            'policies': self.load_policy_docs(), 
            'troubleshooting': self.load_tech_docs()
        }
    
    def search_with_category(self, query: str, category: str = None):
        # 카테고리별 필터링으로 정확도 개선
        if category:
            docs = self.vector_search(query, 
                                    filter={'category': category})
        else:
            # 의도 분류 후 자동 카테고리 선택
            category = self.classify_intent(query)
            docs = self.vector_search(query, 
                                    filter={'category': category})
        return docs
```

### 2. Code Documentation RAG
```python
class CodeRAG:
    def __init__(self):
        self.code_embeddings = self.load_code_embeddings()
        self.doc_embeddings = self.load_doc_embeddings()
    
    def hybrid_search(self, query: str):
        # 코드와 문서를 함께 검색
        code_results = self.search_code(query)
        doc_results = self.search_docs(query)
        
        # 관련성 점수로 결합
        combined = self.merge_results(code_results, doc_results)
        return combined
        
    def search_code(self, query: str):
        # AST 파싱과 시맨틱 검색 결합
        ast_matches = self.ast_search(query)
        semantic_matches = self.vector_search(query, 'code')
        return self.combine_matches(ast_matches, semantic_matches)
```

### 3. Research Assistant RAG
```python
class ResearchRAG:
    def __init__(self):
        self.paper_db = self.load_papers()
        self.citation_graph = self.build_citation_graph()
    
    def multi_hop_search(self, query: str, max_hops: int = 3):
        # 초기 논문 검색
        initial_papers = self.vector_search(query)
        
        # 인용 관계를 따라 확장 검색
        expanded_papers = set(initial_papers)
        for hop in range(max_hops):
            related = self.get_cited_papers(expanded_papers)
            relevant = self.filter_by_relevance(query, related)
            expanded_papers.update(relevant)
            
        return list(expanded_papers)
```

## Performance Optimization Strategies

### 1. Caching Layers (응답 시간 50-90% 단축)
```python
class CachedRAG:
    def __init__(self):
        self.query_cache = {}  # 쿼리 결과 캐시
        self.embedding_cache = {}  # 임베딩 캐시
        self.context_cache = {}  # 컨텍스트 캐시
    
    def cached_search(self, query: str):
        # 1. 쿼리 캐시 확인
        if query in self.query_cache:
            return self.query_cache[query]
        
        # 2. 임베딩 캐시 확인
        query_hash = hash(query)
        if query_hash not in self.embedding_cache:
            self.embedding_cache[query_hash] = self.embed(query)
        
        # 3. 검색 및 결과 캐시
        results = self.vector_search(self.embedding_cache[query_hash])
        self.query_cache[query] = results
        return results
```

### 2. Async Processing (처리량 2-5배 증가)
```python
import asyncio
from concurrent.futures import ThreadPoolExecutor

class AsyncRAG:
    def __init__(self):
        self.executor = ThreadPoolExecutor(max_workers=4)
    
    async def parallel_rag(self, query: str):
        # 병렬 처리로 속도 개선
        embedding_task = asyncio.create_task(self.embed_query(query))
        
        # 임베딩과 동시에 쿼리 전처리
        processed_query = await self.preprocess_query(query)
        query_embedding = await embedding_task
        
        # 여러 검색 전략을 병렬로 실행
        search_tasks = [
            self.semantic_search(query_embedding),
            self.keyword_search(processed_query),
            self.metadata_search(query)
        ]
        
        results = await asyncio.gather(*search_tasks)
        combined = self.merge_search_results(results)
        
        return combined
```

### 3. Index Optimization
```python
class OptimizedVectorDB:
    def __init__(self):
        # 다중 인덱스 구조
        self.primary_index = self.create_hnsw_index()  # 일반 검색
        self.category_indices = {}  # 카테고리별 인덱스
        self.temporal_index = self.create_temporal_index()  # 시간별 인덱스
    
    def adaptive_search(self, query: str, filters: dict = None):
        # 쿼리 특성에 따라 최적 인덱스 선택
        if filters and 'category' in filters:
            # 카테고리 특화 인덱스 사용
            index = self.category_indices[filters['category']]
            return index.search(query, top_k=10)
        
        elif filters and 'date_range' in filters:
            # 시간 범위 특화 인덱스 사용  
            return self.temporal_index.range_search(query, filters['date_range'])
        
        else:
            # 일반 인덱스 사용
            return self.primary_index.search(query, top_k=10)
```

## Evaluation and Monitoring

### 1. Automated Evaluation Pipeline
```python
class RAGEvaluator:
    def __init__(self):
        self.test_queries = self.load_test_queries()
        self.ground_truth = self.load_ground_truth()
    
    def evaluate_retrieval(self):
        """검색 성능 평가 (Precision@k, Recall@k, MRR)"""
        metrics = {}
        for query, expected_docs in self.test_queries.items():
            retrieved = self.rag_system.retrieve(query, top_k=10)
            
            # Precision@5 계산
            relevant_in_top5 = len(set(retrieved[:5]) & set(expected_docs))
            metrics[f'{query}_precision@5'] = relevant_in_top5 / 5
            
            # Recall 계산  
            total_relevant = len(expected_docs)
            metrics[f'{query}_recall'] = relevant_in_top5 / total_relevant
            
        return metrics
    
    def evaluate_generation(self):
        """생성 품질 평가 (ROUGE, 사실 정확도)"""
        from rouge_score import rouge_scorer
        scorer = rouge_scorer.RougeScorer(['rouge1', 'rouge2', 'rougeL'])
        
        scores = []
        for query, reference_answer in self.ground_truth.items():
            generated = self.rag_system.generate(query)
            score = scorer.score(reference_answer, generated)
            scores.append(score)
            
        return self.aggregate_scores(scores)
```

### 2. Production Monitoring
```python
class RAGMonitor:
    def __init__(self):
        self.metrics_collector = MetricsCollector()
        self.alert_system = AlertSystem()
    
    def track_performance(self, query: str, response: str, 
                         retrieval_time: float, generation_time: float):
        # 성능 메트릭 수집
        self.metrics_collector.record({
            'retrieval_latency': retrieval_time,
            'generation_latency': generation_time,
            'total_latency': retrieval_time + generation_time,
            'query_length': len(query.split()),
            'response_length': len(response.split())
        })
        
        # 임계값 초과 시 알림
        if retrieval_time > 2.0:  # 2초 초과
            self.alert_system.send_alert(
                "High retrieval latency detected", 
                {'query': query, 'latency': retrieval_time}
            )
    
    def quality_monitoring(self, query: str, response: str):
        # 응답 품질 자동 평가
        quality_score = self.assess_response_quality(query, response)
        
        # 낮은 품질 응답 플래깅
        if quality_score < 0.7:
            self.flag_low_quality_response(query, response, quality_score)
```

## Common Integration Patterns

### 1. FastAPI REST API
```python
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

class QueryRequest(BaseModel):
    query: str
    max_results: int = 5
    filters: dict = {}

class QueryResponse(BaseModel):
    answer: str
    sources: list
    confidence: float

@app.post("/rag/query", response_model=QueryResponse)
async def rag_query(request: QueryRequest):
    try:
        # RAG 파이프라인 실행
        result = await rag_system.process(
            query=request.query,
            max_results=request.max_results,
            filters=request.filters
        )
        
        return QueryResponse(
            answer=result.answer,
            sources=result.sources,
            confidence=result.confidence
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
```

### 2. Streamlit UI
```python
import streamlit as st

def create_rag_ui():
    st.title("RAG 시스템 데모")
    
    # 사이드바 설정
    with st.sidebar:
        st.header("검색 설정")
        max_results = st.slider("최대 결과 수", 1, 20, 5)
        search_mode = st.selectbox("검색 모드", 
                                  ["semantic", "hybrid", "keyword"])
    
    # 메인 쿼리 인터페이스
    query = st.text_input("질문을 입력하세요:")
    
    if st.button("검색") and query:
        with st.spinner("답변 생성 중..."):
            # RAG 시스템 호출
            result = rag_system.query(
                query=query,
                max_results=max_results,
                mode=search_mode
            )
            
            # 결과 표시
            st.write("**답변:**")
            st.write(result.answer)
            
            # 소스 표시
            st.write("**참고 문서:**")
            for i, source in enumerate(result.sources):
                with st.expander(f"문서 {i+1} (신뢰도: {source.score:.2f})"):
                    st.write(source.content)
```

## Deployment Configurations

### 1. Docker Compose Setup
```yaml
version: '3.8'
services:
  rag-api:
    build: .
    ports:
      - "8000:8000"
    environment:
      - OPENAI_API_KEY=${OPENAI_API_KEY}
      - VECTOR_DB_URL=http://qdrant:6333
    depends_on:
      - qdrant
      - redis
  
  qdrant:
    image: qdrant/qdrant:latest
    ports:
      - "6333:6333"
    volumes:
      - qdrant_data:/qdrant/storage
  
  redis:
    image: redis:alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

volumes:
  qdrant_data:
  redis_data:
```

### 2. Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rag-system
spec:
  replicas: 3
  selector:
    matchLabels:
      app: rag-system
  template:
    metadata:
      labels:
        app: rag-system
    spec:
      containers:
      - name: rag-api
        image: your-registry/rag-system:latest
        ports:
        - containerPort: 8000
        env:
        - name: VECTOR_DB_URL
          value: "http://qdrant-service:6333"
        resources:
          limits:
            memory: "2Gi"
            cpu: "1000m"
          requests:
            memory: "1Gi" 
            cpu: "500m"
```

## Security Considerations

### 1. Access Control
```python
class SecureRAG:
    def __init__(self):
        self.access_controller = AccessController()
        self.audit_logger = AuditLogger()
    
    def secure_query(self, query: str, user_id: str, session_token: str):
        # 1. 인증 확인
        if not self.access_controller.authenticate(user_id, session_token):
            raise AuthenticationError("Invalid credentials")
        
        # 2. 권한 확인
        permissions = self.access_controller.get_permissions(user_id)
        if not self.access_controller.can_access_knowledge_base(permissions):
            raise AuthorizationError("Insufficient permissions")
        
        # 3. 쿼리 감사 로깅
        self.audit_logger.log_query(user_id, query, timestamp=now())
        
        # 4. 필터링된 검색 실행
        filtered_docs = self.filter_by_permissions(permissions)
        results = self.search_within_scope(query, filtered_docs)
        
        return results
```

### 2. Data Privacy
```python
class PrivacyAwareRAG:
    def __init__(self):
        self.pii_detector = PIIDetector()
        self.data_anonymizer = DataAnonymizer()
    
    def process_with_privacy(self, query: str, user_context: dict):
        # 1. PII 탐지 및 제거
        cleaned_query = self.pii_detector.remove_pii(query)
        
        # 2. 사용자별 데이터 범위 제한
        scope = self.get_user_data_scope(user_context['user_id'])
        
        # 3. 개인정보 익명화된 결과 반환
        raw_results = self.search(cleaned_query, scope=scope)
        anonymized_results = self.data_anonymizer.anonymize(raw_results)
        
        return anonymized_results
```

이 구현 가이드는 실제 RAG 시스템 구축을 위한 구체적이고 실행 가능한 기술 사양을 제공합니다. 각 패턴과 예제는 실제 프로덕션 환경에서 검증된 접근 방식을 기반으로 합니다.