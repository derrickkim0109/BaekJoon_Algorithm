let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var lis = Array(repeating: 0, count: 1001)
var j = 0
var i = 1

lis[0] = arr[0] // lis 배열의 맨 첫번째 값은 arr[0]으로 초기화

// arr의 두번째부터 마지막까지 하나씩 lis와 비교하면서 넣어준다.
while i < n {
    // lis 배열의 맨 뒤의 값보다 arr[i]가 더 크면 그것을 lis 배열 맨 뒤에 넣어준다.
    if lis[j] < arr[i] {
        lis[j + 1] = arr[i]
        j += 1
    }
    // arr[i]값이 더 작으면, arr[i]의 값이 lis 배열 중 어느 곳에 들어올지 이분탐색한다.
    else {
        let idx = binarySearch(0, j, arr[i]) // 0부터 j까지 탐색하면서 arr[i]가 들어갈 수 있는 위치를 찾아서 idx에 반환
        lis[idx] = arr[i]
    }
    i += 1
}

print(j + 1)

// LIS를 유지하기 위해 숫자가 들어갈 위치를 이분탐색으로 찾는 함수
func binarySearch(_ left: Int, _ right: Int, _ target: Int) -> Int {
    var left = left
    var right = right
    var mid: Int

    while left < right {
        mid = (left + right) / 2 // 중간값 설정

        if lis[mid] < target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return right
}
