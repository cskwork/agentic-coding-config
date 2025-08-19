# Claude Code Setup

Claude Code 설정 및 문서화를 위한 Docusaurus 사이트입니다.

## GitHub Pages

이 사이트는 GitHub Pages를 통해 호스팅됩니다:

**🌐 Live Site: https://cskwork.github.io/claude-code-setup/**

## 프로젝트 구조

- **docs/**: 문서 파일들
  - `agents/`: Claude Code 에이전트 설정
  - `commands/`: 사용자 정의 명령어
  - `knowledge/`: Claude Code, MCP, RAG 관련 지식베이스
- **src/**: Docusaurus 소스 파일
- **static/**: 정적 파일 (이미지, 파비콘 등)

## 개발

### 설치
```bash
npm install
```

### 로컬 개발 서버
```bash
npm start
```

### 빌드
```bash
npm run build
```

### 새 문서 추가 시 주의사항

새로운 문서를 `docs/` 폴더에 추가한 후에는 **반드시** `sidebars.js` 파일을 업데이트해야 합니다:

1. `docs/` 폴더에 새 마크다운 파일 추가
2. `sidebars.js`의 해당 카테고리에 파일 경로 추가
3. 로컬에서 테스트: `npm start`
4. 변경사항 커밋 및 푸시

**예시:**
```javascript
// sidebars.js
{
  type: 'category',
  label: 'Agents',
  items: [
    'agents/index',
    'agents/new-agent-name'  // <- 새 문서 추가
  ]
}
```

## 배포

GitHub Actions를 통해 자동으로 GitHub Pages에 배포됩니다.