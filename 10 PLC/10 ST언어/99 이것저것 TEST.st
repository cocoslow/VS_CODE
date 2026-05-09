// { #region [1] IF END_IF (조건문 기초)
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    단축키
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
 - 한줄 또는 선택일괄 주석처리: [Ctrl] + [Shift] + [S]
 - 일괄 주석해제: [Ctrl] + [Shift] + [D]
 - 대입 연산자 :=: [Ctrl] + [Shift] + [ - ]
 - 스니펫: IF, FOR 치고 [Ctrl] + [Space] + [A] 누르면 자동완성
 - 라벨등록: 라벨 치고 [Alt] + [F2] 누르고 지역 / 전역 선택등록
 - 행 이동, 줄바꿈: 바꾸고 싶은 줄에 커서를 두고 [Ctrl] + [Shift] + [Up / Down]



 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
                                        IF END_IF
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

IF Condition1 THEN
    처리문1; // On 일때 실행
END_IF;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
IF Condition1 THEN
    처리문1; // On일때 실행
ELSE
    처리문2; // Off일때 실행
END_IF;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
IF Condition1 < 20 THEN
    처리문1; // 20 미만 실행
    ELSIF Condition2 < 40 THEN
    처리문2; // 20이상 40 미만 실행
    ELSIF Condition3 < 60 THEN
    처리문3; // 40이상 60 미만 실행
    ELSE
    처리문4; // 60이상 모든 경우 실행
END_IF;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IF Condition1 THEN // [1단계] 메인 조건 (예: 장비 전원 On)
    처리문1; // Condition1이 참일 때만 실행
    IF Condition2 THEN // [2단계] 서브 조건 (예: 운전 모드 자동)
        처리문2; // Condition1과 Condition2가 모두 참일 때 실행
        IF Condition3 THEN // [3단계] 최종 확인 (예: 에러 없음)
            처리문3; // 모든 조건(1, 2, 3)이 참일 때만 실행되는 핵심 로직
        END_IF; // Condition3 체크 종료
    END_IF; // Condition2 체크 종료
END_IF; // Condition1 체크 종료 (전체 로직 마감)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IF Condition1 THEN
    처리문1; // [조건 1]이 참일 때 실행
    ELSIF Condition2 THEN
    처리문2; // [조건 1]은 거짓이지만, [조건 2]가 참일 때 실행
    ELSIF Condition3 THEN
    처리문3; // [앞의 조건들]은 모두 거짓이고, [조건 3]이 참일 때 실행
    ELSE
    모든 조건이 아닐 때 처리; // 위에서 제시한 모든 조건(1, 2, 3)이 거짓일 때 실행 (예외 처리)
END_IF; // 조건문 종료
// } #endregion

// { #region [2] FOR NEXT (반복문 - 횟수 중심)
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
                                        FOR NEXT
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

□ 초기 값: i := 0
□ 종료 값: TO 3	0, 1, 2, 3 총 4회 카운팅
□ 증분 값: BY 1	1씩 증가
□ 실행: DO 실행해라
FOR VAR TO Num DO

END_FOR;
 - - -
FOR VAR TO Num BY 1 DO

END_FOR;


 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
문제
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
 (* 변수 선언
WORD:
ARRAY [1..10] OF INT:
BOOL:
 *)

01 1부터 10까지 합 (1 + 2 + 3... + 10) // nSum
02 11회 반복 횟수 카운트 // nCounter = 11
03 5부터 1까지 감소 (역순) (5, 4, 3, 2, 1) // nValue
04 2의 제곱승 // 2의 3승 = 8 // nResult, nEnd
05 배열 초기화 (1~5번 요소) // arrData, wRnd
06 배열 요소 총합 (값: 10, 20, 30) // arrList
07 - 1 배열에서 최댓값 찾기 (값: 5, 12, 8) // nMax
07 - 2 배열에서 최솟값 찾기 (값: 5, 12, 8) // nMin
08 특정 값 찾기 및 탈출 (EXIT) // nPos, arrFind
09 불량 개수 세기 (음수 찾기) // nErrCnt, arrCheck

10 짝수만 합산 // nEvenSum
11 구구단 3단 계산 // arrGugu
12 2중 FOR문 (2x2 행렬) // nTick, Idx1, Idx2
13 데이터 필터링 (10 초과인 것만 복사) // arrIn, arrOut
14 평균값 계산 (정수 - > 실수) // arrV
15 데이터 Shift (오른쪽으로 밀기) // arrShift
16 비트 카운팅 (8비트 중 켜진 비트 수) // nBitCount, wDada
17 팩토리얼 계산 (4!) // nFact (1*2*3*4)
18 불량 발생 여부 체크 (Flag) // bError ,arrSt[1..5]
    배열 = 1 이면 불량
19 배열 좌우 반전 (1, 2, 3, 4 - > 4, 3, 2, 1) // arrRev

20 특정 값 건너뛰기 (CONTINUE) // nSkip
21 1부터 5까지 제곱의 합 (1 * 1 + 2 * 2 + ... + 5 * 5) // nSumSquare
22 배열에서 특정 숫자(7)의 개수 세기 // nSevenCount, arrInput
23 50보다 큰 값들의 평균 구하기 (실수형 처리) // nSumHigh, nCntHigh, fAvgHigh
24 배열의 모든 요소 총곱 // nSumMul, arrValue
25 A배열의 짝수만 B배열로 복사하기 // wCalc, arrA, arrB
26 피보나치 수열 10개 항 구하기 (1, 1, 2, 3, 5...) // arrFib
27 두 배열이 똑같은지 비교 (ARRAY Compare) // arrSource, arrDest, bIsEqual, bIsEqual
28 배열 내 데이터 변화(Edge) 발생 횟수 찾기 // arrSignal, nEdgeCount
29 ★ 간단한 3포인트 이동 평균 (Moving Average) // arrRaw, arrSmooth

