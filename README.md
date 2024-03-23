# CategoryAndProtocol
[Objc] CategoryAndProtocol

## [TIL] - Category, Protocol
- **Category**
  <img width="100%" src="https://github.com/Benedicto-H/CategoryAndProtocol/assets/52193695/9ec988af-1d72-47d4-97d4-562531c2f721">
  
  > • 카테고리 네이밍 규칙: **확장시킬 클래스명+카테고리명**
  <br>

  - 카테고리 선언
    ```objc
    #import <Foundation/Foundation.h>

    @interface NSMutableArray (IntExt)
    
    -(void)addInt:(int)value;
    
    @end
    ```
    - **`@interface ClassName (CategoryName)`** 으로 정의
    - 카테고리는 기존 Class를 **확장** 으로의 목적
    - **인스턴스 변수** 추가 **불가능 ❌**
    - **프로퍼티** 추가 **가능 ✅**
    <br>

  - 카테고리 구현
    ```objc
    #import "NSMutableArray+IntExt.h"
    
    @implementation NSMutableArray (IntExt)

    - (void)addInt:(int)value {
        NSNumber *number = [[NSNumber alloc] initWithInt:value];

        [self addObject:number];
    }
    
    @end
    ```
    <br>

- **Protocol**
  - 프로토콜 선언
    ```objc
    #import <Foundation/Foundation.h>
  
    @protocol DoSomething <NSObject>

    @required
    -(void)requiredMethod;

    @optional
    -(void)optionalMethod;
    
    @end
    ```
    - 프로토콜은 인터페이스 **선언, 약속**
    - 프로퍼티, 메서드 **선언만!**
    - 프로토콜은 **다른 프로토콜** **채택 가능 ✅**
    <br>

  - 프로토콜 구현
    ```objc
    #import <Foundation/Foundation.h>
    #import "DoSomething.h"

    @interface SomeClass : NSObject <DoSomething>  // '<>'를 이용하여 프로토콜을 채택

    @end
    ```

    ```objc
    #import "SomeClass.h"

    @implementation SomeClass

    - (void)requiredMethod {
        NSLog(@"반드시 구현을 해주어야하는 메서드");
    }

    - (void)optionalMethod {
        NSLog(@"선택적으로 구현하는 메서드");
    }

    @end
    ```
    - 프로토콜은 **구현부**가 **없음 ❌**
    - 클래스가 프로토콜을 채택 **(Adopted)**

## [Deep Dive] - Category
- 💡 **Category 주의점**
  - **Method Overriding 주의**
    <img width="100%" src="https://github.com/Benedicto-H/CategoryAndProtocol/assets/52193695/709acca2-c498-4f8c-b131-be558109c0eb">
    <img width="100%" src="https://github.com/Benedicto-H/CategoryAndProtocol/assets/52193695/d4e5d88b-1dff-43c5-97bd-c534cffc9070">
    > ⚠️ **기존 클래스에서 이미 구현된 메서드를 카테고리에서도 구현하는 것에 대해 warning을 보냄**
    
    ```objc
    #import <Foundation/Foundation.h>
    #import "SomeClass.h"
    #import "SomeClass+SomeCategory.h"

    int main(int argc, const char * argv[]) {
        @autoreleasepool {
            SomeClass *instance = [SomeClass new];
        
            [instance method];
            //  Prints "Overridden method from SomeClass category"
        }
        return 0;
    }
    ```
    - '**기존 클래스에 존재하는 이름과 똑같은 이름의 메서드를 카테고리에 선언할 시, 카테고리에서 정의한 메서드로만 실행**'되어짐!
  <br>

  - **카테고리 내 고유의 메서드명 생성**
    - 같은 메서드명을 가진 카테고리가 함께 import되면, 어떤 메서드가 호출될지 **ambiguous**해짐
    <br>

- 💡 **Category 장점**
  - **확장성**: 기존 클래스의 기능을 확장/수정 가능
  - **모듈화**: 클래스의 메소드들을 기능별로 모듈화
  - **가독성**: 그룹화로 코드의 가독성을 높일 수 있음
  - **재사용성**: 여러 클래스에서 동일한 기능을 재사용, 유지보수성 향상
  - **확장 가능성**: 클래스 확장/수정이 어려운 경우에도 카테고리를 사용하여 쉽게 클래스의 기능을 확장
  - **동적 추가**: 카테고리는 런타임에 동적으로 추가되므로 다시 컴파일할 필요없이 새로운 기능을 추가
  <br>
  
  > **'확장/수정'으로, SOLID 원칙의 '개방/폐쇄 원칙 (Open/Closed Principle)'을 만족함**
  <br>

- 💡 **Extension**
  - `Extension`은 카테고리의 '일종'이며, **익명 카테고리**이다
  - **해당 클래스의 구현부(.m) 내에서만 Extension이 가능** (-> **선언부가 필요없음 ❌**)
  - 해당 클래스 외부에서 **호출 불가능 ❌** (-> **메서드, 프로퍼티가 모두 `private`으로, 클래스 내부에서만 접근이 가능 ✅**)
  - **클래스의 구현 세부사항을 숨기고 (private), 외부에서는 사용할 수 없는 메서드를 선언하기 위해 사용**
  <br>

  ```objc
  //  SomeClass.m
  #import "SomeClass.h"

  @interface SomeClass ()

  -(void)extendedMethod;

  @end

  @implementation SomeClass

  - (void)method {
      printf("Method.. \n");
  }

  - (void)extendedMethod {
      printf("Extended Method \n");
  }

  @end
  ```
  <img width="100%" src="https://github.com/Benedicto-H/CategoryAndProtocol/assets/52193695/8a33029c-ae59-4a19-96aa-f77e21f95f7d">
  
  > ⚠️ **외부에서 `extendedMethod()`메서드에 접근을 못함**
  > <br>
  > <br>
  > 굳이 접근을 하고자 한다면, 클래스 헤더파일에서 `extendedMethod()`를 선언해야함
