# Object
[Objc] Object

## [TIL] - Method
- **메서드**
    - Class의 행위 정의
    
- **동작수행**
    - 객체에 메서드를 호출
    
- **메시지**
    - 객체에 메서드를 호출해서 동작 수행
    
- **리시버 (Receiver)**
    - 메시지를 받아서 동작을 수행하는 객체
    
- **센더 (Sender)**
    - 메시지를 보내는 객체

  ### Class Method vs Instance Method
  - **Class Method**
    - '(+)' 기호 사용
    - 리시버가 클래스
    - alloc 메서드, 팩토리 메서드
    ```objc
    +(instancetype)string;
    ```

  - **Instance Method**
    - '(-)' 기호 사용
    - 리시버가 객체
    - 객체 생성 과정 필요
    - 객체에 설정된 정보 사용 가능
    ```objc
    -(NSUInteger)length;
    ```

## [Deep Dive] - NSString이 클래스인 이유?
- **Objective-C는 C언어의 확장이자 `Smalltalk`의 영향을 받은 언어로 객체지향적인 특성을 강조하고자 메타클래스인 `NSObject`로부터 상속을 통해 모든것을 객체로 취급한다.**

> 💡 **Smalltalk 이란?**
> <br>
> • Simula의 영향을 받은 후속 언어로 순수 객체지향 언어이자, 객체지향 프로그래밍을 철저하게 구현하고 보급시킨 `최초의 언어`이다.
> <br>
> <br>
> • `Smalltalk`은 C++나 JAVA와 달리 **원시 자료형이 없으며** 모든 정수, 부동소수, 문자열, 블록을 포함한 `모든것이 객체`며 클래스가 있다.
> <br>
> • Smalltalk은 `클래스가 객체로 취급`되며, `클래스는 메타클래스의 인스턴스`이다. (즉, 메타클래스는 클래스의 클래스)
> <br>
> <br>
> P.S. `Simula`는 일반적으로 객체지향 프로그래밍 언어의 `시초가 된 언어`로 인정받고 있다.
