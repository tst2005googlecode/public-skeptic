Game = class('Game'):include(Stateful)

function Game:initialize()
    self.debug = true
    self:gotoState("menu")
end

function Game:update(dt)

end

function Game:draw()

end

function Game:keypressed(key, isRepeat)

end

function Game:keyreleased(key)

end

function Game:mousepressed(x, y, button)

end

function Game:mousereleased(x, y, button)

end

function Game:quit()

end

require'src.game_states.menu'