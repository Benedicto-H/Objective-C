# Block
[Objc] Block

## [TIL] - Block Programming
- **Block**
  <img width="100%" src="https://github.com/Benedicto-H/Block/assets/52193695/7e134cb4-6979-4d0b-8c14-75013c16ad5b">
  
  > • `익명 함수(Anonymous Function)`이면서 `객체` (-> 즉, **일급 함수 (First-class Function)**)
  <br>

  - Block 선언
    <img width="100%" src="https://github.com/Benedicto-H/Block/assets/52193695/ce715c5c-486a-4093-ae49-ce150b94d0d4">
    
    > • C 언어 스타일 구문 지원과 **Runtime 시점에 동작**
    <br>
    
    ```objc
    //  returnType (^BlockName)(ParameterType);
    void (^doSomething)(void);
    ```
    
  - Block 구현
    ```objc
    doSomething = ^(void){
        NSLog(@"This is a block");
    };
    ```
    
    ```objc
    //  선언 + 구현
    void (^doSomething)(void) = ^(void){
        NSLog(@"This is a block");
    };

    //  void 파라미터는 생략가능
    void (^doSomething)(void) = ^{
        NSLog(@"This is a block");
    };
    ```
    
  - Block 호출
    ```objc
    doSomething();
    ```

  - 함수 또는 메서드에 파라미터로 전달된 Block
    ```objc
    //  SomeClass.h
    #import <Foundation/Foundation.h>

    @interface SomeClass : NSObject

    -(void)doSomething:(void (^)(void))block;

    @end

    //  SomeClass.m
    #import "SomeClass.h"

    @implementation SomeClass

    - (void)doSomething:(void (^)(void))block {
        block();
        printf("do Something \n");
    }

    @end

    //  main.m
    #import <Foundation/Foundation.h>
    #import "SomeClass.h"

    int main(int argc, const char * argv[]) {
        @autoreleasepool {
        
            SomeClass *instance = [SomeClass new];
        
            [instance doSomething:^{
                printf("This is a block \n");
            }];
        }
      return 0;
    }

    //  Prints
    //  "This is a block"
    //  "do Something"
    ```
    <br>

  > **[Official Docs]**
  > <br>
  > <br>
  > • [Programming with Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html)
  > <br>
  > • [Blocks Programming Topics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html)

