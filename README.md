# Collection
[Objc] Collection

## [TIL] - Collection
- **Array**
  - **NSArray** v **NSMutableArray**
    - `NSArray`는 **정적 배열 (Immutable, `불변`)** 이며, **요소 핸들링 `불가능`**
      ```objc
      //  NSArray 인스턴스 인수생성자 (Args constructor)를 사용하여 선언 및 초기화하는 경우
      NSArray *array = [[NSArray alloc] arrayWithObjects:@"element1", @"element2", ..., nil];

      //  리터럴 값으로 선언 및 초기화하는 경우
      NSArray *array = @[@"element1", @"element"];
      ```
      
    - `NSMutableArray`는 **동적 배열 (Mutable, `가변`)** 이며, **요소 핸들링 `가능`**
      ```objc
      //  NSMutableArray는 NSArray를 상속받은 subclass

      //  NSArray의 팩토리 메서드를 사용하여 빈 배열 선언 및 초기화하는 경우
      NSMutableArray *array = [NSMutableArray array];

      //  여러가지 방식의 선언 및 초기화
      NSMutableArray *array = [[NSMutableArray alloc] init];
      NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[NSArray array]];

      //  ===== insert =====
      [array addObject:@"element1"];  //  단일 삽입
      NSLog(@"%@", array);  //  출력: (element1)
      
      [array addObjectsFromArray:@[@"element2", @"element3"]];  //  다수 삽입
      NSLog(@"%@", array);  //  출력: (element1, element2, element3)
      
      //  ===== update =====
      array[1] = "update_element2";  //  인덱스를 통해 요소 접근하여 수정
      NSLog(@"%@", array);  //  출력: (element1, update_element2, element3)

      [array replaceObjectAtIndex:2 withObject:@"update_element3"];  //  `replaceObjectAtIndex:withObject` 메서드를 통해 수정
      NSLog(@"%@", array);  //  출력: (element1, update_element2, update_element3)
      
      //  ===== remove =====
      [array removeObject:array[2]];  //  인덱스를 통해 단일 요소 삭제
      [array removeAllObjects];  //  전체 삭제

      //  ===== read =====
      NSLog(@"arr: %@, arr);
      
      for (int i = 0; i < arr.count; i++) {  //  C언어 스타일의 for문으로 인덱스를 통해 각 요소 출력
          NSLog(@"arr: %@", arr[i]);
          //  NSLog(@"arr: %@", [arr objectAtIndex:i]);
      }
      
      for (id element in arr) {  //  objc의 Enumeration을 통해 요소 출력
          NSLog(@"arr: %@", element);
      }
      ```
      
- **Dictionary**
  - **NSDictionary**
    ```objc
    //  NSDictionary 인스턴스 인수생성자 (Args constructor)를 사용하여 선언 및 초기화하는 경우
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"object1", @"Key1", @"object2", @"Key2", @"object3", @"Key3", nil];

    //  리터럴 값으로 선언 및 초기화하는 경우
    NSDictionary *dict = @{@"Key1": @"new object1",
                           @"Key2": @"new object2",
                           @"Key3": @"new object3"};

    //  키 (Key)에 접근하여 값 (Value) 찾기
    NSLog(@"(dict) Key1: %@", [dict objectForKey:@"Key1"]);
    ```
    
  - **NSMutableDictionary**
    ```objc
    //  Dictionary 생성
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    //  키-값 추가
    [dict setObject:@"obj1" forKey:@"Key1"];
    [dict setObject:@"obj2" forKey:@"Key2"];
    
    //  키를 통해 값 수정
    dict[@"Key2"] = @"new obj2";
    
    //  키를 통해 값 삭제
    [dict removeObjectForKey:@"Key2"];
    ```
  
## [Deep Dive] - Enumeration
  - 💡 **for문** v **for-in문**
    ```objc
    NSMutable *array = @[@"element1", @"element2", @"element3];

    for (int i = 0; i < arr.count; i++) {
        //  ...
        //  -> 컬렉션의 요소에 직접 핸들링이 가능
    }

    for (id element in arr) {
        //  ...
        //  -> `id`에 의해 컬렉션의 요소를 참조하여 '요소의 원본을 보호'하여, 컬렉션 요소의 '복사본을 생성하고 핸들링' 함
        //   (즉, 원본 요소에 영향을 미치지 않음!)
    }
    ```
