# 📝 ST 언어 문법 및 클린 프린터 제어 정리

이 페이지는 **ST 언어 조건문 예제**와 **클린 프린터 제어 FAT 항목**을 정리한 통합 문서입니다.
모든 코드는 초보자가 보기 편하도록 **여러 줄(Multi-line)** 형식으로 작성되었습니다.

---

## 🏗️ 1. 클린 프린터 제어 관련 FAT(공장출하검사) 항목

| 구분                    | 검사 항목         | 주요 확인 내용                               |
| :---------------------- | :---------------- | :------------------------------------------- |
| **하드웨어(I/O)** | 센서 작동 테스트  | 진공 센서, 근접 센서, 리밋 센서의 신호 확인  |
|                         | 액추에이터 동작   | 실린더, 모터 구동 범위 및 기구적 간섭 확인   |
| **안전(Safety)**  | 비상 정지(E-Stop) | 비상 스위치 작동 시 모든 출력 즉시 차단 여부 |
|                         | 인터록(Interlock) | 도어 오픈 시 가동 중지 등 안전 로직 확인     |
| **제어(Control)** | 원점 복귀(Homing) | 전원 투입 후 각 축의 정확한 원점 찾기        |
|                         | 시퀀스 테스트     | 자동 모드 전체 공정(Loading~Unloading) 동작  |

---

## 📚 2. PLC ST 언어: IF문 활용 예제 (30선)

*(공부가 완료되면 ☐ 기호를 ☑ 기호로 바꿔보세요!)*

```


```

### 🟢 레벨 1: 기초 (할당 및 단순 비교)

☑ **1. 전등 켜기**

```pascal
IF bSw THEN
    bLamp := TRUE; // 스위치가 ON이면 램프를 켠다
END_IF;
```

☐ **2. 전등 끄기**

```pascal
IF NOT bSw THEN
    bLamp := FALSE; // 스위치가 OFF이면 램프를 끈다
END_IF;
```

☐ **3. 전등 반전 제어 (ELSE)**

```st
IF bBtn THEN
    bLamp := TRUE;  // 누르면 켜짐
ELSE
    bLamp := FALSE; // 안 누르면 꺼짐
END_IF;
```

☐ **4. 수위 경보**

```pascal
IF nLevel >= 100 THEN
    bAlarm := TRUE; // 수위가 100 이상이면 경보
END_IF;
```

☐ **5. 온도 범위 체크**

```pascal
IF (nTemp > 50) AND (nTemp < 80) THEN
    bHeater := TRUE; // 50~80도 사이일 때만 히터 가동
END_IF;
```

☐ **6. 설정값 일치 확인**

```pascal
IF nSet = nCur THEN
    bDone := TRUE; // 설정된 위치에 도착하면 완료
END_IF;
```

☐ **7. 비상 압력 센서**

```pascal
IF (nPres <= 0) OR (nPres >= 500) THEN
    bEStop := TRUE; // 압력이 비정상이면 비상 정지
END_IF;
```

☐ **8. 짝수 주기 동작 (MOD)**

```pascal
IF (nCount MOD 2) = 0 THEN
    bLamp_Even := TRUE; // 짝수 카운트일 때만 램프 ON
END_IF;
```

☐ **9. 데이터 값 초기화**

```pascal
IF nData < 0 THEN
    nData := 0; // 음수 데이터는 0으로 보정
END_IF;
```

☐ **10. 상태 반전 (Toggle)**

```pascal
IF bBtn_Push THEN
    bState := NOT bState; // 누를 때마다 켜짐/꺼짐 반복
END_IF;
```

---

### 🟡 레벨 2: 중급 (인터록 및 다중 조건)

☐ **11. 다중 선택 (ELSIF)**

```pascal
IF nLevel < 10 THEN
    bLow := TRUE;
ELSIF nLevel < 80 THEN
    bMid := TRUE;
ELSE
    bHigh := TRUE;
END_IF;
```

☐ **12. 상호 인터록 (Interlock)**

```pascal
IF bBtnCCW AND NOT bMotorCW THEN
    bMotorCCW := TRUE; // 정회전 중이 아닐 때만 역회전 가능
END_IF;
```

☐ **13. 안전 허가 로직**

```pascal
IF bDoorClosed AND bEStopReleased THEN
    bSystemReady := TRUE; // 문이 닫히고 비상정지 풀려야 작동
END_IF;
```

