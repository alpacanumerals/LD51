extends TileMap

var map_blocks = [
    blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1]

var fallback_blocks = [
    blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1, blocks.block_1]

func _ready():
    draw_map()

func draw_map():
    var block_options = blocks.blocks
    
    # the map has 6 'blocks' used for random gen in a 3x2 grid. each is 8x8 tiles
    
    # picks a random block from the options for each block to start
    for n in range(map_blocks.size()):
        map_blocks[n] = block_options[randi() % block_options.size()]
    
    # this checks if the blocks form a valid map
    # if not it generates another map
    var iterations = 1
    while !validate_blocks() && iterations < 64:
        for n in range(map_blocks.size()):
            map_blocks[n] = block_options[randi() % block_options.size()]
        iterations += 1
    # if it does 64 runs without a valid map, it uses a fallback
    if iterations >= 64:
        map_blocks = fallback_blocks
    
    # builds the map block by block
    for block_number in range(map_blocks.size()):
        set_block(block_number, map_blocks[block_number])
    
    set_outer_wall()

func validate_blocks():
    var player_starts = 0
    var mob_starts = 0
    for block in map_blocks:
        if block[8]:
            player_starts += 1
        mob_starts += block[9].size()
    
    var mob_start_minimum = 6
    
    return player_starts > 0 && mob_starts > mob_start_minimum

# block_number is an integer from 0 to 5 defining the position on the 3x2 grid of 8x8 blocks
func set_block(block_number, block_grid):
    # these increase x and y to the top left of the block in question
    var x_offset = (block_number % 3) * 8
    var y_offset = int(block_number / 3) * 8
    
    # then set the tiles in that block
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
    for n in map_blocks.size():
        if map_blocks[n][8]:
            start_block_numbers.push_back(n)
    
    return start_block_numbers[randi() % start_block_numbers.size()]
    
func get_mob_starts():
    var mob_starts = []
    for n in map_blocks.size():
        var x_offset = (n % 3) * 8
        var y_offset = int(n / 3) * 8
        for spawn in map_blocks[n][9]:
            var x = spawn[0] + x_offset
            var y = spawn[1] + y_offset
            mob_starts.push_back([x,y])
    
    return mob_starts
