''' ******************************************************************************************************
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
  
 def compress(text, tok_len):
    words = [text[i:i+tok_len] for i in range(0, len(text), tok_len)]
    res = []
    cur_word = words[0]
    cur_cnt = 1
    for a, b in zip(words, words[1:] + ['']):
        if a == b:
            cur_cnt += 1
        else:
            res.append([cur_word, cur_cnt])
            cur_word = b
            cur_cnt = 1
    return sum(len(word) + (len(str(cnt)) if cnt > 1 else 0) for word, cnt in res)

def solution(text):
    return min(compress(text, tok_len) for tok_len in list(range(1, int(len(text)/2) + 1)) + [len(text)])

''' ******************************************************************************************************
002 : 신규 아이디 추천
  LEVEL : 1
'''

def solution(new_id):
    # 1단계
    new_id = new_id.lower()
    # 2단계
    answer = ''
    for word in new_id:
        if word.isalnum() or word in '-_.':
            answer += word
    # 3단계
    while '..' in answer:
        answer = answer.replace('..', '.')
    # 4단계
    answer = answer[1:] if answer[0] == '.' and len(answer) > 1 else answer
    answer = answer[:-1] if answer[-1] == '.' else answer
    # 5단계
    answer = 'a' if answer == '' else answer
    # 6단계
    if len(answer) >= 16:
        answer = answer[:15]
        if answer[-1] == '.':
            answer = answer[:-1]
    # 7단계
    if len(answer) <= 3:
        answer = answer + answer[-1] * (3-len(answer))
    return answer
  
''' ******************************************************************************************************
003 : 숫자 문자열과 영단어
  LEVEL : 1
'''
  
def solution(s):
    answer = 0
    a = ['zero', 'one', 'two', 'three', 'four',
         'five', 'six', 'seven', 'eight', 'nine']
    for i in a:
        s = s.replace(i, str(a.index(i)))
    return int(s)
