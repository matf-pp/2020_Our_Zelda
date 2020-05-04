print('Start state ucitan')
Start = Class{_includes = PrimaryState}

function Start:init()

end

function Start:enter(params)

end

function Start:update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    if love.keyboard.isDown('return') then
        gStateMachine:change('play')
    end
end

function Start:render()
	love.graphics.draw(gTextures['start_img'], 0, 0, 0)
--fali deo sa tekstom, fonto, uredjivanje prozora
end

function Start:exit()
end