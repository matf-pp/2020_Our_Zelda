Class = require 'lib/class'


require 'kod/Animation'
require 'kod/Consts'
require 'kod/Entity'
require 'kod/EntityDefs'
require 'kod/Player'
require 'kod/StateMachine'
require 'kod/Util'
require 'kod/hitEnemy'

require 'kod/states_zelda/PrimaryState'

require 'kod/states_zelda/entity/Idle_state'
require 'kod/states_zelda/entity/Walk_state'

require 'kod/states_zelda/entity/player/Player_idle'
require 'kod/states_zelda/entity/player/Player_swing'
require 'kod/states_zelda/entity/player/Player_walk'

require 'kod/world_zelda/Door'
require 'kod/world_zelda/Dungeon'
require 'kod/world_zelda/Room'


require 'kod/states_zelda/state_game/start'
require 'kod/states_zelda/state_game/play'
require 'kod/states_zelda/state_game/game_over'



gTextures = {
	['start_img'] = love.graphics.newImage('grafika/background.png'),
	['game_over_img'] = love.graphics.newImage('grafika/game_over_2.jpg'),
	['tiles'] = love.graphics.newImage('grafika/tilesheet.png'),
	['entities'] = love.graphics.newImage('grafika/entities.png'),
	['character_walk'] = love.graphics.newImage('grafika/character_walk.png'),
	['character_swing_sword'] = love.graphics.newImage('grafika/character_swing_sword.png')
}

print('[+] Textures loaded')


gFrames = {
	['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
	['character_walk'] = GenerateQuads(gTextures['character_walk'], 16, 32),
	['character_swing_sword'] = GenerateQuads(gTextures['character_swing_sword'], 32, 32),
	['entities'] = GenerateQuads(gTextures['entities'], 16, 16)
}

print('[+] Frames loaded')

gSounds = {
    ['music'] = love.audio.newSource('zvuk/music.mp3', 'stream'),
    ['sword'] = love.audio.newSource('zvuk/sword.wav', 'static'),
    ['hit-enemy'] = love.audio.newSource('zvuk/hit_enemy.wav', 'static'),
    ['hit-player'] = love.audio.newSource('zvuk/hit_player.wav', 'static'),
    ['door'] = love.audio.newSource('zvuk/door.wav', 'static')
}

