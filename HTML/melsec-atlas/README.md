# MELSEC 명령어 시각화 도감

## 파일 구성
| 경로 | 무엇 | 고칠 때 |
|---|---|---|
| `index.html` | **도감 전체 (원본)**. 화면·명령어·시뮬레이터·동기화 코드가 전부 이 파일 하나에 있음 | 대부분 이 파일만 고치면 됨 |
| `dist/MELSEC도감_오프라인.html` | 회사 PC용. index.html에 Tailwind를 통째로 넣은 버전 (외부 사이트 없이 열림) | index.html을 고친 뒤 다시 만들어야 함 (직접 고치지 말 것) |
| `apps-script/sync-server/Code.gs` | 동기화 서버 코드 (구글 Apps Script "MELSEC 도감 동기화 서버") | 거의 안 고침. 고치면 Apps Script에 붙여 넣고 "배포 관리 > 새 버전"으로 재배포 |
| `apps-script/host/Code.gs` | 구글 예비 주소용 코드 (Apps Script "MELSEC 도감 (회사용 주소)") | 안 고침. 이 프로젝트의 index.html만 새 내용으로 교체 후 재배포 |

## 주소
- 기본 (Cloudflare Workers, 이름 melsec-atlas)
  https://melsec-atlas.aoalfud0.workers.dev/
- 예비 (Google Apps Script)
  https://script.google.com/macros/s/AKfycbyEwVPtUeVejBy2ds4uYRkGTLXRwbugmnuoUl2Eg-qMSzOPLTvjUsX-GjtkXl-bY9Ke/exec
- 동기화 서버 (페이지 안 SYNC_URL 값)
  https://script.google.com/macros/s/AKfycbzcGJ4AwKKHv76ZrHHiymhGm_uG_-PVLnMXXxdYnTWCUrK7zB4t9Qsn6MiIGkbjsN5g/exec

## 데이터(메모·북마크·RND 기록)는 어디에?
이 폴더에는 없음. 구글 드라이브(aoalfud0@gmail.com) 루트의 `melsec-atlas-data.json`에 저장되고, 각 브라우저에도 사본(localStorage)이 있음.
→ 이 폴더를 지우거나 옮겨도 데이터는 안 사라짐.

## 고친 뒤 반영 순서
1. `index.html` 수정 → 브라우저로 열어 확인 (파일 더블클릭 또는 VS Code의 Live Server)
2. Cloudflare: 대시보드 > Workers & Pages > melsec-atlas > New deployment > index.html 업로드 > Deploy
3. 구글 예비 주소: Apps Script "MELSEC 도감 (회사용 주소)" > index.html 내용 교체 > 저장 > 배포 관리 > 연필 > 버전: 새 버전 > 배포
4. 회사용 파일: dist/ 오프라인 파일 다시 만들기 (index.html의 `<script src="https://cdn.tailwindcss.com"></script>` 줄을 Tailwind 스크립트 본문으로 교체)

## 주의
- 로컬 파일로 열어도 동기화는 됨 (인터넷 연결 필요).
- 테스트할 때 SYNC_URL을 그대로 두면 실제 드라이브 데이터와 동기화됨.
