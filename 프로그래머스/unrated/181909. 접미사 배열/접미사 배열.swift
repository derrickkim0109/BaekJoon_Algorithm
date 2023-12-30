import Foundation

func solution(_ my_string:String) -> [String] {
    var suffixes: [String] = []

    // 문자열의 모든 접미사를 추출하여 배열에 추가
    for i in my_string.indices {
        suffixes.append(String(my_string[i...]))
    }

    // 접미사 배열을 사전순으로 정렬
    let sortedSuffixes = suffixes.sorted()

    return sortedSuffixes
}