# 📚 문제은행 (Quiz Bank) - WEB Version

> **한국폴리텍대학 성남캠퍼스 인공지능소프트웨어과 | 박세연**

## 📝 프로젝트 개요

- **과목명:** 스크립트언어실습 / 프로그래밍언어실습 (1학년 2학기)
- **진행 기간:** 2024.12 ~ 2024.12.18
- **개발 인원:** 1인 개발
- **제출일:** 2025.01.05
- **개발 목적:**  
  기말고사 프로젝트이자, 본인의 학습 효율을 높이기 위해 설계한 *시험 대비용 문제 은행 플랫폼*입니다.  
  사용자는 문제를 직접 등록하고, 모의 시험을 통해 자신의 학습 상태를 점검할 수 있습니다.

---

## 🌐 핵심 기능

| 분류 | 기능 |
|------|------|
| 사용자 기능 | 회원가입 / 로그인 / 로그아웃 (일반, 카카오) |
| 문제 관리 | 문제 등록 / 수정 / 삭제 (CRUD), 종류별/전체 보기 |
| 문제 정렬 | 최신순, 조회수순, 정답률 낮은순 |
| 시험 보기 | 랜덤 20문제 시험 (전체, 종류별), 시험리스트 기반 시험 |
| 시험 결과 | 총 점수, 과목별 맞은 문제 수, 틀린 문제 상세 확인 |
| 마이페이지 | 내가 푼 문제, 내가 등록한 문제, 시험리스트 확인 |
| 댓글 기능 | 문제별 댓글 및 대댓글 |
| 지도 이벤트 | 장소 검색 + 힌트 제공 + 크레딧 증정 |
| 관리자 기능 | 회원/문제/과목 관리, 통계 페이지

---

## 🛠 기술 스택 및 개발 환경

### 🔸 Front-End
- **HTML, CSS:** 웹 페이지 구조 및 스타일링
- **JavaScript:** 동적 기능 및 AJAX 처리

### 🔹 Back-End
- **Java:** 비즈니스 로직
- **JSP & Servlet:** 뷰 렌더링 + 요청 처리
- **MyBatis:** SQL 매핑 및 DB 처리

### ⚙️ 개발 환경
- **IDE:** Eclipse
- **WAS:** Apache Tomcat 10.1
- **DB:** Oracle Database + Oracle Developer

---

## 🗂️ 주요 화면

🏠 메인 페이지
![image](https://github.com/user-attachments/assets/f6d3a0d1-948d-4abc-b2dd-168990f88dea)
새로 추가된 문제, 인기 문제, 정답률 낮은 문제 TOP 4를 슬라이드 또는 그리드 형태로 시각화



📝 문제 리스트 페이지
![image](https://github.com/user-attachments/assets/5dcb1a38-9330-44c5-b1da-8c05f7d9cec6)
문제를 종류별로 정렬하거나, 최신순/조회수순/정답률 낮은순 필터를 적용하여 조회
![image](https://github.com/user-attachments/assets/012bf35c-d876-42cf-992b-ee448ed0eb6d)
페이징 처리되어 한 페이지에 문제 4개씩 표시


📄 문제 상세 페이지
![image](https://github.com/user-attachments/assets/500c83b1-3a70-4b32-89f4-fbe98b008fba)
문제 제목, 내용, 이미지, 해설, 정답 확인 + 시험리스트 담기
![image](https://github.com/user-attachments/assets/126811e1-7061-4e1e-950d-6ac1d7c330f0)
댓글, 대댓글 기능 포함 (AJAX 기반)


🧪 시험 페이지
![image](https://github.com/user-attachments/assets/0da7dfb4-bc47-4ac4-8acd-c1795008ec7a)
![image](https://github.com/user-attachments/assets/8a4f4d15-8513-4e1d-aedc-e652b6da9f5b)
1~20번 랜덤 문제 (전체 또는 종류별 선택), 10분 타이머, 객관식 보기 랜덤 출력
제출 시 점수 및 틀린 문제 피드백 제공


📊 시험 결과 페이지
![image](https://github.com/user-attachments/assets/c3ded252-b43b-40d7-8abf-f44fb6fb158d)
![image](https://github.com/user-attachments/assets/62162ff1-0a4f-45b9-a82f-0806c7fabb34)
시험 제출 후 총점 / 과목별 점수 / 맞은 개수 확인
틀린 문제는 상세 페이지 바로가기 버튼 제공


🧭 지도 이벤트 페이지
![image](https://github.com/user-attachments/assets/a8a84bc6-df6b-4169-a8dd-4f0d73d605e7)
카카오 지도 API를 통해 장소 검색 + 힌트 확인
참여 시 크레딧 제공 (이벤트 시스템)


🛠 관리자 페이지
![image](https://github.com/user-attachments/assets/f7e94d98-4847-4728-ad50-a74988938b1c)
회원 관리 / 문제 관리 / 과목 관리 등 전체 통계를 확인하고 관리 가능
![image](https://github.com/user-attachments/assets/be9f5282-09ea-4c71-8160-dc89fd7f8fec)
제재 기능 및 페이징 포함
---

## 🧩 DB 및 아키텍처 설계

### 📌 클라이언트-서버 구조

![image](https://github.com/user-attachments/assets/b2dbc6bc-467f-4df7-a5ac-6d9d6bd707b2)

[Client] ←→ [Controller(Servlet)] ←→ [Service] ←→ [DAO(MyBatis)] ←→ [Oracle DB]

### 📌 ERD 설계 요약

![image](https://github.com/user-attachments/assets/8da3e10c-ebf6-4255-97c6-57d79052b96d)

- `MEMBERS`, `QUIZS`, `QUIZ_COMMENT`, `SUBJECTS`, `MEMBER_CREDIT_FLOW`, `QUIZ_HINT` 등 10개 이상 테이블로 구성

> 테이블 명세는 보고서 참조

---

## ✅ 구현 내역 타임라인

| 날짜 | 구현 내용 |
|------|-----------|
| ~12.06 | 회원가입, 로그인, 문제 등록, 시험 시작 |
| ~12.11 | 마이페이지, 댓글 기능, 시험 결과 처리 |
| ~12.17 | 문제 정렬, 시험리스트 기능, 지도 이벤트 |
| ~01.05 | 관리자 페이지 전체, 필터 기능 최종 구현 |

---

## 📄 관리자 페이지 주요 기능

- **회원 관리:** 제재, 삭제, 제재 해제 등 관리 기능
- **문제 관리:** 전체 문제 확인 및 삭제 기능
- **과목 관리:** 과목명 CRUD
- **접근 통제:** 일반 사용자는 관리자 URL 접근 불가

---

## 📈 느낀 점

> 발표와 구현을 거치며 다음과 같은 개선 포인트를 깨달았습니다:

- DispatcherServlet, HandlerMapping 등 프레임워크 구조에 대한 이해 필요
- 기능 정의 → DB 설계 순서의 중요성
- JavaScript와 AJAX 이해 부족으로 어려움 있었음
- 관리자 페이지는 초기에 설계하는 것이 유지보수에 효과적
- 공백기 없이 꾸준히 개발하는 것이 핵심

---

## 📎 관련 문서

- **[프로젝트 보고서 다운로드](./2403110273.0105.docx)**  
  → 상세 기능 설명, 요구사항 명세서, 테이블 명세서, 기능명세서, 화면 설계 등 포함

---

## 🙋‍♂️ 개발자

| 이름 | 역할 |
|------|------|
| 박세연 | 기획 / 프론트 & 백엔드 개발 / DB 설계 / 보고서 작성 |

---
