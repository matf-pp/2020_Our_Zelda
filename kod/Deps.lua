Class = require 'lib/class'

require 'kod/StateMachine'
require 'kod/states_zelda/state_game/start'
require 'kod/states_zelda/state_game/play'
require 'kod/states_zelda/state_game/game_over'


gTextures = {
	['start_img'] = love.graphics.newImage('grafika/start.jpg'),
	['game_over_img'] = love.graphics.newImage('grafika/game_over_2.jpg')
}
