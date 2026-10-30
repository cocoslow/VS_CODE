/** MELSEC 명령어 도감 - 구글 주소용 (workers.dev가 막힐 때 예비)
 * 같은 프로젝트의 index.html 파일 내용을 그대로 보여 줍니다. 동기화는 "MELSEC 도감 동기화 서버"가 담당합니다. */
function doGet() {
  return HtmlService.createHtmlOutputFromFile('index')
    .setTitle('MELSEC 명령어 시각화 도감')
    .addMetaTag('viewport', 'width=device-width, initial-scale=1')
    .setXFrameOptionsMode(HtmlService.XFrameOptionsMode.ALLOWALL);
}