☐ **14. 순차 가동 조건**

```pascal
IF bStep1Done THEN
    IF bStep2StartBtn THEN
        bStep2Move := TRUE; // 1단계 완료 후에만 2단계 시작
    END_IF;
END_IF;
```

☐ **15. 속도 제한 (Limit)**

```pascal
IF nSpeed > 1000 THEN
    nSpeed := 1000; // 최대 속도 1000 고정
END_IF;
```

☐ **16. 수동 모드 인터록**

```pascal
IF bManualMode AND bJogBtn THEN
    bMotorJogMove := TRUE; // 수동 모드일 때만 수동 운전 가능
END_IF;
```

☐ **17. 에러 리셋**

```pascal
IF bError AND bResetBtn THEN
    bError := FALSE; // 에러 발생 시 리셋 버튼으로 해제
END_IF;
```

☐ **18. 타이머 만료 확인**

```pascal
IF TMR1.Q THEN
    bNextStep := TRUE; // 타이머가 끝나면 다음 동작 실행
END_IF;
```

☐ **19. 제품 선별 (Weight)**

```pascal
IF (nWeight >= 100) AND (nWeight <= 110) THEN
    bPass := TRUE; // 무게가 합격 범위일 때만 TRUE
ELSE
    bFail := TRUE;
END_IF;
```

☐ **20. 중첩 IF (전원 체크)**

```pascal
IF bPowerOn THEN
    IF bAutoMode THEN
        bRun := TRUE; // 전원 켜져 있고 자동 모드일 때 가동
    END_IF;
END_IF;
```

---

### 🔴 레벨 3: 고급 (실무 산업 로직)

☐ **21. 자기유지 (Self-Holding)**

```pascal
IF bStart THEN
    bMotor := TRUE;
ELSIF bStop THEN
    bMotor := FALSE;
END_IF;
```

☐ **22. 센서 오작동 방지 (Dual Check)**

```pascal
IF bSensor1 AND bSensor2 THEN
    bObjectDetect := TRUE; // 두 센서가 동시에 감지해야 인정
END_IF;
```

☐ **23. 순차 기동 (Sequence Start)**

```pascal
IF bP1_Running AND TMR_Delay.Q THEN
    bP2_Start := TRUE; // 1번 펌프 돌고 딜레이 후에 2번 시작
END_IF;
```

☐ **24. 교대 가동 (Pump Rotation)**

```pascal
IF bRotationPulse THEN
    bPumpA := NOT bPumpA;
    bPumpB := NOT bPumpA; // 스위칭 펄스마다 가동 펌프 교체
END_IF;
```

☐ **25. 윤번제 운전 시간 누적 제한**

```pascal
IF nRunHours > nLimitHours THEN
    bMaintenanceNeeded := TRUE; // 가동 시간 한도 초과 시 정비 알람
END_IF;
```

☐ **26. 컨베이어 불량품 배출 (Reject)**

```pascal
IF bSensorTrigger AND NOT bLabelRead THEN
    bRejectCylinder := TRUE; // 센서 감지됐는데 라벨 안 읽히면 배출
END_IF;
```

☐ **27. 비상 정지 초기화 (Reset All)**

```pascal
IF bEmergencyStop THEN
    bMotor := FALSE;
    bCyl := FALSE;
    nStep := 0; // 비상 시 모든 출력 끄고 단계 초기화
END_IF;
```

☐ **28. 로그 카운트 기록**

```pascal
IF nVal > nThreshold THEN
    nCount := nCount + 1; // 특정 수치 넘을 때마다 카운팅
END_IF;
```

☐ **29. 모드별 동작 차단 (Interlock)**

```pascal
IF bAutoMode THEN
    ; // 수동 버튼은 무시 (아무것도 안함)
ELSE
    IF bManualBtn THEN
        bPump := TRUE;
    END_IF;
END_IF;
```

☐ **30. 상태 머신 기초 (nStep)**

```pascal
IF nStep = 0 THEN 
    IF bStart THEN nStep := 10; END_IF;
ELSIF nStep = 10 THEN 
    bCylForward := TRUE; 
    IF bSenForward THEN nStep := 20; END_IF;
ELSIF nStep = 20 THEN 
    bCylBackward := TRUE; 
    nStep := 0; 
END_IF;
```
