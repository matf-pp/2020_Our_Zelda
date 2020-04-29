Class = require 'lib/class'
require 'kod/Consts'
require 'kod/Player'
require 'kod/Room'
require 'kod/Enemy'
require 'kod/StateMachine'

function love.load()
    music = love.audio.newSource("muzika/music.mp3", "stream")
    music:play()
    love.graphics.setBackgroundColor(1,1,1,1)
    player = Player{}
    room = Room(player)
    room:generate()
    stateMachine = StateMachine(room, player)
end

function love.update(dt)
    --room:update(dt)
    --player:update(dt)
    stateMachine:update(dt)
end

function love.keypressed(key)
    print(key)
end

function love.draw()
    --room:draw()
    --player:draw()
    stateMachine:draw()
end
