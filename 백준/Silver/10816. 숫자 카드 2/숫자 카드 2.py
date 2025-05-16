import sys
from collections import defaultdict
input = sys.stdin.readline

N = int(input())
A = list(map(int, input().split()))
A_cnt = defaultdict(int)
for num in A:
    A_cnt[num] += 1

M = int(input())
num_list = list(map(int, input().split()))

result = [str(A_cnt[num]) for num in num_list]
print(' '.join(result))