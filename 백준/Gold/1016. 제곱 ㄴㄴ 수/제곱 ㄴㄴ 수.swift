        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let min = input[0]
        let max = input[1]

        var ans = max - min + 1 // 살펴봐야 하는 숫자의 개수
        var sieve = Array(repeating: false, count: max - min + 1)
        var i = 2 // 처음 제곱수는 2*2이므로 i = 2로 초기화

        // 제곱수가 max보다 작거나 같을 때만 진행

        while i * i <= max {
            // 처음으로 i * i로 나누어떨어지는 수를 찾아야 함
            var sNum = min / (i * i)
            if min % (i * i) != 0 {
                sNum += 1
            }
            // 구하려는 수는 1씩 증가시키고 제곱수 인 모든 인덱스를 true로 표시한다.
            while sNum * (i * i) <= max {
                if sieve[sNum * (i*i) - min] == false {
                    sieve[sNum * (i*i) - min] = true
                    ans -= 1
                    // true로 표시하는 과정은 모두 나누어 떨어지는 숫자이므로
                    // 살펴봐야 하는 숫자의 총 개수에서 1개씩 빼주면 된다.
                }
                
                sNum += 1
            }
            i += 1 // 다음 제곱수로 넘어가기 위해 i를 1씩 증가
        }

        print(ans)