import UIKit

//  内存的两个分块: 1.堆-heap; 2.栈-stack

//  栈:值类型 堆:引用类型

//  指针=内存地址

//  struct是值类型 存在栈中
struct Person {
    var name = "小王"
    var age = 20
}

let p1 = Person()
var p2 = p1

p2.age = 30
p1.age  // 20

//  class是引用类型 存在堆中
class Person2{
    var name = "小王"
    var age = 20
}

let p3 = Person2()
let p4 = p3
p4.age = 30
p3.age // 30
