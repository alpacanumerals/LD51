extends Node

#This is now a magical block that should never be used and is purely for fallback. It allows
#both player and mob spawns which should be a no go normally.
const block_0 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               true,
               [[2,2], [6,2], [2,6], [6,6]]]

#the rows 0-7 describe the grid in tile terms
#row 8 describes player spawn validity
#row 9 gives mob spawn locations. the location is the top left of the tile
#when defining mob spawns remember to be careful of the autowall and not put them at the perimeter

###START BLOCKS###
###START BLOCKS###
###START BLOCKS###
const block_1 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               true,
               []]

const block_2 = [[0, 0, 0, 0, 0, 0, 0, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 8, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 2, 2, 0, 0, 2, 2, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               true,
               []]

const block_3 = [[6, 2, 2, 0, 0, 2, 2, 7],
               [0, 6, 2, 0, 0, 2, 7, 0],
               [0, 0, 0, 0, 0, 0, 0, 8],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 4, 2, 0, 0, 2, 5, 0],
               [4, 2, 2, 0, 0, 2, 2, 5],
               true,
               []]

const block_4 = [[5, 0, 0, 0, 0, 0, 0, 4],
               [2, 5, 0, 0, 0, 0, 4, 2],
               [2, 2, 0, 0, 0, 0, 2, 2],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [2, 2, 0, 0, 0, 0, 2, 2],
               [2, 7, 8, 0, 0, 0, 6, 2],
               [7, 0, 0, 0, 0, 0, 0, 6],
               true,
               []]

const block_5 = [[2, 2, 0, 0, 0, 0, 2, 2],
               [2, 2, 0, 0, 0, 0, 2, 2],
               [0, 0, 0, 0, 0, 0, 0, 8],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [2, 2, 0, 0, 0, 0, 2, 2],
               [2, 2, 0, 0, 8, 0, 2, 2],
               true,
               []]
            
const block_6 = [[2, 2, 2, 0, 0, 2, 2, 2],
               [2, 2, 2, 0, 0, 2, 2, 2],
               [2, 2, 7, 0, 0, 6, 2, 2],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [2, 2, 5, 0, 0, 4, 2, 2],
               [2, 2, 2, 0, 0, 2, 2, 2],
               [2, 2, 2, 0, 0, 2, 2, 2],
               true,
               []]
            
const block_7 = [[2, 0, 2, 0, 0, 2, 0, 2],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [2, 0, 2, 0, 0, 2, 0, 2],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 8],
               [2, 0, 2, 0, 0, 2, 0, 2],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [2, 0, 2, 0, 0, 2, 0, 2],
               true,
               []]
            
const block_8 = [[0, 0, 2, 0, 0, 2, 0, 0],
               [0, 0, 2, 8, 0, 2, 0, 0],
               [2, 2, 7, 0, 0, 6, 2, 2],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [2, 2, 5, 0, 0, 4, 2, 2],
               [0, 0, 2, 0, 0, 2, 0, 0],
               [0, 0, 2, 8, 0, 2, 0, 0],
               true,
               []]

const block_9 = [[2, 5, 0, 0, 0, 0, 4, 2],
               [6, 2, 5, 8, 8, 4, 2, 7],
               [0, 6, 2, 0, 0, 2, 7, 8],
               [0, 0, 0, 0, 0, 0, 0, 0],
               [0, 8, 0, 0, 0, 0, 0, 0],
               [0, 4, 2, 0, 0, 2, 5, 8],
               [4, 2, 7, 0, 0, 6, 2, 5],
               [2, 7, 8, 0, 0, 0, 6, 2],
               true,
               []]

#Start blocks (and normal blocks) obey a principle where the middle two blocks 
#of each side are always open. Start blocks additionally have no spawns.
const blocks_start = [block_1, block_2, block_3, block_4, block_5, block_6, block_7, block_8, block_9]

