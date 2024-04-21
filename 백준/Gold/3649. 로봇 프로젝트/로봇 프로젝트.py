from sys import stdin
input = stdin.readline

# 구멍을 막을 두 레고 조각 필요
# 구멍 너비 x_cm
# 구멍에 넣을 두 조각의 길이의 합은 너비와 일치해야 함
# 항상 두 조각으로 막아야 함
# 100_000_000 nano == 10cm

while True:
    try:
        x = int(input()) * 10_000_000 # nano 단위
        n = int(input()) # 레고 조각의 수
        legos = [int(input()) for _ in range(n)]
        legos.sort()
        
        start, end = 0, n - 1
        flag = True
        
        while start < end: 
            value = legos[start] + legos[end]
            
            if value == x:
                print('yes %d %d' %(legos[start], legos[end]))
                flag = False
                break 
            elif value < x:
                start += 1
            else: 
                end -= 1
        
        if flag:
            print('danger')
    except:
        break