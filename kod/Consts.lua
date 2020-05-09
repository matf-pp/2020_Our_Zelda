print('[+] Consts module loaded')
-- tiles
-- img/tilesheet.png
-- width: 304px
-- height: 208px


-- ikonica
icon = love.graphics.newImage('grafika/icon.png')

-- za grafiku

TILE_WIDTH = 16
TILE_HEIGHT = 16


tileTexture = love.graphics.newImage('grafika/tilesheet.png')
bgImage = love.graphics.newImage('grafika/background.png')
bgImageGameOver = love.graphics.newImage('grafika/backgroundGameOver.png')
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

-- Game podaci
LEVEL_DIFFICULTY = 50
DIFFICULTY_FACTOR = 3
DEAD_ENEMIES = 0

-- Player  - GRAFIKA I PODACI
PLAYER_HEALTH = 1 
PLAYER_START_X = 200
PLAYER_START_Y = 200
ATTACK_COOLDOWN = 0.2 -- vreme koliko traje udarac

PLAYER_TILE_WIDTH = 20
PLAYER_TILE_HEIGHT = 20
playerWalkImg = love.graphics.newImage('grafika/char_walk.png')
quadCounter = 1
player_walk_quads = {}
for y = 0, playerWalkImg:getHeight()/PLAYER_TILE_HEIGHT - 1 do
    for x = 0, playerWalkImg:getWidth()/PLAYER_TILE_WIDTH - 1 do
        player_walk_quads[quadCounter] = love.graphics.newQuad(x*PLAYER_TILE_WIDTH, y*PLAYER_TILE_HEIGHT, 
                                                    PLAYER_TILE_WIDTH, PLAYER_TILE_HEIGHT, 
                                                    playerWalkImg:getDimensions())
        quadCounter = quadCounter + 1
    end
end

playerAttackImg = love.graphics.newImage('grafika/char_attack.png')
quadCounter = 1
player_attack_quads = {}
for y = 0, playerAttackImg:getHeight()/PLAYER_TILE_HEIGHT - 1 do
    for x = 0, playerAttackImg:getWidth()/PLAYER_TILE_WIDTH - 1 do
        player_attack_quads[quadCounter] = love.graphics.newQuad(x*PLAYER_TILE_WIDTH, y*PLAYER_TILE_HEIGHT, 
                                                    PLAYER_TILE_WIDTH, PLAYER_TILE_HEIGHT, 
                                                    playerAttackImg:getDimensions())
        quadCounter = quadCounter + 1
    end
end

PLAYER_UP_TILE = 9
PLAYER_DOWN_TILE = 1 
PLAYER_LEFT_TILE = 13
PLAYER_RIGHT_TILE = 5

-- Enemy - GRAFIKA I PODACI
ENEMY_HEALTH = 1
ENEMY_SPEED = 0.45
ENEMY_WALK_TIME = 1
ENEMY_DIRECTIONS = {'up', 'down', 'left', 'right'}

ENEMY_TILE_WIDTH = 20
ENEMY_TILE_HEIGHT = 20


enemyImg = love.graphics.newImage('grafika/enemy_walk.png')
quadCounter = 1
enemy_quads = {}
for y = 0, enemyImg:getHeight()/ENEMY_TILE_HEIGHT - 1 do
    for x = 0, enemyImg:getWidth()/ENEMY_TILE_WIDTH - 1 do
        enemy_quads[quadCounter] = love.graphics.newQuad(x*ENEMY_TILE_WIDTH, y*ENEMY_TILE_HEIGHT, 
                                                    ENEMY_TILE_WIDTH, ENEMY_TILE_HEIGHT, 
                                                    enemyImg:getDimensions())
        quadCounter = quadCounter + 1
    end
end  

ENEMY_UP_TILE = 9
ENEMY_DOWN_TILE = 1 
ENEMY_LEFT_TILE = 13
ENEMY_RIGHT_TILE = 5

-- Fontovi
zeldaFont = love.graphics.newFont('fonts/zelda.otf', 48)
zeldaSmallFont = love.graphics.newFont('fonts/zelda.otf', 11)


-- Muzika
music = love.audio.newSource("zvuk/music.mp3", "stream")
enemyAttackSound = love.audio.newSource('zvuk/hit_player.wav', 'static')
playerAttackSound = love.audio.newSource('zvuk/hit_enemy.wav', 'static')
playerSwingSword = love.audio.newSource('zvuk/sword.wav', 'static')