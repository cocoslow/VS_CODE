

// 1. 안전 및 에러 체크 (최우선)
IF bEmergStop OR bAlarmActive THEN
    nMainStep := 0; // 에러 발생 시 초기 상태로
    bHeater_On := FALSE; // 히터 즉시 정지
    bConv_Run := FALSE; // 컨베이어 즉시 정지
END_IF;

// 2. 메인 시퀀스 제어
IF bAutoMode AND NOT bAlarmActive THEN
    CASE nMainStep OF

        0: // [IDLE] 시작 대기
            IF bStart_PB AND bReady THEN
                nMainStep := 10;
            END_IF;

        10: // [READY] 자재 입고 대기 (전공정 인터페이스)
            bLoading_Req := TRUE; // 자재 보내달라고 신호 보냄
            IF bPart_In_Detect THEN
                bLoading_Req := FALSE;
                nMainStep := 20;
            END_IF;

        20: // [IN] 자재 내부 이송
            bConv_Run := TRUE;
            IF bPart_Inside THEN // 자재가 챔버 안에 안착되면
                bConv_Run := FALSE;
                nMainStep := 30;
            END_IF;

        30: // [DOOR CLOSE] 문 닫기
            bDoor_Close := TRUE;
            bDoor_Open := FALSE;
            IF bDoor_Close_LS THEN // 문 닫힘 완료 확인
                nMainStep := 40;
            END_IF;

        40: // [HEATING] 가열 및 유지
            bHeater_On := TRUE;
            // 온도가 안정화되고, 설정한 가열 시간이 지나면 다음으로
            IF bTemp_Stable AND (tHeating_Time.Q) THEN
                bHeater_On := FALSE;
                nMainStep := 50;
            END_IF;

        50: // [DOOR OPEN] 문 열기
            bDoor_Open := TRUE;
            bDoor_Close := FALSE;
            IF bDoor_Open_LS THEN // 문 열림 완료 확인
                nMainStep := 60;
            END_IF;

        60: // [OUT] 자재 배출
            bConv_Run := TRUE;
            bUnloading_Req := TRUE; // 후공정에 자재 가져가라고 신호
            IF NOT bPart_Inside AND bPart_Out_Detect THEN
                nMainStep := 70;
            END_IF;

        70: // [DONE] 공정 완료 및 카운트
            nTotalCount := nTotalCount + 1;
            bConv_Run := FALSE;
            bUnloading_Req := FALSE;
            nMainStep := 0; // 다시 처음으로

    END_CASE;
END_IF;
