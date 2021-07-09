import UIKit

//内存的两个分块: 1.栈-stack; 2.堆-heap
//指针(pointer)=内存地址

//值类型
struct PersonS{
    var name = "小王"
    var age = 20
}

let p1 = PersonS()
var p2 = p1
p2.age = 30
p1.age

//引用类型
class PersonC{
    var name = "小王"
    var age = 20
}
let p3 = PersonC()
let p4 = p3
p4.age = 30
p3.age

