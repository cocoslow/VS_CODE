# 🚀 ST 언어 실무 테마별 예제 사전 (분류 완료!)

기존에는 명령어(IF, FOR, WHILE, CASE) 순서대로만 나열되어 있다 보니, 초보자 입장에서는 **"이걸 현장에서 무슨 용도로 써야 하지?"** 하고 막막할 수밖에 없었습니다.

그래서 제가 기존 `99 이것저것 TEST.st` 파일에 있던 600줄 분량의 꿀팁 코드들을 **"현장에서 실제로 마주하는 상황(테마)"** 에 맞춰 새롭게 재조립하고 제목을 달아 두었습니다! 이제 목적에 맞춰 찾아 쓰세요.

---

## 1️⃣ [시퀀스 & 공정 제어] 장비를 순서대로 움직일 때

기계 동작의 스텝을 짜거나, 특정 센서가 들어올 때까지 기다려야 할 때 쓰는 로직입니다.

### 📌 1. 공정 스텝(Step) 순차 제어 (가장 중요)

```javascript
CASE nStep OF
    10: // 1단계: 원점 복귀 시작
        bHomeStart := TRUE;
        IF bHomeDone THEN 
            nStep := 20; 
        END_IF;
    
    20: // 2단계: 대기 위치 이동
        bMoveWait := TRUE;
        IF bInPos THEN 
            nStep := 30; 
        END_IF;
    
    30: // 3단계: 작업 수행
        bWorkStart := TRUE;
END_CASE;
```

### 📌 2. 공압 실린더 전진/후진 제어

```javascript
CASE nCylStep OF
    0: bCylForward := FALSE; bCylBackward := TRUE;  // 후진
    1: bCylForward := TRUE;  bCylBackward := FALSE; // 전진
END_CASE;
```

### 📌 3. 센서가 켜질 때까지 대기하기 (타임아웃 포함)

```javascript
nTimer := 0;
// 센서가 안 들어왔는데, 아직 5초(5000)가 안 지났다면 계속 빙글빙글 대기
WHILE (NOT bSensor) AND (nTimer < 5000) DO      
    nTimer := nTimer + 1;                       
END_WHILE;
```

---

## 2️⃣ [데이터 & 배열 노가다 방지] 수십 개의 메모리를 다룰 때

수백 개의 데이터를 다 지우거거나, 이동하거나, 값을 검사해야 할 때 래더 대신 ST를 씁니다.

### 📌 4. 배열 데이터 한방에 0으로 초기화

```javascript
// 배열 1번부터 5번 방을 모두 찾아가서 0으로 덮어씀
FOR i := 1 TO 5 DO          
    arrData[i] := 0;        
END_FOR;                    
```

### 📌 5. 수많은 데이터 중 '불량(음수)' 개수만 찾아내기

```javascript
nErrCnt := 0;
FOR i := 1 TO 3 DO                                          
    IF arrCheck[i] < 0 THEN          // 데이터가 0미만(불량)이면?
        nErrCnt := nErrCnt + 1;      // 불량 카운트 1개 추가!
    END_IF;   
END_FOR;
```

### 📌 6. 10 초과인 '정상 데이터'만 쏙쏙 뽑아서 새 배열로 옮기기

```javascript
k := 1;
FOR i := 1 TO 3 DO
    IF arrIn[i] > 10 THEN              // 10이 넘는 값만 골라서
        arrOut[k] := arrIn[i];         // 출력 배열에 차곡차곡 쌓는다
        k := k + 1;                
    END_IF;
END_FOR;
```

---

## 3️⃣ [알람 & 에러 처리] 장비 이상을 감지할 때

다양한 에러 코드나 램프 점검 패턴을 관리해야 할 때 씁니다.

### 📌 7. HMI에 띄울 에러 코드별 알람 메시지 지정

```javascript
CASE nErrCode OF
    101: sErrName := 'Emergency Stop 알람';
    201: sErrName := 'Motor Overload 확인바람';
    301: sErrName := 'Sensor Timeout 발생';
END_CASE;
```

### 📌 8. 검사 도중 치명적 에러 즉시 감지하고 탈출하기 (EXIT)

```javascript
bError := FALSE;
FOR i := 1 TO 100 DO                  
    IF arrSt[i] = 1 THEN             // 검사하다가 하나라도 에러(1)가 뜨면
        bError := TRUE;              // 에러 깃발을 띄우고
        EXIT;                        // 남은 검사는 집어치우고 당장 FOR문을 탈출!
    END_IF;
END_FOR;
```

### 📌 9. 통신 실패 시 최대 3번까지 재시도 (Retry)

```javascript
nRetry := 0;
bSuccess := FALSE;
// 아직 연결 안 됨 + 재시도 횟수 3번 미만일 동안 계속 시도
WHILE (NOT bSuccess) AND (nRetry < 3) DO
    bSuccess := TryConnect();
    nRetry := nRetry + 1;
END_WHILE;
```

---

## 4️⃣ [안전 및 기타 제어]

여러 조건이 동시에 맞아야 하거나, 온도/수치에 따라 상태를 판정할 때 씁니다.

### 📌 10. 아날로그 수치(온도) 범위에 따른 위험도 등급 판정

```javascript
CASE REAL_TO_INT(fTemp) OF
    0..40:   nLevel := 1; // 0~40도: 안전
    41..80:  nLevel := 2; // 41~80도: 주의
    81..150: nLevel := 3; // 81~150도: 위험
ELSE
    nLevel := 99;         // 센서 단선 등 말도 안되는 수치일 때 에러
END_CASE;
```

### 📌 11. 3중 인터록 조건 (전원 -> 모드 -> 에러 확인)

```javascript
IF bPowerOn THEN                // 1단계: 장비 메인 전원이 켜졌는가?
  
    IF bAutoMode THEN           // 2단계: 수동이 아닌 자동 모드인가?
    
        IF NOT bError THEN      // 3단계: 알람 뜬 곳이 한 군데도 없는가?
            bMachineStart := TRUE; // 비로소 기계를 구동한다.
        END_IF;         

    END_IF;             
  
END_IF;                 
```
