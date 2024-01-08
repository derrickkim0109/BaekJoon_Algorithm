import Foundation

func solution(_ date1:[Int], _ date2:[Int]) -> Int {
    var (fY, fM, fD) = (date1[0], date1[1], date1[2])
    var (sY, sM, sD) = (date2[0], date2[1], date2[2])
    
    if fY != sY {
        return fY < sY ? 1 : 0 
    }
    
    if fM != sM {
        return fM < sM ? 1 : 0 
    }
    
    if fD != sD {
        return fD < sD ? 1 : 0 
    }
    
    return 0
}
