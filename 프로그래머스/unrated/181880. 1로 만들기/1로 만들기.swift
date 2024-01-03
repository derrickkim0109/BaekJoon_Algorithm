import Foundation

func solution(_ num_list:[Int]) -> Int {
    var answer = 0
    var numbers = num_list
    
    for i in 0..<num_list.count {
        while(numbers[i] != 1){
            if(numbers[i] % 2 == 0){
                numbers[i] = numbers[i] / 2;  
            } else {
                numbers[i] = (numbers[i] - 1) / 2;
            }
            
            answer += 1
        }
    }
    
    return answer
}