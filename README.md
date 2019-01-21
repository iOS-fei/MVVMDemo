# MVVM+RAC实战
## 话不多少，先上效果图
* 至于cell为什么会这样，我只是想把平时常用的视图控件展示在页面上。例如UILabel、UIImageView、UIButton以及UITextField。
![image](https://github.com/iOS-fei/MVVMDemo/blob/master/img-folder/小张-2019-01-01-10.53.55.gif)
## MVVM解决了什么问题？
* 实现**代码复用**，有利于开发业务无关UI组件。
* 实现UI组件级别的**单元测试**，而不需要复杂的Mock。
## UML架构图
* **代码复用** - ViewModel与View之间的耦合关系更加松散，从而可以实现View的复用。
![Image text](https://github.com/iOS-fei/MVVMDemo/blob/master/img-folder/Snip20190118_2.png)
## 单元测试
* 由于“绑定”关系是通过三方框架建立的，绑定的结果是可信的。因此只需要测试到ViewModel一级，就可以覆盖业务逻辑在UI上的体现。又由于ViewModel本身都是普通Objective-C对象，不需要复杂的Mock就可以运行，所以更容易进行单元测试。
```
- (void)testExample {

MainViewModel *mainVM = [[MainViewModel alloc] init];
NSMutableArray *listArr = [mainVM valueForKey:@"listArr"];

[mainVM requestSuccessBlock:^(id  _Nonnull data) {

} failureBlock:^(NSString * _Nonnull errorMsg) {
XCTAssertEqualObjects(errorMsg, @"123");
}];
[mainVM didSelectRowWithIndex:2];
YTOMyOrderCellViewModel *cellVM = listArr[2];
XCTAssertEqualObjects(cellVM.mainModel.address, @"我是会改变的!");
}
```
## 鸣谢
* 在此特别感谢美团的宁哥为我提出许多宝贵的意见
