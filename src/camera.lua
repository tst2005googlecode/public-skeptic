Camera = class('Camera', Entity):include(Stateful)

function Camera:initialize()
	Entity.initialize(self)
	self.x = 0
	self.y = 0
	self.z = 1
	self.scaleX = 1
	self.scaleY = 1
	self.rotation = 0
	self.view_mode = "all"
	self.layers = {}	

	self:gotoState('free_cam')
end

function Camera:newLayer(scale, func, old_self, id)
	if id then
		table.insert(self.layers, id, { draw = func, scale = scale, old_self = old_self })
	else
		table.insert(self.layers, { draw = func, scale = scale, old_self = old_self })
	end
	table.sort(self.layers, function(a,b) return a.scale < b.scale end)
end

function Camera:cycle_view()
	
	if self.view_mode == "all" then
		self.view_mode = "layer"
	elseif self.view_mode == "layer" then
		self.view_mode = "all"
	end
	print("view set to: " .. self.view_mode)

end

function Camera:removeLayer(id)
	table.remove(self.layers, id)
end

function Camera:draw_layers()
	local bx, by = self.x, self.y

	for _, v in ipairs(self.layers) do
		self.x = bx * v.scale
		self.y = by * v.scale
		self:draw()
		v.draw(v.old_self)
		self:pop()
	end
end

require'src.camera_states.default'
require'src.camera_states.free_cam'