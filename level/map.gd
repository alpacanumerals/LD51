extends TileMap

var block_1 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0]]

var block_2 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0]]

var block_3 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0]]

var blocks = [block_3, block_1, block_2, block_3, block_1, block_2]

func _ready():
    draw_map()

func draw_map():
    for block_number in range(6):
        set_block(block_number, blocks[block_number])
    set_outer_wall()

# block_number is an integer from 0 to 5 defining the position on the 3x2 grid of 8x8 blocks
func set_block(block_number, block_grid):
    var x_offset = (block_number % 3) * 8
    var y_offset = int(block_number / 3) * 8
    
    for local_y in range(8):
        for local_x in range(8):
            var x = local_x + x_offset
            var y = local_y + y_offset
            set_cell(x, y, block_grid[local_y][local_x])
            
func set_outer_wall():
    for x in range(24):
        set_cell(x, 0, 3)
        set_cell(x, 15, 3)
    for y in range(14):
        set_cell(0, y+1, 3)
        set_cell(23, y+1, 3)
