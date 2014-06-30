local free_cam = Camera:addState('free_cam')

function free_cam:enteredState()
	print("entered free_cam camera state")
	self.x = 0
	self.y = 0
	self.scaleX = 1
	self.scaleY = 1
	self.rotation = 0
	self.moveX = 0
	self.moveY = 0
	self.velocity = 100
	self.width = love.window.getWidth()
	self.height = love.window.getHeight()
	self.x_zero = self.x
	self.y_zero = self.y
	self.x_max = self.x_zero+self.width
	self.y_max = self.y_zero+self.height

end



function free_cam:draw()
	love.graphics.push()
	love.graphics.rotate(-self.rotation)
	love.graphics.scale(1 / self.scaleX, 1/ self.scaleY)
	love.graphics.translate(-self.x, -self.y)
end

function free_cam:update(dt)
	
	self:setPosition(self.x+self.velocity*self.moveX*dt, self.y+self.velocity*self.moveY*dt)
	self.x_zero = self.x
	self.y_zero = self.y
	self.x_max = self.x_zero + self.width
	self.y_max = self.y_zero + self.height
end


function free_cam:pop()
	love.graphics.pop()
end

function free_cam:move(dx, dy)
	self.x = self.x + (dx or 0)
	self.y = self.y + (dy or 0)
end

function free_cam:scale(sx, sy)
	local sx = sx or 1
	self.scaleX = self.scaleX * sx
	self.scaleY = self.scaleY * (sy or sx)
end

function free_cam:rotate(r)
	local r = r or 0
	self.rotation = self.rotation + r
end

function free_cam:setPosition(x, y)
	self.x = x or self.x
	self.y = y or self.y
end

function free_cam:setScale(sx, sy)
	self.scaleX = sx or self.scaleX
	self.scaleY = sy or self.scaleY
end

function free_cam:setRotation(r)
	
	self.rotation = r or self.rotation
end

function free_cam:mousePosition()
	return love.mouse.getX() * self.scaleX + self.x, love.mouse.getY() * self.scaleY + self.y
end

function free_cam:exitedState()
	print("exited free_cam camera state")
end