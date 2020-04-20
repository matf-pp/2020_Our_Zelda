
game_over = Class{_include = PrimaryState}

function game_over:enter(parasm)
end

function game_over:update(dt)
    if love.keyboard.isDown('return') then
        gStateMachine:change('start')
    end

    if love.keyboard.isDown('escape') then
        love.event.quit()
    end
end

function game_over:render()
	love.graphics.draw(gTextures['game_over_img'], 0, 0, 0)
end

function game_over:exit()
end