## [Deep Dive] - Block (Objc) v Closure (Swift)
  - **Capturing Value**
    ```swift
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal: Int = 0
        let incrementer: () -> Int = {
            runningTotal += amount
            return runningTotal
        }

        //  incrementer를 중첩함수로 사용시
        /*
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        */

        return incrementer
    }

    let incrementByTen = makeIncrementer(forIncrement: 10)

    print(incrementByTen())
    // returns a value of 10
    
    print(incrementByTen())
    // returns a value of 20

    print(incrementByTen())
    // returns a value of 30
    ```
    - incrementer에 runningTotal과 amount 대한 **참조 (= reference)를 `캡처`** 하고 클로저 내에서 사용 (**값 자체에 대한 복사가 아닌 주소를 캡처함**)
    
      > 👉 캡처를 함으로써, 클로저 내부에서 지역 변수와 상수인 runningTotal, amount를 저장함
    <br>

  - **Closure (or Nested function)**
    ```swift
    class SomeClass {
        var str: String = "some str..."
    }

    func doSomething() -> Void {
        var number: Int = 0
        var someInstance: SomeClass = SomeClass()
    
        print("1st number: \(number)")
        print("1st str: \(someInstance.str) \n")
    
        func namedClosure() -> Void {
            print("3rd number: \(number)")
            print("3rd str: \(someInstance.str) \n")
        
            number = 10
            someInstance.str = "4th str value"
        }
    
        number = 20
        print("2nd number: \(number)")
    
        someInstance.str = "some instance"
        print("2nd str: \(someInstance.str) \n")
    
        namedClosure()
    
        print("4th number: \(number)")
        print("4th str: \(someInstance.str) \n")
    }

    doSomething()

    //  Prints
    //  1st number: 0
    //  1st str: some str... 

    //  2nd number: 20
    //  2nd str: some instance 

    //  3rd number: 20
    //  3rd str: some instance 

    //  4th number: 10
    //  4th str: 4th str value
    ```
    - 중첩 함수 namedClosure()에서 **외부 값 (= Local variables)을 사용하는 시점에 값을 평가함**
    - 즉, 값을 캡처하면 **`값/참조 타입에 관계없이`** 모두 **`Reference Capture`** 함으로써, **`원본값에 영향을 미침`** (**클로저의 경우도 동일**)
      - **❗ 만약 원본 값을 수정하지 않고 클로저나 중첩 함수 내에서만 수정하려면, **`Capture List '[]' 값 복사 (= Value Capture)`** 를 통해 해결할 수 있음**
        <img width="100%" src="https://github.com/Benedicto-H/Block/assets/52193695/b55058f6-4df4-4ae3-9543-999b13311f6c">
        > **선언하는 시점에 Value Type 값을 Value Capture (즉, const), 상수로 취급하여 캡처가 됨** (**즉, 원본 값에 대하여 수정이 `불가`**)
        
        ```swift
        let closure: () -> Void = { [number, someInstance] in
            var newNumber: Int = number
        
            newNumber = 100
            someInstance.str = "new str vlaue"
        }
        ```
        > 👉 **새로운 변수에 number를 할당하고 수정하면 원본 변수 값과는 무관해짐**
        > <br>
        > <br>
        > **값 자체를 복사** -> 주소 캡처 ❌
        <br>

      - 그러나 **Reference Type의 인스턴스**는 클로저의 동작 방식에 의해 **`capture list를 이용해도 Reference Capture 됨`**
        > Why? 👉 클로저는 기본적으로 참조 타입. 따라서 클래스 인스턴스를 캡처할 때에도 해당 인스턴스의 참조가 복사 **`(= Shallow Copy, 얕은 복사)`** 되어 클로저 내부로 전달
      <br>

  - **Block**
    ```objc
    #import "SomeClass.h"
    #import "NewClass.h"

    @implementation SomeClass

    - (void)doSomething {
        int number = 0;
        instance = [[NewClass alloc] init];
    
        printf("1st number: %d \n", number);
        printf("1st str: %s \n", instance.str.UTF8String);
        printf("\n");
    
        void (^block)(void) = ^(void){
            printf("3rd number: %d \n", number);
            printf("3rd str: %s \n", self->instance.str.UTF8String);
            printf("\n");
        };
    
        number = 20;
        printf("2nd number: %d \n", number);
    
        instance.str = @"some instance";
        printf("2nd str: %s \n", instance.str.UTF8String);
        printf("\n");
    
        block();
    }

    @end

    //  Prints
    //  1st number: 0 
    //  1st str: some str... 

    //  2nd number: 20 
    //  2nd str: some instance 

    //  3rd number: 0 
    //  3rd str: some instance
    ```
    - Block을 **선언/구현 시점에** number를 **`immutable value (= const)`** 로 캡처함 (**값 자체를 캡처**)
      <img width="100%" src="https://github.com/Benedicto-H/Block/assets/52193695/3c14fbde-d8ab-4919-8345-c5902898264f">
    
      > **값 변경 ❌ (불가능함)**
      > <br>
      > <br>
      > ⚠️ Swift의 클로저와 동작 방식이 다름! (-> 클로저는 기본적으로 **`캡처된 변수의 변경을 반영함`**)

    - Block에서 Value Type 값을 (immutable value, const) 수정하여 원본 값에도 영향을 미치게 하려면 **`__block`** 키워드를 사용
      ```objc
      #import "SomeClass.h"
      #import "NewClass.h"

      @implementation SomeClass

      - (void)doSomething {
          __block int number = 0;
          instance = [[NewClass alloc] init];
    
          printf("1st number: %d \n", number);
          printf("1st str: %s \n", instance.str.UTF8String);
          printf("\n");
    
          void (^block)(void) = ^(void){
              printf("3rd number: %d \n", number);
              printf("3rd str: %s \n", self->instance.str.UTF8String);
              printf("\n");
        
              number = 10;
              printf("4th number: %d \n", number);
          };
    
          number = 20;
          printf("2nd number: %d \n", number);
    
          instance.str = @"some instance";
          printf("2nd str: %s \n", instance.str.UTF8String);
          printf("\n");
    
        block();
      }

      @end

      //  Prints
      //  1st number: 0 
      //  1st str: some str... 

      //  2nd number: 20 
      //  2nd str: some instance 

      //  3rd number: 20 
      //  3rd str: some instance 

      //  4th number: 10 
      ```
      <img width="100%" src="https://github.com/Benedicto-H/Block/assets/52193695/8f4e0840-d7fc-4f30-bd2d-8a1c9eeb9f57">

      > `__block` 키워드로 원본 값 변경
      <br>
      
    > **[Reference]**
    > <br>
    > <br>
    > • [개발자 소들이님 - Closure와 Block의 차이점](https://babbab2.tistory.com/50)
