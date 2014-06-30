class = require 'lib.middleclass'
Stateful = require'lib.stateful'
JSON = require'lib.JSON'
require 'lib.AnAL'
require 'lib.loveframes'
require 'src.game'

function love.load(arg)
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    print('Public Skeptic')
    game = Game:new()
end

function love.update(dt)
    dt = math.min(0.01666667, dt)
    game:update(dt)
    loveframes.update(dt)
end

function love.draw() 
    game:draw()
    loveframes.draw()
end

function love.keypressed(key, isRepeat)
    game:keypressed(key, isRepeat)
    loveframes.keypressed(key, isRepeat)
end

function love.keyreleased(key)
    game:keyreleased(key)
    loveframes.keyreleased(key)
end

function love.mousepressed(x, y, button)
    game:mousepressed(x, y, button)
    loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    game:mousereleased(x, y, button)
    loveframes.mousereleased(x, y, button)
end

function love.textinput(text)
    loveframes.textinput(text)
end

function love.threaderror(thread, errorstr)
    print("Thread Error!\n" .. errorstr)
end

function love.quit()
    game:quit()    
end
