<context>
# AIDT Platform - Technical Reference
**System**: Microservices educational platform

## Architecture
### Core Services
| Service | Function | Stack |
|---------|----------|-------|
| **LMS API (aidt-lms-api)** | Orchestrator - classes, assignments, progress | Spring Boot 3.3.11, JWT, MyBatis |
| **Viewer API** | Content delivery, AI evaluation | Spring Boot, xAPI |
| **LCMS API** | Content creation/management | Spring Boot |
| **BO API** | Admin dashboard, analytics | Spring Boot |
| **SSO API** | KERIS auth integration | Spring Boot, JWT, Redis |

### Communication
| Service | Purpose | Protocol |
|---------|---------|----------|
| **SSE API** | Real-time notifications | Server-Sent Events |
| **WebSocket API** | Live classroom | STOMP/WebSocket |
| **Kafka** | Event streaming | 3-node cluster |
| **Redis** | Cache/sessions/routing | Pub/Sub |

### Frontend (Vue 3 + TypeScript + Vite)
- **lms-web**: Learning interface (3000)
- **viewer-web**: Content viewer (3001)  
- **lcms-web**: Content management (3002)
- **bo-web**: Admin portal (3003)
- **lms-chatbot**: AI assistant

## Service Flow
```
LMS API (Orchestrator)
├── LCMS-WAS → LCMS API    [OpenFeign]
├── BO-WAS → BO API        [OpenFeign]
├── Viewer API             [Direct/OpenFeign]
├── SSE API                [Direct]
└── External AI            [REST]
```

## Stack Summary
- **Backend**: Java 17, Spring Boot 3.3.11, MyBatis+JPA, MySQL 8.0 (Master/Slave), Redis
- **Frontend**: Vue 3 Composition API, TypeScript, Pinia
- **Infrastructure**: Docker/K8s, Jenkins, NCP/AWS S3
- **Domains**: mat.aidt.ai, eng.aidt.ai (multi-subject routing)

## Quick Start

### Backend
```bash
# Run each in separate terminal with --spring.profiles.active=dev
./gradlew bootRun --args='--spring.profiles.active=dev'
# Apply to: lms-api, viewer-api, lcms-api, bo-api, lms-sse-api, lms-websocket-api
```

### Frontend
```bash
npm run dev  # In each: lms-web, viewer-web, lcms-web, bo-web
```

## Dev Environment
```yaml
lcms: https://dev-bo.d-aidt.com:50002/lcms-was
bo: https://dev-bo.d-aidt.com:40002/bo-was
sse: https://dev.d-aidt.com/lms-sse-api
viewer: https://dev.d-aidt.com/v-api
redis: redisc-2a28g-kr.vpc-cdb.gov-ntruss.com:6379
kafka: 10.0.130.9-11:9092
```

## Auth Flow
KERIS SSO → SSO API → JWT → Redis → Service validation

## Database
- **Structure**: Independent DBs per service
- **Pattern**: Master (write) / Replica (read)
- **Pooling**: HikariCP optimized

## Utilities Project
- **aidt-demo**: Mock SSO testing
- **database-dump**: DDL scripts
- **aidt-api-bruno**: API testing
- **aidt-auto-login-tool**: Python automation

---
**Key Point**: LMS API orchestrates specialized services via OpenFeign (sync) and Kafka/Redis (async) while maintaining loose coupling.
</context>

<style>
## **Code Standards**
### **1. Naming**
| Priority | Rule | Exception |
|----------|------|-----------|
| MUST | Services: `*Service` interface, `*ServiceImpl` class | LLM/System integration |
| MUST | Controllers: `*Controller` suffix | DTO-only in webExh |
| MUST | Constants: `UPPER_SNAKE_CASE` | - |

### **2. Architecture**
| Priority | Rule | Exception |
|----------|------|-----------|
| MUST | Controller → Service only (no direct DAO) | Legacy: SampleRestController, WebExhController |
| SHOULD | `@Service` + Lombok `@RequiredArgsConstructor` | Stateless utils, interfaces |
| SHOULD | Service impl uses `@Transactional` | Batch/async/external APIs |

### **3. Error Handling**
| Priority | Rule | Exception |
|----------|------|-----------|
| SHOULD | `BusinessException` + `ErrorCode` | Legacy RuntimeException |
| MUST | Global handler → `ErrorResponse` + logging | - |
| MUST | Success → `SuccessResponse` via ResponseWrapper | Swagger/health endpoints |

### **4. Data Access**
| Priority | Rule | Exception |
|----------|------|-----------|
| MUST | DAO: MyBatis `@Mapper` + matching XML namespace | - |
| SHOULD | Mapper: CRUD prefixes (select/insert/update/delete) | Legacy get* |

**Core:** GlobalExceptionHandler + ResponseWrapper = unified responses
</style>

<rules>
## **DEVELOPMENT PROTOCOL**
**1. STABILITY** - Never break working code. Surgical changes only. Backward compatible always.
**2. BUILD RIGHT** - Deliver needs, not requests. Include: error handling, validation, sensible defaults. Skip unrelated features.
**3. TESTS PASS** - Green suite mandatory. Test new/changed code. Maintain performance & type safety.
**4. MVP → ITERATE** - Plan briefly → Build minimal → Test → Refactor → Document → Repeat by priority.
**5. FAIL SMART** - Diagnose → Try alternatives → Document decisions. After 3 attempts: skip & log in `IMPLEMENTATION_NOTES_YYYYMMDD.md`.
**6. READ EFFICIENT** - Start: README/entry/config. Open: affected modules + direct deps only. Skip: tests/docs/assets unless required.
**7. CLEAN ARCHITECTURE** - Domain structure. Single responsibility. Clear entry points. Descriptive names. Deprecated → `/legacy`.
**8. MATCH PROJECT STYLE**
   - **Python:** uv, ruff/black, pytest
   - **JS:** npm/yarn, prettier/eslint, jest/vitest  
   - **Java:** maven/gradle, junit
**9. DOCUMENT** - Code comments & public docs in Korean. Maintain IMPLEMENTATION_NOTES (summary/changes/decisions/tests/limits). Share progress.
**10. DONE = COMPLETE** - Features work. Errors handled. Tests added. Config externalized. README updated. Code formatted.
</rules>