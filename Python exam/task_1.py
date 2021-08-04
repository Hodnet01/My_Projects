from random import randint

n = int(input('Enter patametr n: '))
a = int(input('Enter patametr a: '))
b = int(input('Enter patametr b: '))
matrix = []
for _ in range(n):
    row = []
    for _ in range(n):
        elem = randint(a, b)
        row.append(elem)
    matrix.append(row)
print(matrix)
print()
string = list(input('Enter the string with n symbols: '))
for line, index in zip(matrix, string):
    # print('line: ', line)
    # print('index: ', index)
    small_list = line[int(index):]
    print(sum(small_list))
