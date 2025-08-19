import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/intro">
            시작하기 📚
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Welcome to ${siteConfig.title}`}
      description="Claude Code Setup Knowledge Base - Agents, Commands, and Documentation">
      <HomepageHeader />
      <main>
        <section className={styles.features}>
          <div className="container">
            <div className="row">
              <div className={clsx('col col--4')}>
                <div className="text--center">
                  <h3>🧠 Knowledge Base</h3>
                  <p>
                    Claude Code, MCP, RAG에 대한 상세한 기술 문서와 가이드
                  </p>
                </div>
              </div>
              <div className={clsx('col col--4')}>
                <div className="text--center">
                  <h3>🤖 AI Agents</h3>
                  <p>
                    전문화된 AI 에이전트들의 구성과 활용법
                  </p>
                </div>
              </div>
              <div className={clsx('col col--4')}>
                <div className="text--center">
                  <h3>⚡ Commands</h3>
                  <p>
                    자동화된 워크플로우와 명령어 모음
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}