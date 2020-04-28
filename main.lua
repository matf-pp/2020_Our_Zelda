require 'kod/Deps'

function love.load()
	gStateMachine = StateMachine {
		['start'] = function() return Start() end,
		['play'] = function() return play() end,
		['game_over'] = function() return game_over() end
	} 

	gStateMachine:change('start')
	gSounds['music']:setLooping(true)
	gSounds['music']:play()
end

function love.update(dt)
	Timer.update(dt)
	gStateMachine:update(dt)
end

function love.draw()
	gStateMachine:render()
end