30 8개 BOOL 비트를 하나의 INT로 합치기 (Bit Packing) // arrBits, nWordResult
31 5의 3승(125) 계산하기 (FOR문 활용) // nPowerResult
32 배열에서 0이 아닌 값 중 최솟값 찾기 // arrValues, nMinNonZero
33 배열 전체 배율 조정 (Scaling: 10배 확대) // arrOriginal, arrScaled
34 두 배열의 내용 서로 맞바꾸기 (Swap All) // arrA, arrB, nTemp
35 특정 값의 인덱스 찾기 (없으면 - 1) // arrTarget, nSearchValue, nFoundIdx
36 홀수 데이터의 개수만 세기 // arrData, nOddCount
37 짝수 번째 인덱스(2, 4, 6...)의 합계만 구하기 // arrData, nEvenIdxSum
38 버블 정렬 1단계 (가장 큰 수를 맨 끝으로 보내기) // arrSort, nTemp
39 배열을 10, 20, 30... 순서로 채우기 // arrSequence

40 데이터 스케일링 (REAL 연산)
41 배열 요소 간의 편차 계산
42 배열 짝수 / 홀수 분리 (Sorting 기초)
43 데이터 스케일링 (16비트 정수 - > 퍼센트 실수)
44 배열 요소 Shift (오른쪽으로 한 칸 이동)
45 배열 데이터의 평균값 계산 (REAL 변환 포함)
46 배열 데이터의 상한 / 하한 제한 (Limit / Clamping)
47 배열 요소의 순차적 비교 (Rising Edge 감지 모사)
48 배열 내 특정 값 이상인 요소의 평균 구하기
49 배열 데이터 중 0을 찾아 뒤로 밀기 (Data Packing)
50 2차원 배열의 대각선 요소 합계 (Trace)
51



// == 프로그램 작성 ==



// == 여기까지 ==






01. 1부터 10까지 1씩 증가
(* 변수 선언
WORD: nSum
WORD: Idx
ARRAY [1..10] OF INT:
BOOL: bChk
 *)
nSum := 0;
FOR Idx := 1 TO 10 DO // [실행횟수]: 10회
    nSum := nSum + i; // [결과]: nSum = 55 (1+2+3...+10)
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
02. 11회 반복 횟수 카운트 (BY 10)
(* 변수 선언
WORD: nCounter

ARRAY [1..10] OF INT:
BOOL:
 *)
nCounter := 0;
FOR Idx := 0 TO 10 BY 1 DO // [실행횟수]: 11회 (0, 10, 20... 100)
    nCounter := nCounter + 1; // [결과]: nCounter = 11
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
03. 5부터 1까지 감소 (역순)
(* 변수 선언
WORD: nValue
ARRAY [1..10] OF INT:
BOOL:
 *)
nValue := 100;
FOR Idx := 5 TO 1 BY - 1 DO // [실행횟수]: 5회 (5, 4, 3, 2, 1)
    nValue := nValue - 10; // [결과]: nValue = 50
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
04. 변수를 이용한 범위 (nEnd = 3일 때)
(* 변수 선언
WORD: nEnd, nResult
ARRAY [1..10] OF INT:
BOOL:
 *)
nEnd := 3;
nResult := 1;
FOR Idx := 1 TO nEnd DO // [실행횟수]: 3회
    nResult := nResult * 2; // [결과]: nResult = 8 (1*2*2*2)
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
05. 배열 초기화 (1~5번 요소)
(* 변수 선언
WORD: wRnd
ARRAY [1..10] OF INT: arrData
BOOL:
 *)
// 난수발생
IF X0 THEN
	FOR IDX := 1 TO 9 DO
		RND(wRnd); // [결과]: wRnd에 0~32767 사이의 난수 저장
		IF wRnd >= 100 AND wRnd < 500 THEN // 100~499 사이의 난수만 배열에 저장
			arrwData[Idx] := wRnd ; // [결과]: arrwData[1]~arrwData[9]에 100~499 사이의 난수 저장
		END_IF ;
	END_FOR ;
END_IF ;

IF X1 THEN // 배열 삭제
	FOR Idx	:= 1 TO 9 DO
	arrwData[Idx] := 0 ; // [결과]: arrwData[1]~arrwData[9] 모두 0으로 설정
	END_FOR;
END_IF ;


 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
06. 배열 요소 총합 (값: 10, 20, 30)
(* 변수 선언
WORD: nTotal
ARRAY [1..10] OF INT: arrList
BOOL:
 *)
nSum := 0 ;
IF X1 THEN
	FOR IDX := 0 TO 9 DO
		RND(wRnd); // [결과]: wRnd에 0~32767 사이의 난수 저장
		IF wRnd >= 1 AND wRnd <= 10 THEN // 1~10 사이의 난수만 배열에 저장
			arrwList[Idx] := wRnd ; // [결과]: arrwList[1]~arrwList[9]에 1~10 사이의 난수 저장
		END_IF ;
	END_FOR ;
END_IF ;

FOR IDX := 0 TO 9 DO
	nSum := nSum + arrwList[Idx] ; // [결과]: nSum = arrwList[0] + arrwList[1] + ... + arrwList[9]
END_FOR;
WSUM(1, arrwList[0], 10, D100); // [결과]: D100 = arrwList[0] + arrwList[1] + ... + arrwList[9]
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
7 - 1 배열에서 최댓값 찾기 (값: 5, 12, 8)
(* 변수 선언
WORD: nMax, nMin
ARRAY [1..10] OF INT: arrData
BOOL:
 *)
IF X2 THEN
	FOR IDX := 0 TO 9 DO
		RND(wRnd); // [결과]: wRnd에 0~32767 사이의 난수 저장
		IF wRnd >= 1 AND wRnd <= 1000 THEN // 1~1000 사이의 난수만 배열에 저장
			arrwList[Idx] := wRnd ; // [결과]: arrwList[1]~arrwList[9]에 1~1000 사이의 난수 저장
		END_IF ;
	END_FOR ;
END_IF ;

nMax := arrwList[0]; // [결과]: nMax = arrwList[0]
nMin := arrwList[0]; // [결과]: nMin = arrwList[0]
FOR IDX := 0 TO 9 DO
	IF nMax < arrwList[IDX] THEN
		nMax := arrwList[Idx] ; // [결과]: nMax = arrwList[IDX]
		ELSIF nMin > arrwList[Idx ] THEN
		nMin := arrwList[Idx] ; // [결과]: nMin = arrwList[IDX]
	END_IF ;
END_FOR ;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
08. 특정 값 찾기 및 탈출 (EXIT)
(* 변수 선언
WORD: nPos
ARRAY [1..10] OF INT: arrFind
BOOL:
 *)
