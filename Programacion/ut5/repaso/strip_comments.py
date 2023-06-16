# Complete the solution so that it strips all text that follows any of a set of comment markers passed in. Any whitespace at the end of the line should also be stripped out.

# Example:

# Given an input string of:

# apples, pears # and bananas
# grapes
# bananas !apples

# The output expected would be:

# apples, pears
# grapes
# bananas

# The code would be called like so:

# result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# # result should == "apples, pears\ngrapes\nbananas"


def join_to_line_break(strng: list):
    new_strng = []
    init_removal = False
    break_line = "\n"
    for char in strng[::-1]:
        if char == break_line and not init_removal:
            new_strng.insert(0,char)
            init_removal = True
            continue
        if char != " " and init_removal:
            new_strng.insert(0,char)
            init_removal = False
            continue
        if not init_removal:
            new_strng.insert(0,char)
    return new_strng

def strip_comments(strng, markers):
    clean_strng = []
    del_rest = False
    line_break = "\n"
    for i,char in enumerate(strng):
        if line_break == char:
            del_rest = False
            clean_strng.append(strng[i])
            continue
        if char in markers or del_rest:
            del_rest = True
            continue
        clean_strng.append(strng[i])
    return "".join(join_to_line_break(clean_strng)).rstrip()


new_coment = strip_comments('a #b\nc\nd $e f g', ['#', '$'])









# def search_line_break(strng: str, i: int, strng_list: list):
#     line_break = "\n"
#     strng_list[i] = strng[strng.index(line_break):]

# def strip_comments(strng, markers):
#     strng_list = strng.strip().split(" ")
#     eliminate_rest = False
#     line_break = '\n'
#     del_list = []
#     for i, word in enumerate(strng_list):
#         if word[0] in markers and not eliminate_rest:
#             eliminate_rest = True
#             if line_break in word:
#                 search_line_break(word,i,strng_list)
#             else: 
#                 del_list.insert(0,i) 
#             continue
#         if line_break in word and eliminate_rest:
#             search_line_break(word,i,strng_list)
#             eliminate_rest = False
#         if eliminate_rest:
#             del_list.insert(0,i)
    
#     for index in del_list:
#         del strng_list[index]
#     for i,word in enumerate(strng_list): 
#         del_list = []
#         if line_break in word and strng_list.index(word) > 0:
#             strng_list[i] = strng_list[i-1] + word
#             del_list.append(i - 1)
#         if len(del_list) > 0: 
#             for index in del_list: 
#                 del strng_list[index]
#     return " ".join(strng_list)


# new_coment = strip_comments('a #b\nc\nd $e f g', ['#', '$'])
# print(new_coment)

# apples, pears\ngrapes\nbananas