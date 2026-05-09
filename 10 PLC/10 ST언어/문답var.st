
// 15
VAR
    X0: BOOL;
    Y40: BOOL;
    T1: TON; // IEC용 타이머
END_VAR

IF X0 THEN Y40 := 1; END_IF;
OUT_T(Y40, T1, 30);
IF T1 THEN Y40 := 0; END_IF;





(* ============================================
   HandShake: LSC Printer → Oven#1
   Active: LSC / Passive: Oven
   ============================================
   [입력]
   X0: S2 센서 (LSC C/V 위 제품감지)
   X1: S3 센서 (Oven C/V 위 제품감지)
   X2: RCV_Able (Oven → LSC 수신준비)
   X3: RCV_Start (Oven → LSC 수신시작확인)
   X4: RCV_Comp (Oven → LSC 수신완료)
   X5: S4 센서 (Oven C/V STOP 조건)

   [출력]
   Y0: STP_UP (스토퍼 상승)
   Y1: STP_DN (스토퍼 하강)
   Y2: CV_RUN_LSC (LSC 컨베이어 구동)
   Y3: CV_RUN_Oven (Oven 컨베이어 구동)
   Y4: Send_Start (LSC → Oven 이송시작)
   Y5: Send_Comp (LSC → Oven 이송완료)

   [내부]
   M0: Send_Able (LSC 송신준비완료)
   M10: Step 초기화 플래그
   ============================================ *)

CASE STEP OF

  0: (* 초기 상태 / STP UP *)
    Y0 := TRUE; (* STP UP *)
    Y1 := FALSE; (* STP DN 해제 *)
    Y2 := FALSE; (* CV LSC 정지 *)
    Y3 := FALSE; (* CV Oven 정지 *)
    Y4 := FALSE; (* Send Start 해제 *)
    Y5 := FALSE; (* Send Comp 해제 *)
    M0 := FALSE; (* Send Able 초기화 *)
    STEP := 10;

  10: (* S2 ON 확인 → Send Able *)
    IF X0 THEN (* S2 ON: 제품 감지 *)
      M0 := TRUE; (* Send Able SET *)
      STEP := 20;
    END_IF;

  20: (* RCV Able 대기 → AND 조건 *)
    IF M0 AND X2 THEN (* Send Able AND RCV Able *)
      STEP := 30;
    END_IF;

  30: (* STP DN + C/V RUN + Send Start *)
    Y0 := FALSE; (* STP UP 해제 *)
    Y1 := TRUE; (* STP DN *)
    Y2 := TRUE; (* CV LSC RUN *)

    IF NOT X5 THEN (* S4 OFF 조건 확인 *)
      Y3 := TRUE; (* CV Oven RUN *)
    END_IF;

    Y4 := TRUE; (* Send Start *)
    STEP := 40;

  40: (* RCV Start 확인 *)
    IF X3 THEN (* Oven에서 수신시작 확인 *)
      STEP := 50;
    END_IF;

  50: (* S2 OFF 확인 → Send Comp *)
    IF NOT X0 THEN (* S2 OFF: 제품 빠져나감 *)
      Y2 := FALSE; (* CV LSC 정지 *)
      Y4 := FALSE; (* Send Start 해제 *)
      Y5 := TRUE; (* Send Comp *)
      STEP := 60;
    END_IF;

  60: (* RCV Comp 대기 → 완료 *)
    IF X4 THEN (* Oven 수신완료 확인 *)
      Y1 := FALSE; (* STP DN 해제 *)
      Y3 := FALSE; (* CV Oven 정지 *)
      Y5 := FALSE; (* Send Comp 해제 *)
      M0 := FALSE; (* Send Able 초기화 *)
      STEP := 0; (* 초기상태 복귀 *)
    END_IF;

END_CASE;