arrFind[1] := 10; arrFind[2] := 99; arrFind[3] := 30;
nPos := 0;
FOR Idx := 1 TO 3 DO // [실행횟수]: 2회 (99를 찾고 즉시 종료)
    IF arrFind[Idx] = 99 THEN
        nPos := Idx; // [결과]: nPos = 2
        EXIT;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
09. 불량 개수 세기 (음수 찾기)
(* 변수 선언
WORD: nErrCnt
ARRAY [1..10] OF INT: arrCheck
BOOL:
 *)
arrCheck[1] := 5; arrCheck[2] := - 1; arrCheck[3] := - 3;
nErrCnt := 0;
FOR Idx := 1 TO 3 DO // [실행횟수]: 3회
    IF arrCheck[Idx] < 0 THEN
        nErrCnt := nErrCnt + 1; // [결과]: nErrCnt = 2
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
10. 짝수만 합산
(* 변수 선언
WORD: nEvenSum
ARRAY [1..10] OF INT:
BOOL:
 *)
nEvenSum := 0;
FOR Idx := 1 TO 4 DO // [실행횟수]: 4회
    IF (Idx MOD 2 = 0) THEN
        nEvenSum := nEvenSum + Idx; // [결과]: nEvenSum = 6 (2+4)
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
11. 구구단 3단 계산
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrGugu
BOOL:
 *)
FOR Idx := 1 TO 3 DO
    arrGugu[Idx] := 3 * Idx; // [결과]: arrGugu[1]=3, [2]=6, [3]=9
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
12. 2중 FOR문 (2x2 행렬)
(* 변수 선언
WORD: nTick, Idx1, Idx2
ARRAY [1..10] OF INT:
BOOL:
 *)
nTick := 0;
FOR Idx1 := 1 TO 2 DO // [실행횟수]: 4회 (외측 2 * 내측 2)
    FOR Idx2 := 1 TO 2 DO
        nTick := nTick + 1; // [결과]: nTick = 4
    END_FOR;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
13. 데이터 필터링 (10 초과인 것만 복사)
(* 변수 선언
WORD: k
ARRAY [1..10] OF INT: arrIn, arrOut
BOOL:
 *)
arrIn[1] := 5; arrIn[2] := 15; arrIn[3] := 20;
k := 1;
FOR Idx := 1 TO 3 DO
    IF arrIn[Idx] > 10 THEN
        arrOut[k] := arrIn[Idx];
        k := k + 1; // [결과]: arrOut[1]=15, arrOut[2]=20, k=3
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
14. 평균값 계산 (정수 - > 실수)
(* 변수 선언
WORD: nSum
ARRAY [1..10] OF INT: arrV
BOOL:
 *)
arrV[1] := 10; arrV[2] := 20;
nSum := 0;
FOR Idx := 1 TO 2 DO
    nSum := nSum + arrV[Idx]; // [결과]: fAvg = 15.0
END_FOR;
fAvg := INT_TO_REAL(nSum) / 2.0;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
15. 데이터 Shift (오른쪽으로 밀기)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: awTest
BOOL:
 *)
IF LDP(X0) THEN
	FOR Idx := 9 TO 1 BY - 1 DO // 총 10번 반복
		awTest[Idx] := awTest[Idx - 1] ; // "현재 칸(Idx)에 이전 칸(Idx-1)의 값을 복사
	END_FOR ;
END_IF ;
// 보충설명
// Idx=9일 때: awTest[9]에 awTest[8] 값을 넣음.
// Idx=8일 때: awTest[8]에 awTest[7] 값을 넣음.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
16. 비트 카운팅 (8비트 중 켜진 비트 수)
(* 변수 선언
WORD: wData, nBitCount
ARRAY [1..10] OF INT:
BOOL:
 *)
// wData = 2#0000_1011 (값: 11)
nBitCount := 0;
FOR Idx := 0 TO 7 DO
    IF CHECK_BIT(wData, Idx) THEN
        nBitCount := nBitCount + 1; // [결과]: nBitCount = 3
    END_IF;
END_FOR;

// 미쯔비시
SUM(D12, wBitCnt);
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
17. 팩토리얼 계산 (4!)
(* 변수 선언
WORD: nFact
ARRAY [1..10] OF INT:
BOOL:
 *)
nFact := 1;
FOR Idx := 1 TO 4 DO
    nFact := nFact * Idx; // [결과]: nFact = 24 (1*2*3*4)
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
18. 불량 발생 여부 체크 (Flag)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrSt
BOOL: bError
 *)
arrSt[1] := 0; arrSt[2] := 1; arrSt[3] := 0; // 1이면 에러
bError := FALSE;
FOR Idx := 1 TO 3 DO // [실행횟수]: 2회 (2번에서 에러 발견 후 탈출)
    IF arrSt[Idx] = 1 THEN
        bError := TRUE; // [결과]: bError = TRUE
        EXIT;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
19. 배열 좌우 반전 (1, 2, 3, 4 - > 4, 3, 2, 1)
(* 변수 선언
WORD: nTemp
ARRAY [1..10] OF INT: arrRev
BOOL:
 *)
// 원리 생략하고 4개 요소 기준
FOR Idx := 1 TO 2 DO
    nTemp := arrRev[Idx];
    arrRev[Idx] := arrRev[5 - Idx];
    arrRev[5 - Idx] := nTemp; // [결과]: 요소 위치가 서로 바뀜
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
20. 짝수 배열만 + 1 (CONTINUE)
(* 변수 선언
WORD: nSkip, nMod
ARRAY [1..10] OF INT:
BOOL: bMod
 *)
nSkip := 0 ; // 짝수가 발견된 방 번호(Idx)를 더해나갈 변수
nMod := 0 ; // // 나눗셈의 나머지를 저장할 변수
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
	nMod := MOD_E(1, bMod, awTest[Idx], 2) ; // [결과]: nMod = 0

	IF nMod = 0 THEN // 나머지가 0이라면 (즉, 배열의 값이 짝수라면)
		nSkip := nSkip + Idx ; // 현재 방 번호(Idx)를 nSkip에 누적해서 더함
	END_IF ;
END_FOR ;

