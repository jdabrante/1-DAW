# If we were to set up a Tic-Tac-Toe game, we would want to know whether the board's current state is solved, wouldn't we? Our goal is to create a function that will check that for us!

# Assume that the board comes in the form of a 3x3 array, where the value is 0 if a spot is empty, 1 if it is an "X", or 2 if it is an "O", like so:

# [[0, 0, 1],
#  [0, 1, 2],
#  [2, 1, 0]]

# We want our function to return:

#     -1 if the board is not yet finished AND no one has won yet (there are empty spots),
#     1 if "X" won,
#     2 if "O" won,
#     0 if it's a cat's game (i.e. a draw).

# You may assume that the board passed in is valid in the context of a game of Tic-Tac-Toe.


def analyze_line(board):
    for line in board:
        if line.count(1) == len(line):
            return 1
        if line.count(2) == len(line):
            return 2
    return -1

def analyze_column(board):
    col_dict = {}
    for line in board: 
        for i, mark in enumerate(line):
            if i not in col_dict: 
                col_dict[i] = [mark]
            else: 
                col_dict[i].append(mark)
    for col in col_dict.values():
        if col.count(1) == len(col):
            return 1
        elif col.count(2) == len(col):
            return 2
    return -1
        
def analyze_main_diagonal(board):
    diagonal = []
    for i, line in enumerate(board): 
        diagonal.append(line[i])
    if diagonal.count(1) == len(diagonal):
        return 1
    elif diagonal.count(2) == len(diagonal):
        return 2
    return -1

def is_solved(board):
    result_line = analyze_line(board)
    result_column = analyze_column(board)
    result_main_diagonal = analyze_main_diagonal(board)
    result_reverse_diagonal = analyze_main_diagonal(board[::-1])
    result = [result_line,result_column,result_main_diagonal,result_reverse_diagonal]
    if 1 in result: 
        return 1
    elif 2 in result: 
        return 2
    elif -1 in result:
        for line in board: 
            if 0 in line: 
                return -1
        return 0


board = [[2,1,2],[2,1,1],[1,1,2]]

print(is_solved(board))