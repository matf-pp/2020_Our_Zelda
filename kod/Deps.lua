Class = require 'lib/class'
Timer = require 'lib/timer'
Event = require 'lib/event'

require 'kod/Animation'
require 'kod/Consts'
require 'kod/Entity'
require 'kod/EntityDefs'
<<<<<<< HEAD
=======
require 'kod/Player'
require 'kod/StateMachine'
require 'kod/Util'
>>>>>>> 307df95b2e78d76abeca093bc4006cd29a98e2ce
require 'kod/hitEnemy'
require 'kod/Player'
require 'kod/StateMachine'
require 'kod/Util'

require 'kod/states_zelda/PrimaryState'

require 'kod/states_zelda/entity/Idle_state'
require 'kod/states_zelda/entity/Walk_state'

require 'kod/states_zelda/entity/player/Player_idle'
require 'kod/states_zelda/entity/player/Player_swing'
require 'kod/states_zelda/entity/player/Player_walk'

<<<<<<< HEAD
=======
require 'kod/world_zelda/Door'
require 'kod/world_zelda/Dungeon'
require 'kod/world_zelda/Room'


require 'kod/states_zelda/state_game/start'
>>>>>>> 307df95b2e78d76abeca093bc4006cd29a98e2ce
require 'kod/states_zelda/state_game/play'
require 'kod/states_zelda/state_game/game_over'
require 'kod/states_zelda/state_game/start'



gTextures = {
	['tiles'] = love.graphics.newImage('grafika/tilesheet.png'),
	['start_img'] = love.graphics.newImage('grafika/background.png'),
	['character-walk'] = love.graphics.newImage('grafika/character_walk.png'),
	['character-swing-sword'] = love.graphics.newImage('grafika/character_swing_sword.png'),
	['game_over_img'] = love.graphics.newImage('grafika/game_over_2.jpg'),
<<<<<<< HEAD
	['entities'] = love.graphics.newImage('grafika/entities.png')
	
=======
	['tiles'] = love.graphics.newImage('grafika/tilesheet.png'),
	['entities'] = love.graphics.newImage('grafika/entities.png'),
	['character_walk'] = love.graphics.newImage('grafika/character_walk.png'),
	['character_swing_sword'] = love.graphics.newImage('grafika/character_swing_sword.png')
>>>>>>> 307df95b2e78d76abeca093bc4006cd29a98e2ce
}

print('[+] Textures loaded')


gFrames = {
	['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
<<<<<<< HEAD
	['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
	['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
=======
	['character_walk'] = GenerateQuads(gTextures['character_walk'], 16, 32),
	['character_swing_sword'] = GenerateQuads(gTextures['character_swing_sword'], 32, 32),
>>>>>>> 307df95b2e78d76abeca093bc4006cd29a98e2ce
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