```Test
배열 번호 (Idx), 데이터 예시 (awTest), 짝수 여부, nSkip 계산 과정
awTest[0], 1 (홀수), X, 0
awTest[1], 2 (짝수), O, 0 + 1 = 1
awTest[2], 3 (홀수), X, 1
awTest[3], 4 (짝수), O, 1 + 3 = 4
awTest[4], 5 (홀수), X, 4
awTest[5], 6 (짝수), O, 4 + 5 = 9
awTest[6], 7 (홀수), X, 9
awTest[7], 8 (짝수), O, 9 + 7 = 16
awTest[8], 9 (홀수), X, 16
awTest[9], 10 (짝수), O, 16 + 9 = 25
최종 결과, , , nSkip = 25

```
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
21. 1부터 5까지 제곱의 합 (1 * 1 + 2 * 2 + ... + 5 * 5)
(* 변수 선언
WORD: nSumSquare
ARRAY [1..10] OF INT:
BOOL:
 *)
nSumSquare := 0;
FOR Idx := 1 TO 5 DO
    nSumSquare := nSumSquare + (Idx * Idx);
END_FOR; // [실행횟수]: 5회 // [결과]: nSumSquare = 55
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
22. 배열에서 특정 숫자(7)의 개수 세기
(* 변수 선언
WORD: nSevenCount
ARRAY [1..10] OF INT: arrInput
BOOL:
 *)
nSevenCount := 0;
arrInput := [1, 7, 3, 7, 5]; // 예시 배열
FOR Idx := 1 TO 5 DO
    IF arrInput[Idx] = 7 THEN nSevenCount := nSevenCount + 1; END_IF;
END_FOR; // [실행횟수]: 5회 // [결과]: nSevenCount = 2
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
23. 50보다 큰 값들의 평균 구하기 (실수형 처리)
(* 변수 선언
WORD: nSumHigh, nCntHigh
ARRAY [1..10] OF INT: arrData
BOOL:
 *)
nSumHigh := 0; nCntHigh := 0;
FOR Idx := 1 TO 5 DO
    IF arrData[Idx] > 50 THEN
        nSumHigh := nSumHigh + arrData[Idx];
        nCntHigh := nCntHigh + 1;
    END_IF;
END_FOR;
IF nCntHigh > 0 THEN fAvgHigh := INT_TO_REAL(nSumHigh) / INT_TO_REAL(nCntHigh); END_IF;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
24. 배열의 모든 요소 총곱 (Product)
(* 변수 선언
WORD: nSumMul
ARRAY [1..10] OF INT: arrValue
BOOL:
 *)
nSumMul := 1;
FOR Idx := 1 TO 4 DO
    nSumMul := nSumMul * arrValue[Idx];
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
25. A배열의 짝수만 B배열로 복사하기
(* 변수 선언
WORD: wCalc
ARRAY [1..10] OF INT: arrA, arrB
BOOL:
 *)
wCalc := 1;
FOR Idx := 1 TO 10 DO
    IF (arrA[Idx] MOD 2 = 0) THEN
        arrB[wCalc] := arrA[Idx];
        wCalc := wCalc + 1;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
26. 피보나치 수열 10개 항 구하기 (1, 1, 2, 3, 5...)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrFib
BOOL:
 *)
arrFib[1] := 1; arrFib[2] := 1;
FOR Idx := 3 TO 10 DO
    arrFib[Idx] := arrFib[Idx - 1] + arrFib[Idx - 2];
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
27. 두 배열이 똑같은지 비교 (ARRAY Compare)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrSource, arrDest
BOOL: bIsEqual
 *)
bIsEqual := TRUE;
FOR Idx := 1 TO 5 DO
    IF arrSource[Idx] <> arrDest[Idx] THEN
        bIsEqual := FALSE;
        EXIT;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
28. 배열 내 데이터 변화(Edge) 발생 횟수 찾기
(* 변수 선언
WORD: nEdgeCount
ARRAY [1..10] OF INT: arrSignal
BOOL:
 *)
nEdgeCount := 0;
FOR Idx := 1 TO 9 DO
    IF arrSignal[Idx] <> arrSignal[Idx + 1] THEN nEdgeCount := nEdgeCount + 1; END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
29. 간단한 3포인트 이동 평균 (Moving Average)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrRaw, arrSmooth
BOOL:
 *)
FOR Idx := 1 TO 8 DO
    arrSmooth[Idx] := (arrRaw[Idx] + arrRaw[Idx + 1] + arrRaw[Idx + 2]) / 3;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
30. 8개 BOOL 비트를 하나의 INT로 합치기 (Bit Packing)
(* 변수 선언
WORD: nWordResult
ARRAY [1..10] OF INT: arrBits
BOOL:
 *)
nWordResult := 0;
FOR Idx := 0 TO 7 DO
    IF arrBits[Idx] THEN
        nWordResult := nWordResult + REAL_TO_INT(EXPT(2, Idx));
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
31. 5의 3승(125) 계산하기 (FOR문 활용)
(* 변수 선언
WORD: nPowerResult
ARRAY [1..10] OF INT:
BOOL:
 *)
nPowerResult := 1;
FOR Idx := 1 TO 3 DO
    nPowerResult := nPowerResult * 5;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
32. 배열에서 0이 아닌 값 중 최솟값 찾기
(* 변수 선언
WORD: nMinNonZero
ARRAY [1..10] OF INT: arrValues
BOOL:
 *)
nMinVal := 32767; // 최대값으로 초기화
FOR Idx := 0 TO 9 BY 1 DO // 인덱스 0부터 9까지 반복
	IF (awTest[Idx] <> 0) & (nMinVal > awTest[Idx]) THEN // 0이 아니고, 현재 nMinVal보다 작으면
		nMinVal := awTest[Idx]; // 값을 갱신
	END_IF;
END_FOR; // 반복 종료
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
33. 배열 전체 배율 조정 (Scaling: 10배 확대)
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrScaled, arrOriginal
BOOL:
 *)
FOR Idx := 1 TO 10 DO // 1부터 10까지 반복
    arrScaled[Idx] := arrOriginal[Idx] * 10; // 값을 10배로 갱신
END_FOR; // 반복 종료
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

34. 두 배열의 내용 서로 맞바꾸기 (Swap All)
(* 변수 선언
WORD: nTemp
ARRAY [1..10] OF INT: arrA, arrB
BOOL:
 *)
