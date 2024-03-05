var zeroCount = [Int](repeating: 0, count: 41)
var oneCount = [Int](repeating: 0, count: 41)
// 초기값 설정
zeroCount[0] = 1 // 0이 출력되는 횟수
oneCount[1] = 1 // 1이 출력되는 횟수

// 테스트 케이스 개수 입력
let t = Int(readLine()!)!
var answer = [Int]()
for _ in 0..<t {
    // N 입력
    let n = Int(readLine()!)!
    answer.append(n)
}

// 2부터 40까지 각 숫자에 대해 0과 1의 출력 횟수 계산
for i in 2...40 {
    zeroCount[i] = zeroCount[i - 1] + zeroCount[i - 2]
    oneCount[i] = oneCount[i - 1] + oneCount[i - 2]
}

for index in answer {
    print("\(zeroCount[index]) \(oneCount[index])")
}
