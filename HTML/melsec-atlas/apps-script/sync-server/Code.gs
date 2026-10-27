/** MELSEC 도감 동기화 서버 (Google Apps Script)
 * 데이터: 내 드라이브의 melsec-atlas-data.json 한 파일 (북마크, 학습 메모, RND 기록, 화면 설정)
 * 이 프로젝트나 데이터 파일을 지우면 동기화가 멈춥니다. */
const FILE_NAME = 'melsec-atlas-data.json';
function getFile_() {
  const it = DriveApp.getFilesByName(FILE_NAME);
  if (it.hasNext()) return it.next();
  return DriveApp.createFile(FILE_NAME, JSON.stringify({ ts: 0, data: null }), 'application/json');
}
function read_() { try { return JSON.parse(getFile_().getBlob().getDataAsString()); } catch (e) { return { ts: 0, data: null }; } }
function out_(o) { return ContentService.createTextOutput(JSON.stringify(o)).setMimeType(ContentService.MimeType.JSON); }
/** 메모는 명령어별로 더 최근에 고친 쪽을 남긴다 (두 PC에서 다른 메모를 고쳐도 둘 다 유지) */
function mergeMemos_(a, b) {
  const r = Object.assign({}, a || {});
  Object.keys(b || {}).forEach(k => { if (!r[k] || (b[k].updated || 0) >= (r[k].updated || 0)) r[k] = b[k]; });
  return r;
}
function doGet() { return out_(read_()); }
function doPost(e) {
  const lock = LockService.getScriptLock(); lock.waitLock(15000);
  try {
    const body = JSON.parse(e.postData.contents || '{}');
    const cur = read_(), inc = body.data || {};
    const data = Object.assign({}, cur.data || {}, inc);
    data.memos = mergeMemos_(cur.data && cur.data.memos, inc.memos);
    const res = { ts: Date.now(), data: data };
    getFile_().setContent(JSON.stringify(res));
    return out_(res);
  } finally { lock.releaseLock(); }
}
