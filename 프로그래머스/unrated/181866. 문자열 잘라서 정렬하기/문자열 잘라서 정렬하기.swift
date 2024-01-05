import Foundation

func solution(_ myString:String) -> [String] {
    return myString.split(separator: "x").map{ String($0) }.sorted()
}