nTemp := 0 ;
IF LDP(X0) THEN
    FOR Idx := 0 TO 9 DO
        nTemp := arrwA[Idx];
        arrwA[Idx] := arrwB[Idx] ;
        arrwB[Idx] := nTemp;
    END_FOR;
END_IF;

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
35. 특정 값의 인덱스 찾기 (없으면 - 1)
(* 변수 선언
WORD: nFoundIdx, nSearchValue
ARRAY [1..10] OF INT: arrTarget
BOOL:
 *)
nFoundIdx := - 1;
FOR Idx := 1 TO 10 DO
    IF arrTarget[Idx] = nSearchValue THEN
        nFoundIdx := Idx;
        EXIT;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
36. 홀수 데이터의 개수만 세기
(* 변수 선언
WORD: nOddCount
ARRAY [1..10] OF INT: arrData
BOOL:
 *)
nOddCount := 0;
FOR Idx := 1 TO 10 DO
    IF (arrData[Idx] MOD 2 <> 0) THEN nOddCount := nOddCount + 1; END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
37. 짝수 번째 인덱스(2, 4, 6...)의 합계만 구하기
(* 변수 선언
WORD: nEvenIdxSum
ARRAY [1..10] OF INT: arrData
BOOL:
 *)
nEvenIdxSum := 0;
FOR Idx := 2 TO 10 BY 2 DO
    nEvenIdxSum := nEvenIdxSum + arrData[Idx];
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
38. 버블 정렬 1단계 (가장 큰 수를 맨 끝으로 보내기)
(* 변수 선언
WORD: nTemp
ARRAY [1..10] OF INT: arrSort
BOOL:
 *)
FOR Idx := 1 TO 4 DO
    IF arrSort[Idx] > arrSort[Idx + 1] THEN
        nTemp := arrSort[Idx];
        arrSort[Idx] := arrSort[Idx + 1];
        arrSort[Idx + 1] := nTemp;
    END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
39. 배열을 10, 20, 30... 순서로 채우기
(* 변수 선언
WORD:
ARRAY [1..10] OF INT: arrSequence
BOOL:
 *)
FOR Idx := 1 TO 10 DO
    arrSequence[Idx] := Idx * 10;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
40. 데이터 스케일링 (REAL 연산)
Delphi
(* 변수 선언
Word: Idx
Array [0..4] OF INT: awRawData
Array [0..4] OF REAL: aeScaledData
Bool:
 *)

// 정수형 원시 데이터를 실수형(REAL)으로 변환하면서
// 0.1을 곱해 스케일링하는 로직이야. (예: 123 -> 12.3)

FOR Idx := 0 TO 4 DO
    awRawData[Idx] := (Idx + 1) * 123;
    aeScaledData[Idx] := INT_TO_REAL(awRawData[Idx]) * 0.1;
END_FOR;

// awRawData[0]=123, [1]=246, [2]=369, [3]=492, [4]=615
// aeScaledData[0]=12.3, [1]=24.6, [2]=36.9, [3]=49.2, [4]=61.5
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
41. 배열 요소 간의 편차 계산
(* 변수 선언
Word: wIdx
Array [0..9] OF INT: awCurrent, awPrev, awDiff
Bool:
 *)
// 현재 값과 이전 값의 차이(편차)를 구해 기록하는 로직.
FOR wIdx := 0 TO 9 DO // [실행횟수]: 10회
    awDiff[wIdx] := ABS(awCurrent[wIdx] - awPrev[wIdx]); // [결과]: 절대값 편차 저장
END_FOR;

// 결과값:
// awCurrent[0]=100, awPrev[0]=95 라면
// awDiff[0]=5
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
42. 배열 짝수 / 홀수 분리 (Sorting 기초)
(* 변수 선언
Word: wIdx, wEvenIdx, wOddIdx
Array [0..9] OF INT: awSrc, awEven, awOdd
Bool:
 *)
wEvenIdx := 0; wOddIdx := 0;
FOR wIdx := 0 TO 9 DO
    IF (awSrc[wIdx] MOD 2 = 0) THEN
        awEven[wEvenIdx] := awSrc[wIdx];
        wEvenIdx := wEvenIdx + 1;
    ELSE
        awOdd[wOddIdx] := awSrc[wIdx];
        wOddIdx := wOddIdx + 1;
    END_IF;
END_FOR;

// 결과값:
// 짝수는 awEven에, 홀수는 awOdd에 순서대로 쌓임
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
43. 데이터 스케일링 (16비트 정수 - > 퍼센트 실수)
(* 변수 선언
Word: wIdx
Array [0..9] OF INT: awRawAnalog
Array [0..9] OF REAL: aePercent
Bool:
 *)
// 0~16000 범위를 가진 아날로그 값을 0.0~100.0%로 변환해.
FOR wIdx := 0 TO 9 DO
    aePercent[wIdx] := (INT_TO_REAL(awRawAnalog[wIdx]) / 16000.0) * 100.0;
END_FOR;

// 결과값:
// awRawAnalog[0]=8000 이라면
// aePercent[0]=50.0
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
44. 배열 내 데이터 Shift (오른쪽으로 한 칸 이동)
(* 변수 선언
Word:
Array [0..9] OF INT: awQueue
Bool:
 *)
// 데이터가 하나 들어올 때 기존 데이터를 뒤로 밀어내는 로직이야.
FOR Idx := 9 TO 1 BY - 1 DO // [실행횟수]: 9회 (역순)
    awQueue[Idx] := awQueue[Idx - 1]; // [결과]: 이전 칸의 데이터를 현재 칸으로
END_FOR;
awQueue[0] := 0; // 0번 인덱스 초기화

// 결과값:
// [1,2,3,4,5,6,7,8,9,10] -> [0,1,2,3,4,5,6,7,8,9]
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
45. 배열 데이터의 평균값 계산 (REAL 변환 포함)
(* 변수 선언
Word: Idx, nSum
Array [0..9] OF INT: awValues
Bool:
REAL: eAverage
 *)
nSum := 0;
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    nSum := nSum + awValues[Idx];
END_FOR;
eAverage := INT_TO_REAL(nSum) / 10.0; // [결과]: 정수 합을 실수로 변환 후 나눗셈

