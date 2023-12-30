import Foundation

func solution(_ my_string:String, _ is_suffix:String) -> Int {
    var suffixes: [String] = []

    // 문자열의 모든 접미사를 추출하여 배열에 추가
    for i in my_string.indices {
        suffixes.append(String(my_string[i...]))
    }
    
    if suffixes.contains(is_suffix) {
        return 1
    }

    return 0
}