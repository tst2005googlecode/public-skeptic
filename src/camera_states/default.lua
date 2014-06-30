local default = Camera:addState('default')

function default:enteredState()
	print("entered default camera state")
	self.x = 0
	self.y = 0
	self.scaleX = 0.5
	self.scaleY = 0.5
	self.rotation = 0
end



function default:draw()
	love.graphics.push()
	love.graphics.rotate(-self.rotation)
	love.graphics.scale(1 / self.scaleX, 1/ self.scaleY)
	love.graphics.translate(-self.x, -self.y)
end

function default:update(dt, target)
	
	self.x_zero = target.x-(love.window.getWidth()*self.scaleX)/2
	self.y_zero = target.y-(love.window.getHeight()*self.scaleY)/2
	self:setPosition(self.x_zero, self.y_zero)
end


function default:pop()
	love.graphics.pop()
end

function default:move(dx, dy)
	self.x = self.x + (dx or 0)
	self.y = self.y + (dy or 0)
end

function default:scale(sx, sy)
	local sx = sx or 1
	self.scaleX = self.scaleX * sx
	self.scaleY = self.scaleY * (sy or sx)
end

function default:rotate(r)
	local r = r or 0
	self.rotation = self.rotation + r
end

function default:setPosition(x, y)
	self.x = x or self.x
	self.y = y or self.y
end

function default:setScale(sx, sy)
	self.scaleX = sx or self.scaleX
	self.scaleY = sy or self.scaleY
end

function default:setRotation(r)
	
	self.rotation = r or self.rotation
end

function default:mousePosition()
	return love.mouse.getX() * self.scaleX + self.x, love.mouse.getY() * self.scaleY + self.y
end

function default:exitedState()
	print("exited default camera state")
end