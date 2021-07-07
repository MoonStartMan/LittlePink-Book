import UIKit

//  ARC(Automatic Reference Counting)-自动引用计数
//  内存管理机制

//  会造成不好的现象: Reference Cycle-循环引用,从而导致内存泄露(memory leak)
//  解决方法: weak(弱引用)和unowned(无主引用)
class Author {
    var name: String
    weak var video: Video?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("author对象被销毁了")
    }
}

class Video {
    unowned var author: Author
    init(author: Author) {
        self.author = author
    }
    deinit {
        print("video对象被销毁了")
    }
}

var author:Author? = Author(name: "Lebus")
var video:Video? = Video(author: author!)
author?.video = video

author = nil
video = nil

class vc: UIViewController, UITableViewDelegate {
    var tableView: UITableView!
    override func viewDidLoad() {
        tableView.delegate = self
    }
}

//  MARK: - 捕获列表CaptureList--闭包循环引用的解决方案
//  1.普通闭包
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHML())
paragraph = nil

//2.逃逸闭包--见didFinishPicking
