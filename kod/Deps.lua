Class = require 'lib/class'


require 'kod/Animation'
require 'kod/Consts'
require 'kod/Entity'
require 'kod/EntityDefs'
require 'kod/Player'
require 'kod/hitEnemy'

require 'kod/world_zelda/Door'
require 'kod/world_zelda/Dungeon'
require 'kod/world_zelda/Room'

require 'kod/states_zelda/PrimaryState'

require 'kod/states_zelda/entity/Idle_state'
require 'kod/states_zelda/entity/Walk_state'

require 'kod/states_zelda/entity/player/Player_idle'
require 'kod/states_zelda/entity/player/Player_swing'
require 'kod/states_zelda/entity/player/Player_walk'


require 'kod/StateMachine'
require 'kod/states_zelda/state_game/start'
require 'kod/states_zelda/state_game/play'
require 'kod/states_zelda/state_game/game_over'



gTextures = {
	['start_img'] = love.graphics.newImage('grafika/background.png'),
	['game_over_img'] = love.graphics.newImage('grafika/game_over_2.jpg'),
	['tiles'] = love.graphics.newImage('grafika/tilesheet.png'),
	['entites'] = love.graphics.newImage('grafika/entities.png'),
	['character-walk'] = love.graphics.newImage('grafika/character-walk.png'),
	['character-swing-sword'] = love.graphics.newImage('grafika/character-swing-sword.png')
}


gFrames = {
	['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
	['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
	['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
	['entites'] = GenerateQuads(gTextures['entities'], 16, 16)
}

gSounds = {
    ['music'] = love.audio.newSource('zvukovi/music.mp3'),
    ['sword'] = love.audio.newSource('zvukovi/sword.wav'),
    ['hit-enemy'] = love.audio.newSource('zvukovi/hit_enemy.wav'),
    ['hit-player'] = love.audio.newSource('zvukovi/hit_player.wav'),
    ['door'] = love.audio.newSource('zvukovi/door.wav')
}

