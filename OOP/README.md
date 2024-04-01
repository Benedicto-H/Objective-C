# OOP
[Objc] OOP

## [TIL] - OOP
- **Class 정의의 2가지 방법**
  - [Earlier] 인스턴스 변수를 사용하는 경우
    ```objc
    #import <Foundation/Foundation.h>
    
    @interface Rectangle: NSObject {    
        //  인스턴스 변수 선언
        double width, height;
    }
    
    //  생성자 메서드 선언
    -(id)init;
    -(id)initWithWidth:(double)newWidth height:(double)newHeight;
    
    //  Getter / Setter 선언
    -(double)width;
    -(void)setWidth:(double)newWidth;
    -(double)height;
    -(void)setHeight:(double)newHeight;

    //  인스턴스 메서드 선언
    -(double)getArea;
    
    @end
    ```
    
    ```objc
    #import "Rectangle.h"
    
    @implementation Rectangle

    //  생성자 메서드 구현
    - (id)init {
        if (self = [super init]) {
            width = 0.0;
            height = 0.0;
        }
    }

    - (id)initWithWidth:(double)newWidth height:(double)newHeight {
        if (self = [super init]) {
            width = newWidth;
            height = newHeight;
        }
    }
    
    //  Getter / Setter 구현
    - (double)width {
        return width;
    }
    
    - (void)setWidth:(double)newWidth {
        width = newWidth;
    }
    
    - (double)height {
        return height;
    }
     
    - (void)setHeight:(double)newHeight {
        height = newHeight;
    }

    //  인스턴스 메서드 구현
    - (double)getArea {
        return width * height;
    }
    @end
    ```
    - 인스턴스 변수로 속성을 정의하면, Getter/Setter를 모두 `직접 선언 및 구현해야하는 단점`이 발생
    - 인스턴스 변수의 디폴트 접근제어자는 `@protected`. (-> `해당 클래스 내부` 또는 `서브 클래스`에서만 `인스턴스 변수에 접근`이 가능)
    <br>
    
  - [Newly] 프로퍼티를 사용하는 경우
    ```objc
    #import <Foundation/Foundation.h>
    
    @interface Rectangle: NSObject
    //  프로퍼티 선언
    @property (nonatomic, assign) double width, height;

    //  생성자 메서드 선언
    -(instancetype)init;
    -(instancetype)initWithWidth:(double)newWidth height:(double)newHeight;

    //  인스턴스 메서드 선언
    -(double)getArea;

    @end
    ```
    
    ```objc
    #import "Rectangle.h"
    
    @implementation Rectangle

    //  생성자 메서드 구현 (생략)
    //  ...
    
    //  인스턴스 메서드 구현
    - (double)getArea {
        return _width * _height;
    }
    
    @end
    ```
    - `@property`로 속성을 정의하면, Getter/Setter가 `자동으로 생성됨` (-> `직접 선언 및 구현할 필요가 없음`)
    - 프로퍼티를 생성하면, 컴파일러에 의해 프로퍼티의 변수명 앞에 `_(underscore) 접두사`를 붙힌 `내부 변수`가 생성됨
    - 만약 프로퍼티 변수명을 그대로 사용하고자 한다면 아래와 같이 클래스 구현부에 `@synthesize` 키워드를 이용하여 접근
      ```objc
      #import "Rectangle.h"
      
      @implementation Rectangle

      @synthesize width, height;

      - (double)getArea {
          return width * height;
      }

      @end
      ```
      - `@synthesize`로 사용될 변수명과 `@property`로 사용된 변수명의 **싱크를 맞춰 주어야하며**, `_width와 _height로는 접근이 불가능`
      <br>
      
    > @synthesize를 하던 안하던 프로퍼티는 `내부 클래스 or 서브 클래스`에서 `self.`를 이용해 접근이 가능
    <br>

