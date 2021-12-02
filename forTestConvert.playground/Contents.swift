import UIKit
//
//var greeting = "Hello, playground"
//
//var date = "2021-11-30"
//print(date)
//var change1: String = date.replacingOccurrences(of: "-", with: "")
//// "20211130"??
//
////print(change1)
//
//var convertDate = Int(change1)
//if let safeConvert = convertDate {
//    print(safeConvert)
//    let sum = safeConvert + 70
//    print(sum) //2021200
//
////20211228(date) - 20211225(current) <= 3days ->change to red color
//
//    var convertSum = String(sum)
//    print(convertSum)
//    convertSum.insert("-", at: convertSum.index(convertSum.startIndex, offsetBy: 4))
//    print(convertSum)
//    convertSum.insert("-", at: convertSum.index(convertSum.endIndex, offsetBy: -2))
//    print(convertSum)
//}

let now=Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let nowDate = dateFormatter.string(from: now)
print(nowDate)