###DEAD BLOCKS###
###DEAD BLOCKS###
###DEAD BLOCKS###
const block_a =[[2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                [2, 2, 2, 2, 2, 2, 2, 2],
                false,
                []]
                
const block_b =[[0, 0, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]
                
const block_c =[[2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]

const block_d =[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]
                
const block_e =[[0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]
                
const block_f =[[0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]
                
const block_g =[[0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]
                
const block_h =[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,2],[4,2],[6,2],[2,6],[4,6],[6,6]]]
                
const block_i =[[0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                false,
                [[2,2],[2,4],[2,6],[6,2],[6,4],[6,6]]]
                
const block_j =[[2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                false,
                [[3,2],[5,2],[3,6],[5,6]]]
                
const block_k =[[2, 2, 0, 2, 2, 0, 2, 2],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 2, 2, 0, 2, 2],
                [2, 2, 0, 2, 2, 0, 2, 2],
                false,
                [[2,3],[2,5],[6,3],[6,5]]]
                
const block_b2 =[[0, 0, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 0, 0],
                true,
                []]
                
const block_c2 =[[2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 2, 2],
                true,
                []]

const block_d2 =[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                true,
                []]
                
const block_e2 =[[0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                true,
                []]
                
const block_f2 =[[0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 2, 2, 2, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                [2, 2, 2, 2, 2, 2, 0, 0],
                true,
                []]
                
const block_g2 =[[0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                true,
                []]

const block_l =[[0, 0, 0, 0, 0, 0, 0, 0],
                [5, 0, 0, 0, 0, 0, 0, 4],
                [2, 5, 0, 0, 0, 0, 4, 2],
                [2, 2, 5, 0, 0, 4, 2, 2],
                [2, 2, 7, 0, 0, 6, 2, 2],
                [2, 7, 0, 0, 0, 0, 6, 2],
                [7, 0, 0, 0, 0, 0, 0, 6],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[4,2],[4,4,],[4,6]]]
                
const block_m =[[0, 6, 2, 2, 2, 2, 7, 0],
                [0, 0, 6, 2, 2, 7, 0, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 0, 4, 2, 2, 5, 0, 0],
                [0, 4, 2, 2, 2, 2, 5, 0],
                false,
                [[2,4],[4,4],[6,4]]]
#Dead blocks can potentially spawn but disobey accessibility rules. Only one should
#appear per map. Still requires some thought (no blocks that wall off a corner etc.)
const blocks_dead =[block_a, block_b, block_c, block_d, block_e, block_f, 
                    block_g, block_h, block_i, block_j, block_k, block_b2, 
                    block_c2, block_d2, block_e2, block_f2, block_g2,
                    block_l, block_m]

###NORMAL BLOCKS###
###NORMAL BLOCKS###
###NORMAL BLOCKS###
const block_10=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 2, 1, 1, 2, 0, 0],
                [0, 0, 2, 1, 1, 2, 0, 0],
                [0, 0, 2, 2, 2, 2, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                []]

const block_11=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,2],[2,4],[2,6],[4,2],[4,4],[4,6],[6,2],[6,4],[6,6]]]

const block_12=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]

const block_13=[[6, 2, 2, 0, 0, 2, 2, 7],
                [0, 6, 2, 0, 0, 2, 7, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 4, 2, 0, 0, 2, 5, 0],
                [4, 2, 2, 0, 0, 2, 2, 5],
                false,
                [[2,3],[2,5],[6,3],[6,5],[4,3],[4,5]]]

const block_14=[[5, 0, 0, 0, 0, 0, 0, 4],
                [2, 5, 0, 0, 0, 0, 4, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 7, 0, 0, 0, 0, 6, 2],
                [7, 0, 0, 0, 0, 0, 0, 6],
                false,
                [[3,2],[3,4],[3,6],[5,2],[5,4],[5,6]]]

const block_15=[[2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [2, 2, 0, 0, 0, 0, 2, 2],
                false,
                [[3,2],[3,4],[3,6],[5,2],[5,4],[5,6]]]
            
const block_16=[[2, 2, 2, 0, 0, 2, 2, 2],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [2, 2, 7, 0, 0, 6, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 5, 0, 0, 4, 2, 2],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [2, 2, 2, 0, 0, 2, 2, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
            
const block_17=[[2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
            
const block_18=[[0, 0, 2, 0, 0, 2, 0, 0],
                [0, 0, 2, 0, 0, 2, 0, 0],
                [2, 2, 7, 0, 0, 6, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 5, 0, 0, 4, 2, 2],
                [0, 0, 2, 0, 0, 2, 0, 0],
                [0, 0, 2, 0, 0, 2, 0, 0],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]

const block_19=[[2, 5, 0, 0, 0, 4, 0, 2],
                [6, 2, 5, 0, 0, 4, 2, 7],
                [0, 6, 2, 0, 0, 2, 7, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 4, 2, 0, 0, 2, 5, 0],
                [4, 2, 7, 0, 0, 6, 2, 5],
                [2, 7, 0, 0, 0, 0, 6, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
                
const block_20=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,2],[2,4],[2,6],[4,2],[4,6],[6,2],[6,4],[6,6]]]
                
const block_21=[[2, 2, 2, 0, 0, 2, 2, 2],
                [2, 0, 0, 0, 0, 0, 0, 2],
                [2, 0, 0, 0, 0, 0, 0, 2],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [2, 0, 0, 0, 0, 0, 0, 2],
                [2, 0, 0, 0, 0, 0, 0, 2],
                [2, 2, 2, 0, 0, 2, 2, 2],
                false,
                [[2,2],[2,4],[2,6],[4,2],[4,6],[6,2],[6,4],[6,6]]]

const block_22=[[2, 7, 0, 0, 0, 0, 6, 2],
                [7, 0, 0, 0, 0, 0, 0, 6],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 0, 4, 2, 2, 5, 0, 0],
                [0, 0, 6, 2, 2, 7, 0, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [5, 0, 0, 0, 0, 0, 0, 4],
                [2, 5, 0, 0, 0, 0, 4, 2],
                false,
                [[2,2],[2,6],[6,2],[6,6]]]

const block_23=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 0, 2, 2, 0, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 0, 0, 0, 0, 2, 0],
                [0, 2, 0, 0, 0, 0, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 0, 2, 2, 0, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[3,3],[3,5],[5,3],[5,5]]]

const block_24=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 4, 2, 2, 2, 2, 5, 0],
                [0, 6, 2, 2, 2, 2, 7, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,2],[2,6],[6,2],[6,6]]]

const block_25=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 4, 2, 2, 5, 0, 0],
                [0, 0, 6, 2, 2, 7, 0, 0],
                [0, 0, 0, 2, 2, 0, 0, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,2],[2,6],[6,2],[6,6]]]
            
