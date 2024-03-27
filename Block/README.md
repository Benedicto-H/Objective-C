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
