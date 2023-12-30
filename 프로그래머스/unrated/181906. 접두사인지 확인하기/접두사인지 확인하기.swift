import Foundation

func solution(_ my_string:String, _ is_prefix:String) -> Int {
    var prefixedArray = [String]()
    
    for i in my_string.indices {
        prefixedArray.append(String(my_string[...i]))
    }
    
    if prefixedArray.contains(is_prefix) {
        return 1
    }
    
    return 0
}