// 결과값:
// nSum이 45라면 eAverage = 4.5
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
46. 배열 데이터의 상한 / 하한 제한 (Limit / Clamping)
(* 변수 선언
Word: Idx
Array [0..9] OF INT: awRawData
Bool:
 *)
// 0보다 작으면 0으로, 100보다 크면 100으로 고정해버려!
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF awRawData[Idx] < 0 THEN
        awRawData[Idx] := 0;
    ELSIF awRawData[Idx] > 100 THEN
        awRawData[Idx] := 100;
    END_IF;
END_FOR;

// 결과값:
// -10은 0으로, 150은 100으로 변경됨
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
47. 배열 요소의 순차적 비교 (Rising Edge 감지 모사)
(* 변수 선언
Word: Idx
Array [0..9] OF INT: awCurrent, awPrevious
Array [0..9] OF BOOL: abIsIncreased
Bool:
 *)
// 이전 값보다 현재 값이 커진(상승한) 구간만 체크해.
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF awCurrent[Idx] > awPrevious[Idx] THEN
        abIsIncreased[Idx] := TRUE;
    ELSE
        abIsIncreased[Idx] := FALSE;
    END_IF;
END_FOR;

// 결과값:
// 값이 증가한 인덱스만 TRUE 저장
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
48. 배열 내 특정 값 이상인 요소의 평균 구하기
(* 변수 선언
Word: Idx, nCount, nSum
Array [0..9] OF INT: awSensorData
Bool:
REAL: eAverage
 *)
// 센서 데이터 중 100 이상인 값들만 골라내어 그 평균을 계산해.
nCount := 0;
nSum := 0;
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF awSensorData[Idx] >= 100 THEN
        nSum := nSum + awSensorData[Idx];
        nCount := nCount + 1;
    END_IF;
END_FOR;

IF nCount > 0 THEN
    eAverage := INT_TO_REAL(nSum) / INT_TO_REAL(nCount);
ELSE
    eAverage := 0.0;
END_IF;

// 결과값:
// 100 이상인 값이 120, 150 두 개라면
// nSum = 270, nCount = 2, eAverage = 135.0
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
49. 배열 데이터 중 0을 찾아 뒤로 밀기 (Data Packing)
(* 변수 선언
Word: Idx, nWriteIdx
Array [0..9] OF INT: awRawList, awPackedList
Bool:
 *)
// 데이터 사이사이에 있는 0을 제거하고 앞쪽부터 차곡차곡 채워 넣는 로직이야.
nWriteIdx := 0;
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF awRawList[Idx] <> 0 THEN
        awPackedList[nWriteIdx] := awRawList[Idx];
        nWriteIdx := nWriteIdx + 1;
    END_IF;
END_FOR;

// 결과값:
// awRawList가 [1, 0, 5, 0, 7, ...] 이라면
// awPackedList[0]=1, [1]=5, [2]=7 ... (0은 제외됨)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
50.2차원 배열의 대각선 요소 합계 (Trace)
(* 변수 선언
Word: Idx, nTraceSum
Array [0..2, 0..2] OF INT: awSquareMatrix
Bool:
 *)
// 3x3 행렬에서 왼쪽 위에서 오른쪽 아래로 내려가는 대각선 값들만 더해봐.
nTraceSum := 0;
FOR Idx := 0 TO 2 DO // [실행횟수]: 3회
    nTraceSum := nTraceSum + awSquareMatrix[Idx, Idx];
END_FOR;

// 결과값:
// awSquareMatrix[0,0], [1,1], [2,2]의 합산
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
51. 배열 데이터의 선형 검색 (Linear Search)
(* 변수 선언
Word: Idx, nTarget, nFoundPos
Array [0..9] OF INT: awSearchArray
Bool: bIsFound
 *)
// 찾고 싶은 값(nTarget)이 배열의 몇 번째에 있는지 찾는 로직이야.
bIsFound := FALSE;
nFoundPos := 0;
FOR Idx := 0 TO 9 DO
    IF awSearchArray[Idx] = nTarget THEN
        bIsFound := TRUE;
        nFoundPos := Idx;
        EXIT; // 찾으면 더 돌 필요 없지!
    END_IF;
END_FOR;

// 결과값:
// nTarget이 77이고 awSearchArray[5]=77 이라면
// bIsFound = TRUE, nFoundPos = 5
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
52. 배열 요소 홀수만 10 더하기
(* 변수 선언
Word: Idx
Array [0..9] OF INT: awNumbers
Bool:
 *)
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF (awNumbers[Idx] MOD 2 <> 0) THEN
        awNumbers[Idx] := awNumbers[Idx] + 10; // [결과]: 홀수인 경우에만 10 가산
    END_IF;
END_FOR;

// 결과값:
// 원래 3이었다면 13으로 변경됨
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
53. 인접한 두 요소의 차이 비교 (Jerk 감지 기초)
(* 변수 선언
Word: Idx
Array [0..9] OF INT: awVelocity
Bool: bJerkAlarm
 *)
// 속도 배열에서 갑작스러운 변화(차이가 50 이상)가 있는지 감시해.
bJerkAlarm := FALSE;
FOR Idx := 0 TO 8 DO // [실행횟수]: 9회 (마지막은 다음 요소가 없으니 제외)
    IF ABS(awVelocity[Idx] - awVelocity[Idx + 1]) >= 50 THEN
        bJerkAlarm := TRUE;
        EXIT;
    END_IF;
END_FOR;

// 결과값:
// 급격한 변화가 있으면 bJerkAlarm = TRUE
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
54. 비트 배열 반전 (Invert All Bits)
(* 변수 선언
Word: Idx
Array [0..9] OF BOOL: abFlags
Bool:
 *)
// 배열에 저장된 모든 스위치 상태를 반대로 뒤집어!
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    abFlags[Idx] := NOT abFlags[Idx];
END_FOR;

// 결과값:
// TRUE였던 건 FALSE로, FALSE였던 건 TRUE로 변경
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
55.특정 값 제외하고 배열 복사 (Filtering)
(* 변수 선언
Word: Idx, nWriteIdx
Array [0..9] OF INT: awSourceData, awFilteredData
Bool:
 *)
