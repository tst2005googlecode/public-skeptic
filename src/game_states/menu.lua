local menu = Game:addState("menu")

function menu:enteredState()
	print("entered menu state")

	local wid = love.window.getWidth()
	local hgh = love.window.getHeight()
	local button_interval = 30

	-- main frame
	self.mf = loveframes.Create("frame")
	local mf = self.mf
	mf:SetName("                                       Main Menu")
	mf:ShowCloseButton(false)
	mf:Center()

	-- new game button
	local nGB = loveframes.Create("button", mf)
	nGB:SetY(button_interval)
	nGB:CenterX()
	nGB:SetText("New Game")
	nGB.OnClick = function(object)
		--game:gotoState('wb')
	end

	-- load game button
	self.load_button = loveframes.Create("button", mf)
	local lb = self.load_button
	lb:SetY(button_interval*2)
	lb:CenterX()
	lb:SetText("Load Game")
	lb.OnClick = function(object)
		self.load_text:SetVisible(true)
	end

	-- load game text input
	self.load_text = loveframes.Create("textinput", mf)
	local lt = self.load_text
	lt:Center()
	lt:SetVisible(false)
	lt.OnEnter = function(object, text)
		if text then
			text = text .. ".sav"
			if love.filesystem.isFile(text) then
				local ok, save
				ok, save = pcall(love.filesystem.read, text)
				if not ok then
					print('Load Error: ' .. tostring(chunk))
				else
					game.world = World:new()
					game.world.data = JSON:decode(save)
					game:gotoState("ViewWorld")
				end
			end			
		else
			print("invalid name")
		end
	end

	--quit button
	local qB = loveframes.Create("button",mf)
	qB:SetY(button_interval*3)
	qB:CenterX()
	qB:SetText("Quit")
	qB.OnClick = function(object)
		love.event.quit()
	end

	

end
function menu:update(dt)
end

function menu:keypressed(key, isRepeat)
end

function menu:keyreleased(key)
end

function menu:mousepressed(x, y, button)
end

function menu:mousereleased(x, y, button)
end

function menu:draw()
end

function menu:exitedState()
	print("exited menu state")
	loveframes.util.RemoveAll()
end