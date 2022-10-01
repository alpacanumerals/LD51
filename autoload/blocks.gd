extends Node

#the rows 0-7 describe the grid in tile terms
#row 8 describes player spawn validity
#row 9 gives mob spawn locations. the location is the top left of the tile
#when defining mob spawns remember to be careful of the autowall and not put them at the perimeter
const block_1 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               true,
               [[2,2], [6,2], [2,6], [6,6]]]

const block_2 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               false,
               [[2,2], [6,2], [2,6], [6,6]]]

const block_3 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 2, 1, 1, 2, 0, 0],
               [0, 0, 2, 1, 1, 2, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               false,
               []]

const block_4 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 1, 1, 0, 0, 0],
               [0, 0, 0, 1, 1, 0, 0, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               true,
               [[4,2], [2,4], [6,4], [4,6]]]
            
const blocks = [block_1, block_2, block_3, block_4]