// 데이터 중 -1(에러코드)인 값을 제외하고 나머지 데이터만 순서대로 복사해.
nWriteIdx := 0;
FOR Idx := 0 TO 9 DO // [실행횟수]: 10회
    IF awSourceData[Idx] <> - 1 THEN
        awFilteredData[nWriteIdx] := awSourceData[Idx];
        nWriteIdx := nWriteIdx + 1; // [결과]: 유효한 데이터만 저장
    END_IF;
END_FOR;

// 결과값:
// awSourceData가 [10, -1, 20, 30, -1, 40, ...] 이라면
// awFilteredData[0]=10, [1]=20, [2]=30, [3]=40
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
56. 배열 내 최소값과 최대값의 차이(Range) 구하기
(* 변수 선언
Word: Idx, nMax, nMin, nRange
Array [0..9] OF INT: awData
Bool:
 *)
nMax := awData[0]; nMin := awData[0];
FOR Idx := 1 TO 9 DO // [실행횟수]: 9회
    IF awData[Idx] > nMax THEN nMax := awData[Idx]; END_IF;
    IF awData[Idx] < nMin THEN nMin := awData[Idx]; END_IF;
END_FOR;
nRange := nMax - nMin; // [결과]: 데이터의 변동 폭 계산

// 결과값:
// 최대 100, 최소 20 이라면 nRange = 80
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
57.배열 데이터의 순차적 평균 (Cumulative Average)
(* 변수 선언
Word: Idx, nSum
Array [0..4] OF INT: awData
Array [0..4] OF REAL: aeRunningAvg
Bool:
 *)
nSum := 0;
FOR Idx := 0 TO 4 DO
    nSum := nSum + awData[Idx];
    aeRunningAvg[Idx] := INT_TO_REAL(nSum) / INT_TO_REAL(Idx + 1);
END_FOR;

// 결과값:
// awData가 [10, 20, 30...] 이면
// aeRunningAvg[0]=10.0, [1]=15.0, [2]=20.0
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
58. FOR문에서 타이머 응용
FOR Z0 := 0 TO 10 DO
	IF M100Z0 THEN
		OUT_T(1 , T100Z0 , 20);
		ELSE
		OUT_T(0 , T100Z0 , 20);
	END_IF;
END_FOR;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
59.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
60.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
61.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
62.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
63.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
64.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
65.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
66.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
67.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
68.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
69.

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -





 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
                                         WHILE END_WHILE ;
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
1. 기초 단계 (기본 구조 이해)
// 1. 1부터 10까지 합산 (가장 표준적인 WHILE)
i := 1; // 초기화 필수!
nSum := 0;
WHILE i <= 10 DO // [실행횟수]: 10회
    nSum := nSum + i; // [결과]: nSum = 55
    i := i + 1; // 증감식 필수! 안 쓰면 무한루프
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 2. 10부터 1까지 카운트다운
i := 10;
WHILE i > 0 DO // [실행횟수]: 10회
    nValue := i; // [결과]: i = 0
    i := i - 1;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 3. 특정 목표값 도달할 때까지 더하기
nSum := 0;
i := 1;
WHILE nSum < 100 DO // [실행횟수]: 14회 (1+2...+14=105)
    nSum := nSum + i; // [결과]: nSum = 105
    i := i + 1;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 4. 짝수만 출력하기 (2, 4, 6, 8, 10)
i := 2;
WHILE i <= 10 DO // [실행횟수]: 5회
    arrEven[i / 2] := i; // [결과]: 2, 4, 6, 8, 10 저장
    i := i + 2;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 5. 2의 거듭제곱 계산 (1024 찾기)
nPower := 1;
WHILE nPower < 1000 DO
    nPower := nPower * 2;
END_WHILE;
// [실행횟수]: 10회 // [결과]: nPower = 1024
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
2. 센서 및 상태 대기 (PLC 실무 스타일)
// 6. 센서가 켜질 때까지 대기 (Time-out 설정 포함)
nTimer := 0;
WHILE (NOT bSensor) AND (nTimer < 5000) DO // [실행횟수]: 센서 On 또는 5000 도달 시까지
    nTimer := nTimer + 1; // 실제로는 타이머 함수 사용 권장
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 7. 특정 비트가 꺼질 때까지 루프
WHILE bBusyFlag DO
    // 통신 완료 대기 등
    IF bError THEN
        EXIT;
    END_IF;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 8. 배열에서 첫 번째 0이 아닌 값 찾기
i := 1;
WHILE arrData[i] = 0 AND i <= 10 DO
    i := i + 1;
END_WHILE;
// [결과]: i는 처음으로 0이 아닌 데이터의 위치
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 9. 사용자 정지 명령 시까지 무한 반복
WHILE NOT bStopButton DO
    ExecuteProcess();
    IF bDone THEN EXIT; END_IF;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 10. 상한치 도달 시 자동 감속 로직
WHILE nSpeed > nTargetSpeed DO
    nSpeed := nSpeed - 1;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

3. 데이터 처리 및 배열 응용
// 11. 문자열 끝 찾기 (NULL 문자가 나올 때까지)
i := 1;
WHILE sBuffer[i] <> '$00' DO
    i := i + 1;
END_WHILE;
// [결과]: i = 문자열의 길이
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 12. 배열 요소의 평균이 50 아래로 내려갈 때까지 요소 삭제
WHILE fAverage > 50.0 DO
    RemoveLastElement();
    fAverage := CalculateAvg();
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 13. 두 수의 최대공약수 구하기 (유클리드 호제법)
WHILE nNum2 <> 0 DO
    nTemp := nNum1 MOD nNum2;
    nNum1 := nNum2;
    nNum2 := nTemp;
END_WHILE;
// [결과]: nNum1이 최대공약수
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 14. 스택(Stack) 데이터 비우기
WHILE nStackPointer > 0 DO
    PopData();
    nStackPointer := nStackPointer - 1;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 15. 특정 패턴이 나올 때까지 버퍼 읽기
WHILE bDataReady DO
    ReadBuffer();
    IF nData = 16#0D THEN EXIT; END_IF; // CR 문자 시 종료
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4. 고급 제어 및 조건문 혼합
// 16. 에러 발생 시 리트라이 (3번 시도)
nRetry := 0;
bSuccess := FALSE;
WHILE (NOT bSuccess) AND (nRetry < 3) DO
    bSuccess := TryConnect();
    nRetry := nRetry + 1;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 17. 실시간 위치 보정 (오차가 0.1 이내가 될 때까지)
