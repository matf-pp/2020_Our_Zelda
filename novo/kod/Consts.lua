print('[+] Consts module loaded')
-- tiles
-- img/tilesheet.png
-- width: 304px
-- height: 208px


-- za grafiku

TILE_WIDTH = 16
TILE_HEIGHT = 16


tileTexture = love.graphics.newImage('grafika/tilesheet.png')
bgImage = love.graphics.newImage('grafika/background.png')
--spriteBatch = love.graphics.newSpriteBatch(tileTexture, TILE_WIDTH*TILE_HEIGHT)

sheetWidth = 304 / TILE_WIDTH
sheetHeight = 208 / TILE_HEIGHT

-- ucitavmo sve u niz da bismo mogli da pristupamo kao nizu
quadCounter = 1
quads = {}
for y = 0, sheetHeight - 1 do
    for x = 0, sheetWidth - 1 do
        quads[quadCounter] = love.graphics.newQuad(x*TILE_WIDTH, y*TILE_HEIGHT, 
                                                    TILE_WIDTH, TILE_HEIGHT, 
                                                    304, 208)
        quadCounter = quadCounter + 1
    end
end 

TILE_TOP_LEFT_CORNER = 4
TILE_TOP_RIGHT_CORNER = 5
TILE_BOTTOM_LEFT_CORNER = 23
TILE_BOTTOM_RIGHT_CORNER = 24

--TILE_EMPTY = 19

TILE_FLOORS = {
    7, 8, 9, 10, 11, 12, 13,
    26, 27, 28, 29, 30, 31, 32,
    45, 46, 47, 48, 49, 50, 51,
    64, 65, 66, 67, 68, 69, 70,
    88, 89, 107, 108
}

TILE_TOP_WALLS = {58, 59, 60}
TILE_BOTTOM_WALLS = {79, 80, 81}
TILE_LEFT_WALLS = {77, 96, 115}
TILE_RIGHT_WALLS = {78, 97, 116}

-- Player  - GRAFIKA I PODACI
PLAYER_HEALTH = 1
PLAYER_START_X = 200
PLAYER_START_Y = 200

PLAYER_TILE_WIDTH = 20
PLAYER_TILE_HEIGHT = 20
playerImg = love.graphics.newImage('grafika/char_walk.png')
quadCounter = 1
player_quads = {}
for y = 0, playerImg:getHeight()/PLAYER_TILE_HEIGHT - 1 do
    for x = 0, playerImg:getWidth()/PLAYER_TILE_WIDTH - 1 do
        player_quads[quadCounter] = love.graphics.newQuad(x*PLAYER_TILE_WIDTH, y*PLAYER_TILE_HEIGHT, 
                                                    PLAYER_TILE_WIDTH, PLAYER_TILE_HEIGHT, 
                                                    playerImg:getDimensions())
        quadCounter = quadCounter + 1
    end
end

PLAYER_UP_TILE = 9
PLAYER_DOWN_TILE = 1 
PLAYER_LEFT_TILE = 13
PLAYER_RIGHT_TILE = 5

-- Enemy - GRAFIKA I PODACI
ENEMY_HEALTH = 1
ENEMY_SPEED = 1
ENEMY_WALK_TIME= 1
ENEMY_DIRECTIONS = {'up', 'down', 'left', 'right'}