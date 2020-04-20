play = Class{_include = PrimaryState}

function play:init()
end

function play:enter(params)
end

function play:exit()
end

function play:update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    if love.keyboard.isDown('return') then
        gStateMachine:change('game_over')
    end
end

function play:render()
	love.graphics.draw(gTextures['start_img'], 0, 0, 0)
end
