# Memory
[Objc] Memory

## [TIL] - Memory Management
- **ARC (Automatic Reference Counting, 자동 참조 계산)**
  <img width="100%" src="https://developer.apple.com/library/archive/releasenotes/ObjectiveC/RN-TransitioningToARC/Art/ARC_Illustration.jpg">
  > • 왼쪽은 과거 MRC로 메모리를 `수동`으로 관리, 오른쪽은 ARC로 메모리를 `자동`으로 관리
  
  - ARC의 등장으로 **메모리가 자동으로 해제**
  - ARC는 **컴파일 타임**에 `코드를 분석`하여, **Retain count (= Reference count) 관리 코드 (retain/release)를 자동으로 삽입**
  <br>
  
  ```objc
  #import "Tracer.h"
  
  @implementation Tracer
    
  - (void)dealloc
  {
      NSLog(@"dealloc!");
  }
  
  @end
  ```
  
  ```objc
  int main(int argc, const char * argv[]) {
      @autoreleasepool {
          Tracer *tracer = [Tracer new];  //  RC +1

          printf("tracer 포인터 변수: %s \n", [tracer.description UTF8String]);
          printf("tracer 포인터 변수가 가지고 있는 Tracer의 인스턴스 주소값: %p \n", tracer);
          printf("tracer 포인터 변수 자체의 주소값: %p \n", &tracer);

          //  tracer = nil  //  RC -1, 그러나 ARC에 의해 자동으로 메모리 해제가 되어서 명시해줄 필요가 없음
      }  //  RC: 0, 이 부분에서 메모리 해제가 자동으로 발생
      return 0;
  }
  ```
    <img width="100%" src="https://github.com/Benedicto-H/Objective-C/assets/52193695/ce74e8bd-e7a7-4c90-8f14-8ecb37a1de25">

<br>
  
- **MRC (Manual Reference Counting, 수동 참조 계산)**
  <img width="100%" src="https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Art/memory_management_2x.png">
  <br>
  
  - MRC는 메모리를 **수동으로 관리**
  - 레퍼런스 증가: `alloc/init`, `new`, `copy`, `mutableCopy`, `retain` 등 사용
  - 레퍼런스 감소: `release` 등 사용
  <br>
  
  <img width="100%" src="https://github.com/Benedicto-H/Objective-C/assets/52193695/e765528d-4943-4657-90af-9aec1d4abebf">

  > • MRC를 사용하려면 위와 같이 `No`로 설정해줘야 함
  > <br>
  > -> **ARC가 나오고 MRC는 사용할 일이 거의 없음 (없다봐도 무방!)**
  <br>
    
  ```objc
  #import "Tracer.h"

  @implementation Tracer
    
  - (void)dealloc
  {
      NSLog(@"dealloc!");
      [super dealloc];
  }

  @end
  ```
  > • dealloc()에 `[super dealloc]`를 호출하지 않을 경우, 부모 클래스의 메모리 정리 코드가 실행되지 않아 `메모리 누수가 발생할수 있음`
  <br>

  ```objc
  int main(int argc, const char * argv[]) {
      NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  //  혹은 [NSAutoreleasePool new];

      Tracer *tracer = [Tracer new];  //  RC +1

      printf("tracer 포인터 변수: %s \n", [tracer.description UTF8String]);
      printf("tracer 포인터 변수가 가지고 있는 Tracer의 인스턴스 주소값: %p \n", tracer);
      printf("tracer 포인터 변수 자체의 주소값: %p \n", &tracer);

      [tracer release];  //  객체의 참조 수를 감소시켜 해당 객체의 메모리를 해제 RC -1 (즉, RC: 0)
      
      [pool drain];  //  혹은 [pool release];
      return 0;
  }
  ```
  <img width="100%" src="https://github.com/Benedicto-H/Objective-C/assets/52193695/2e8bfdaf-4366-4109-8f13-4566b2363661">

<br>

> **[Official Docs]**
> <br>
> <br>
> • [Transitioning to ARC Release Notes](https://developer.apple.com/library/archive/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html)
> <br>
> • [About Memory Management](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html#//apple_ref/doc/uid/10000011i)