const block_26=[[4, 2, 5, 0, 0, 4, 2, 5],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [6, 2, 7, 0, 0, 6, 2, 7],
                [0, 0, 0, 4, 5, 0, 0, 0],
                [0, 0, 0, 6, 7, 0, 0, 0],
                [4, 2, 5, 0, 0, 4, 2, 5],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [6, 2, 7, 0, 0, 6, 2, 7],
                false,
                [[2,4],[4,2],[4,6],[6,4]]]
            
const block_27=[[2, 2, 2, 0, 0, 2, 0, 2],
                [2, 1, 2, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
            
const block_28=[[2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 2, 1, 2],
                [2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]

const block_29=[[2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                [2, 1, 2, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
                
const block_30=[[2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 2, 1, 2],
                [2, 0, 2, 0, 0, 2, 2, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
                
const block_31=[[0, 0, 2, 0, 0, 2, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 2, 0, 0, 2, 0, 0],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]

const block_32=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 4, 2, 2, 5, 0, 0],
                [0, 0, 6, 2, 2, 7, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 4, 2, 2, 5, 0, 0],
                [0, 0, 6, 2, 2, 7, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[2,4],[4,4],[6,4]]]

const block_33=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 4, 5, 0, 0, 4, 5, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 2, 2, 0, 0, 2, 2, 0],
                [0, 6, 7, 0, 0, 6, 7, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                [[4,2],[4,4],[4,6]]]

const block_34=[[2, 0, 2, 0, 0, 2, 0, 2],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [2, 0, 2, 0, 0, 2, 0, 2],
                false,
                [[2,3],[2,5],[6,3],[6,5],[4,3],[4,5]]]

const block_35=[[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 2, 2, 2, 2, 2, 2, 0],
                [0, 2, 1, 1, 1, 1, 2, 0],
                [0, 2, 1, 2, 2, 1, 2, 0],
                [0, 2, 1, 2, 2, 1, 2, 0],
                [0, 2, 1, 1, 1, 1, 2, 0],
                [0, 2, 2, 2, 2, 2, 2, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                false,
                []]
            
const block_36=[[2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 0, 0, 0, 0, 2, 2],
                false,
                [[3,2],[3,4],[3,6],[5,2],[5,4],[5,6]]]
            
const block_37=[[2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 2, 1, 2],
                [2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 2, 1, 2],
                [2, 0, 2, 0, 0, 2, 2, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
            
const block_38=[[2, 2, 2, 0, 0, 2, 0, 2],
                [2, 1, 2, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                [2, 1, 2, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]

const block_39=[[2, 2, 2, 0, 0, 2, 2, 2],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [2, 2, 2, 0, 0, 2, 2, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
                
const block_40=[[2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 0, 2, 0, 0, 2, 0, 2],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0],
                [2, 2, 2, 0, 0, 2, 2, 2],
                [2, 1, 2, 0, 0, 2, 1, 2],
                [2, 2, 2, 0, 0, 2, 2, 2],
                false,
                [[2,4],[4,2],[4,4],[4,6],[6,4]]]
                      
#Normal blocks have the center two tiles on each side open, do not spawn players
#even if they can accomodate a magic circle and, usually but don't always spawn mobs.

###SPAWN CHEAT SHEET###
#3x3 [2,2],[2,4],[2,6],[4,2],[4,4],[4,6],[6,2],[6,4],[6,6]
#donut [2,2],[2,4],[2,6],[4,2],[4,6],[6,2],[6,4],[6,6]
#+ [2,4],[4,2],[4,4],[4,6],[6,4]
#diamond [2,4],[4,2],[4,6],[6,4]
#corners [2,2],[2,6],[6,2],[6,6]
#center square [3,3],[3,5],[5,3],[5,5]
#vertical rect [3,2],[3,4],[3,6],[5,2],[5,4],[5,6]
#horizontal rect [2,3],[2,5],[6,3],[6,5],[4,3],[4,5]
#vertical line [4,2],[4,4],[4,6]
#horizontal line [2,4],[4,4],[6,4]

const blocks = [block_10, block_11, block_12, block_13, block_14, block_15, block_16, block_17, block_18, block_19, block_20,
                block_21, block_22, block_23, block_24, block_25, block_26, block_27, block_28, block_29, block_30,
                block_31, block_32, block_33, block_34, block_35, block_36, block_37, block_38, block_39, block_40]
