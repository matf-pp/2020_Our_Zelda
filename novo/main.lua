Class = require 'lib/class'
require 'kod/Consts'
require 'kod/Player'
require 'kod/Room'
require 'kod/Enemy'

function love.load()
    music = love.audio.newSource("muzika/music.mp3", "stream")
    music:play()
    love.graphics.setBackgroundColor(1,1,1,1)
    room = Room{}
    room:generate()
    player = Player{}
end

function love.update(dt)
    room:update(dt)
    player:update(dt)
end

function love.keypressed(key)
    print(key)
end

function love.draw()
    room:draw()
    player:draw()
end
