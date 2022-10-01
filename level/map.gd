extends TileMap

#the rows 0-7 describe the grid in tile terms
#row 8 describes player spawn validity, and then mob spawn locations
var block_1 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [true]]

var block_2 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 2, 2, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [false]]

var block_3 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 2, 1, 1, 2, 0, 0],
               [0, 0, 2, 1, 1, 2, 0, 0],
               [0, 0, 2, 2, 2, 2, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [false]]

var block_4 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 1, 1, 0, 0, 0],
               [0, 0, 0, 1, 1, 0, 0, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [true]]

var blocks = [block_1, block_1, block_1, block_1, block_1, block_1]

var fallback_blocks = [block_1, block_1, block_1, block_1, block_1, block_1]

func _ready():
    draw_map()

func draw_map():
    var block_options = [block_1, block_2, block_3, block_4]
    
    
    for n in range(blocks.size()):
        blocks[n] = block_options[randi() % block_options.size()]
    var iterations = 0
    while !validate_blocks() && iterations < 63:
        for n in range(blocks.size()):
            blocks[n] = block_options[randi() % block_options.size()]
        iterations += 1
    if iterations > 63:
        blocks = fallback_blocks
    
    for block_number in range(blocks.size()):
        set_block(block_number, blocks[block_number])
    
    set_outer_wall()

func validate_blocks():
    var starts = 0
    for block in blocks:
        if block[8][0]:
            starts += 1
    
    print(starts > 0)
    return starts > 0

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

func get_start_block():
    var start_block_numbers = []
    for n in blocks.size():
        #print(blocks[n][8][0])
        if blocks[n][8][0]:
            start_block_numbers.push_back(n)
    
    return start_block_numbers[randi() % start_block_numbers.size()]
    
    
