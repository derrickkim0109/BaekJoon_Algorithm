n = int(input()) # 시험장의 개수
a = list(map(int, input().split())) # 각 시험장 응시자 수

# b = 총감독관이 감시할 수 있는 응시자 수 
# c = 부감독관이 감시할 수 있는 응시자 수 
b, c = map(int, input().split())

count = n 

for l in a:
    l -= b
    if l > 0:
        if l % c:
            count += (l // c) + 1
        else:
            count += (l // c)

print(count)