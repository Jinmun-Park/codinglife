'''
001 : 문자열 압축
  LEVEL : 2

'''

s = "aabbaccc"

def solution(s):
    result = []

    if len(s) == 1:
        return 1
    for i in range(1, (len(s)//2)+1): # "aabba|ccc" (1,2,3,4) --> a,b,b,a
        # 1, 2, 3, 4
        # a, b, b, a
        b = ''
        cnt = 1
        tmp = s[:i] # "aabb|accc" --> a, aa, aab, aabb
        # a
        # aa
        # aab
        # aabb
        for j in range(i, len(s), i):
            # 1| 1, 2, 3, 4, 5, 6, 7
            # 2| 2, 4, 6
            # 3| 3, 6,
            # 4| 4
            if tmp == s[j:i+j]:
                # tmp = "a a b b a c c c"
                # 1 | 1(a), 2(b), 3(b), 4(a), 5(c), 6(c), 7(c)
                # 2 | bb, ac, cc
                # 3 | bac, cc
                # 4 | accc
                cnt += 1
            else:
                if cnt != 1:
                    b = b + str(cnt) + tmp
                else:
                    b = b + tmp
                tmp = s[j:j+i]
                cnt = 1
            if cnt != 1:
                b = b + str(cnt) + tmp
            else:
                b = b + tmp

            result.append(len(b))
        return min(result)