WHILE ABS(fTargetPos - fCurrentPos) > 0.1 DO
    MoveSmallStep();
    fCurrentPos := GetPosition();
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 18. 복합 조건 (버튼이 눌려 있고 에러가 없을 때만 작동)
WHILE bStartSwitch AND (NOT bError) DO
    RunMotor();
    IF bLimitSwitch THEN EXIT; END_IF;
END_WHILE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 19. 값 건너뛰며 합산 (CONTINUE 활용)
i := 0;
nSum := 0;
WHILE i < 10 DO
    i := i + 1;
    IF i = 5 THEN CONTINUE; END_IF; // 5일 때만 건너뜀
    nSum := nSum + i;
END_WHILE;
// [결과]: nSum = 50 (1~10 합에서 5 제외)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 20. 가변 데이터 길이만큼 처리
i := 1;
WHILE i <= nDataLength DO
    ProcessData(arrRaw[i]);
    i := i + 1;
END_WHILE;
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
                                         CASE ANY_NUM OF END_CASE;
 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
1. 기초 단계 (기본 모드 및 상태 제어)
// 1. 장비 운전 상태 표시 (가장 기본)
CASE nStatus OF
    0: sMsg := 'Stop'; // 0일 때
    1: sMsg := 'Run'; // 1일 때
    2: sMsg := 'Error'; // 2일 때
ELSE
    sMsg := 'Unknown'; // 그 외의 값일 때 (예외 처리)
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 2. 범위를 이용한 점수 등급 (.. 사용)
CASE nScore OF
    90..100: sGrade := 'A'; // 90에서 100 사이
    80..89: sGrade := 'B';
    70..79: sGrade := 'C';
ELSE
    sGrade := 'F';
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 3. 콤마(,)를 이용한 여러 값 지정
CASE nDayOfWeek OF
    1, 7: bIsWeekend := TRUE; // 1(일) 또는 7(토)
    2..6: bIsWeekend := FALSE; // 2~6(월~금)
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 4. 모터 속도 단계별 설정
CASE nSpeedStep OF
    1: nTargetSpeed := 500;
    2: nTargetSpeed := 1000;
    3: nTargetSpeed := 2000;
ELSE
    nTargetSpeed := 0;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 5. 간단한 사칙연산 선택 (1:더하기, 2:빼기)
CASE nOpMode OF
    1: nResult := nA + nB;
    2: nResult := nA - nB;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
2. PLC 공정 및 시퀀스 제어 (실무 핵심)
// 6. 스텝 제어 (Step Control)
CASE nStep OF
    10: // 원점 복귀 시작
        bHomeStart := TRUE;
        IF bHomeDone THEN
            nStep := 20;
        END_IF;
    20: // 대기 위치 이동
        bMoveWait := TRUE;
        IF bInPos THEN
            nStep := 30;
        END_IF;
    30: // 작업 수행
        bWorkStart := TRUE;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 7. 실린더 전/후진 제어
CASE nCylStep OF
    0: bCylForward := FALSE; bCylBackward := TRUE;
    1: bCylForward := TRUE; bCylBackward := FALSE;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 8. 램프 점멸 모드
CASE nLampMode OF
    0: bLamp := FALSE; // 소등
    1: bLamp := TRUE; // 점등
    2: bLamp := bClock_1Hz; // 1초 주기로 깜빡임
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 9. 에러 코드별 알람 메시지
CASE nErrCode OF
    101: sErrName := 'Emergency Stop';
    201: sErrName := 'Motor Overload';
    301: sErrName := 'Sensor Timeout';
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 10. 작업자 권한 관리
CASE nUserLevel OF
    1: bCanEdit := FALSE; // 일반 작업자
    2: bCanEdit := TRUE; // 관리자
    99: bMaster := TRUE; // 개발자
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
3. 데이터 처리 및 변환
// 11. 7-Segment 표시기 데이터 변환
CASE nDigit OF
    0: wOutput := 16#3F;
    1: wOutput := 16#06;
    2: wOutput := 16#5B;
    // ... 생략
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 12. 월별 일수 계산
CASE nMonth OF
    1, 3, 5, 7, 8, 10, 12: nDays := 31;
    4, 6, 9, 11: nDays := 30;
    2: nDays := 28; // 평년 기준
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 13. 아날로그 입력 범위별 위험도
CASE REAL_TO_INT(fTemp) OF
    0..40: nLevel := 1; // 안전
    41..80: nLevel := 2; // 주의
    81..150: nLevel := 3; // 위험
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 14. 통신 프로토콜 명령 선택
CASE nCommand OF
    16#01: ExecuteRead();
    16#02: ExecuteWrite();
    16#03: ExecuteReset();
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 15. 언어 설정 변경
CASE nLangMode OF
    0: sStartBtn := 'Start';
    1: sStartBtn := '시작';
    2: sStartBtn := '開始';
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4. 고급 응용 및 복합 구조
// 16. CASE 문 안의 IF 문 (조건부 단계 전전)
CASE nProcess OF
    1:
        IF bReady THEN
            nProcess := 2;
        ELSIF bError THEN
            nProcess := 99;
        END_IF;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 17. 밸브 출력 우선순위 제어
CASE nPriority OF
    1: bValve1 := TRUE;
    2: bValve2 := TRUE;
ELSE
    bAllOff := TRUE;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 18. 제품 모델별 파라미터 로드
CASE nModelID OF
    1001: fPressure := 5.5; fTime := 2.0;
    1002: fPressure := 6.2; fTime := 2.5;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 19. 다중 비트 조합에 따른 동작 (비트 패턴)
CASE (wInput AND 16#0003) OF // 하위 2비트만 추출
    16#0001: bAction1 := TRUE;
    16#0002: bAction2 := TRUE;
    16#0003: bActionBoth := TRUE;
END_CASE;
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// 20. 초기화 시퀀스
CASE nInitStep OF
    0: IF bInitBtn THEN
        nInitStep := 1;
    END_IF;
    1: ClearMemory(); nInitStep := 2;
    2: bInitDone := TRUE; nInitStep := 0;
END_CASE;
// } #endregion
