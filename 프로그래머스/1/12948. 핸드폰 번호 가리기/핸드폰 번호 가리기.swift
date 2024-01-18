func solution(_ phone_number:String) -> String {
    let startIndex = phone_number.index(
        phone_number.startIndex,
        offsetBy: phone_number.count - 4
    )

    let endIndex = phone_number.index(
        phone_number.startIndex,
        offsetBy: phone_number.count
    )

    let answer = Array(repeating: "*", count: phone_number.count - 4).joined()
    return answer + phone_number[startIndex..<endIndex]
}