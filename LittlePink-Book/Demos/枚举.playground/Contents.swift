import UIKit

//  MARK: - 语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToHead: CompassPoint = .east
directionToHead = .north

//  MARK: - 遍历
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
//  MARK: -  原始值 Raw Values

enum ASCIIControlCharacter:Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
ASCIIControlCharacter.tab.rawValue

//隐式的给case赋原始值
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
Planet.earth.rawValue

enum CompassPoint2: String {
    case north, south, east, west
}
CompassPoint2.north.rawValue

Planet.uranus
Planet(rawValue: 7)
 
//  MARK: - 关联值 Associated Values

enum Barcode {
    case uqc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.uqc(8, 85909, 51226, 3)
productBarcode = .qrCode("xxx")

//判断并取出关联值
switch productBarcode {
case let .uqc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

//  判断并取出关联值的简写
if case let .qrCode(productBarcode) = productBarcode {
    print(productBarcode)
}
