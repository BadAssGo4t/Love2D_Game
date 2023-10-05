Rectangle = Object.extend(Object)

function Rectangle:new(x, y, width, height, speed)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed
	
	self.YHolder = y
end

function Rectangle.update(self, dt)
    self.y = self.y + self.speed * dt
end


function Rectangle.ResetPos(self)
    self.y = self.YHolder + 0
end

function Rectangle.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Rectangle.drawFill(self)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
