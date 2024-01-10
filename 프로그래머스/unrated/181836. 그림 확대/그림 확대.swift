import Foundation

func solution(_ picture:[String], _ k:Int) -> [String] {
    let rows = picture.count
    let cols = picture[0].count

    let newRows = rows * k;
    let newCols = cols * k;

    var newPicture = Array(repeating: "", count: newRows)

    for i in 0..<newRows {
        var str = ""
        let row = i / k
        
        for j in 0..<newCols {
            let col = j / k
            let pixel = picture[row][picture[row].index(picture[row].startIndex, offsetBy: col)]
            str.append(pixel)
        }
        
        newPicture[i] = str
    }

    return newPicture
}