- **Class Inheritance (상속)**
  - Objective-C는 Swift와 마찬가지로 `단일 상속` (-> **다중 상속X**)
  - **Is-a 관계** v **Has-a 관계**
    - Is-a 관계
      ```objc
      //  UILabel은 UIView를 상속받은 subclass
      //  @interface UILabel : UIView <NSCoding, UIContentSizeCategoryAdjusting, UILetterformAwareAdjusting>
      
      UIView *view = [[UILabel alloc] init];
      ```
      - Is-a는 `상속 관계`를 나타내며, 명제는 `A는 B이다` (-> A는 `subclass`, B는 `superclass`)
      - SOLID 원칙의 '**S (단일 책임 원칙)**'와 '**O (개방-폐쇄 원칙)**'을 만족함
      <br>
      
    - Has-a 관계
      ```objc
      @interface SomeClass: NSObject {
          NSString *str;
      }
      
      @end
      ```
      - Has-a는 `클래스가 다른 클래스를 멤버 변수로 가지는 관계` (-> 강한 의존관계, 높은 결합도)
      - 결합도 문제를 **의존성 주입 / 제어의 역전**으로 해결
      <br>

- **Selector**
  - 메시지를 보낼 때, 해당 메서드를 식별하는 데 사용되는 데이터 형식
    ```objc
    SEL s = @selctor(doSomething:);
    ```

## [Deep Dive] - Modern Objective-C
- 💡 **id 와 instancetype 차이**
  ```objc
  - (id)init {
      if (self = [super init]) {
          //  statements
      }
      return self
  }
  ```

  ```objc
  - (instancetype)init {
      if (self = [super init]) {
          //  statements
      }
      return self
  }
  ```
  <img width="100%" src="https://github.com/Benedicto-H/Objective-C/assets/52193695/bfa1e55c-3cf6-4fd6-85ed-3ded9120add3">

  > • **instancetype**: 클래스의 initailzer의 return type을 **해당 클래스의 인스턴스로 반환**
  > <br>
  > • **id**: initailzer의 retrun type은 **모든 클래스의 인스턴스를 가리킴** (-> Swift의 `Any`와 유사)
  > <br>
  > <br>
  > **[Official Docs]**: [`id` vs `instancetype`](https://developer.apple.com/library/archive/releasenotes/ObjectiveC/ModernizationObjC/AdoptingModernObjective-C/AdoptingModernObjective-C.html)
<br>

- 💡 **프로퍼티 속성**
  ```objc
  @property (<#attributes#>) <#type#> <#name#>;
  ```
  > **[Official Docs]**: [Property Declaration Attributes](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocProperties.html)
  
    - **Default**
      |속성|설명|추가설명|
      |:---:|:---:|:---:|
      |`readwrite`|getter / setter 생성||
      |`atomic`|해당 속성에 대한 접근이 원자적으로 처리|(아래 참조)|
      |`nullable`|nil 값이 할당될 수 있음을 나타냄||
      <br>
    
    - **Non-Default**
      |속성|설명|추가설명|
      |:---:|:---:|:---:|
      |`readonly`|getter를 생성||
      |`assign`|단순 대입 수행, 원시 타입에 사용|Swift의 `unowned`에 해당|
      |`retain`|객체에 대한 참조를 보관, 해당 객체의 reference count를 증가|ARC 이전 (MRC), Swift의 `strong`에 해당|
      |`strong`|객체에 대한 참조를 보관, 해당 객체의 reference count를 증가|ARC 이후, Swift의 `strong`에 해당|
      |`nonatomic`|멀티 스레드 환경에서 속성에 대한 접근이 원자적으로 처리되지 않음|(아래 참조)|
      |`weak`|약한 참조를 생성, 다른 객체가 이 속성을 참조하지 않으면 자동으로 nil로 설정|Swift의 `weak`에 해당|
      |`nonnull`|nil 값이 할당되지 않음을 나타냄||
      <br>

    - **`atomic`** v **`nonatomic`**
      - `atomic`: **멀티 스레드 환경에서, 데이터 무결성 보장을 목적으로 read/write (getter/setter)에 `Lock 기능을 제공`하여 데이터 접근을 허용하지 않음** (즉, **Thread-safe**)
      - `nonatomic`: **멀티 스레드 환경에서, 데이터 접근을 허용한다** (즉, **Thread-unsafe**)
      <br>
 
      > `Lock`: **여러 스레드를 실행하는 환경에서 자원에 대한 접근에 제한을 강제하기 위한 동기화 매커니즘**, Mutex (상호배제), Semaphore 등이 있음
