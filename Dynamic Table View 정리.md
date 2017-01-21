# Dynamic Table View 정리

## Dynamic Table View 디자인 방법!

❌ Table View는 개발자가 **직접 Table Cell을 꾸며서 넣어**주는 방법?  

⭕️ Table View 의 **응답에 대응하는 방식**으로 표시!  

## Dynamic Table View 동작 방식

< 등장 인물들 >  

1. **DataObjects** - **M**odel
2. **TableView** - **V**iew
3. **TableviewController** - **C**ontroller

MVC 패턴으로 되어있다.

  

< 동작 방식 >

1. TableView가 (리)로드될 때, TableView에 데이터를 뿌릴 책임이 있는 TableviewController에게 **"내가 몇 개의 Section을 준비할까?"** 물어본다.

   →  TableviewController의 `numberOfSectionsInTableView:` 메소드를 호출함!

   → Int(정수) 타입의 값을 리턴해주면, TableView가 **Section의 개수를 준비한다.**

   ex) 개발자는 뿌릴 데이터의 형식에 따라 Section의 개수를 결정하여 리턴해주면 된다.

2. 다음으로 TableView가 TableviewController에게 **"0번 Section에는 Row가 몇 개 준비되야 하지?"** 물어본다.

   → TableView가 TableviewController의 `tableView:numberOfRowsInSection:` 메소드의 매개변수로 0번부터 Section의 개수-1까지 TableviewController에게 물어봅니다.

3. 다음으로 TableView가 TableviewController에게 "0번 Section의 0번 Row를 지금 뿌리려고 하는데, 어떤 내용이 들어가야 할까?" 물어본다.

   → 마찬가지로, TableviewController의 `tableView:cellForRowAtIndexPath:` 메소드를 호출함

   → Section과 Row의 정보가 `IndexPath` 매개변수를 통해 넘어옴.

   → 메소드 안에서 DataObject, 즉 View Object 를 리턴해주면, TableView는 해당 위치에 그 View Object를 뿌리게 된다.

## TableView는 왜 이렇게 동작하는가?

1. TableView는 유사한 형태의 View가 반복적으로 엄청 많이 표시될 것을 전제로 디자인된 뷰 오브젝트이다.
2. 그러나 화면에 표시될 데이터는 한정적이기 때문에, (가뜩이나 메모리가 달리는 스마트폰의 특성상...) 효율적으로 대량의 데이터를 표시하기 위해, 필요한 부분만 화면에 뿌려주는 방식으로 동작된다.  
3. 이는 개발자가 직접 알 수 있는 정보가 아니며, TableView가 화면을 갱신하며 스스로 판단할 수 있는 정보이다. ( TableView 자신이 하지 않으면, 다른 누군가가 끊임없이 TableView의 화면을 감시 해야할 것이다. )
4. 따라서 TableView 가 데이터와 View를 요청하고, 우리는 그 요청에 응답하는 방식으로 TableView의 화면이 업데이트 된다.

→ 이러한 **요청**과 **응답**에 대한 약속을 **"프로토콜(Protocol)"** 이라고 한다. 테이블뷰가 개발자에게 물어보는 약속된 메소드 구현을 **"테이블 뷰 데이터소스 프로토콜"** 이라고 한다.

→ TableView도 객체, TableviewController도 객체이므로 서로 메시지를 주고받으면서 효율적으로 TableView가 동작한다는 OOP의 특성을 잘 이용한 결과라고 생각한다.