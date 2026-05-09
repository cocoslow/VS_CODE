OUT_T(X203, T400, R400); 
OUT_T(X200, T402, R402);
OUT_T(X280, T410, R410); OUT_T(X281, T411, R410);
OUT_T(X282, T412, R412); OUT_T(X283, T413, R410);
OUT_T(X284, T414, R414); 

OUT_T(X298, T416, R416); OUT_T(X299, T417, R416);
OUT_T(X29A, T418, R416); OUT_T(X29B, T419, R416);
OUT_T(X29C, T420, R416); 

OUT_T(X29E, T422, R416); OUT_T(X29F, T423, R416);
OUT_T(X10, T424, R416); OUT_T(X11, T425, R416);
OUT_T(X10, T518, R518); OUT_T(X11, T519, R519);
OUT_T(X10, T520, R520); OUT_T(X11, T521, R521);


OUT_T((X285 AND NOT X286)OR(M20 AND NOT M8400),T500,R500);
OUT_T((X286 AND NOT X285)OR(M20 AND NOT M8401),T501,R501);

OUT_T((X285 AND NOT X286)OR(M20 AND NOT M8400),T500,R500);
OUT_T((X286 AND NOT X285)OR(M20 AND NOT M8401),T501,R501);

OUT_T(NOT T201,T201,5);
IF X1 AND LDP(T201) THEN
	IF D24 > 0 THEN
		D24 := D24 * 2 ;
		ELSE 
		D24 := 1 ;
	END_IF ;
END_IF ;





// 
wBlockQty := 4 ; // 한 블록의 크기 (2워드)
wBuffLimit := 10 ;     // 최대 적재 개수
// --- 데이터 쓰기 (FIFW) ---
IF LDP(X0) & (wBlockCnt < wBuffLimit) THEN
    Z0 := wBlockCnt * wBlockQty ; // 저장 위치 오프셋 계산
    BMOV(wWriteVal, wBlockQty, awDataBuffer[Z0]) ;
    wBlockCnt := wBlockCnt + 1 ; // 현재 개수 증가
END_IF ;

// --- 데이터 읽기 및 시프트 (FIFR) ---
IF LDP(X2) & (wBlockCnt > 0) THEN
    // 1. 최상단 데이터 꺼내기 (awDest[0]로 2워드 복사)
    BMOV(awDataBuffer[0], wBlockQty, awDest[0]);
    // 2. 데이터 앞으로 당기기 (핵심!)
    // 두 번째 블록(index 1)부터의 모든 데이터를 첫 번째(index 0) 위치로 덮어씌움
    BMOV(awDataBuffer[wBlockQty],(wBlockCnt-1)*wBlockQty,awDataBuffer[0]) ;
    wBlockCnt := wBlockCnt - 1 ;   // 3. 개수 감소
    Z0 := wBlockCnt * wBlockQty ; // 4. 맨 뒤에 초기화
    FMOV(0, wBlockQty, awDataBuffer[Z0]); 
END_IF ;
