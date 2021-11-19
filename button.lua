local class = require("middleclass")
button = class("button")
buttons = {}
local originalFont = love.graphics.getFont()

function button:initialize(code, text, x, y, rx, ry, textColor, font, color,minest,id,cCh)

	self.code = code
	self.text = text
	self.x = x
	self.y = y
	self.rx = rx or 0
	self.ry = ry or 0
	self.textColor = textColor or {200,200,200}
	self.font = font or love.graphics.getFont()
	self.color = color or {150,150,150}
	self.originalColor = self.color
  self.mine = minest

  self.colorChange = not(cCh and true)
	self.id = id or #buttons + 1
  buttons[self.id] = self
	--table.insert(buttons, self)
	return self
end

function button:update()
	local x, y = love.mouse.getX(), love.mouse.getY()
	if x < self.x + 10 + 20-1 and x > self.x and y < self.y + 10 + 20-1 and y > self.y then 
		if love.mouse.isDown(1) then 
			self.code(self.x,self.y)
		end
		if self.colorChange then self.color = {self.color[1] + 20, self.color[2] + 20, self.color[3] + 20} end
	else
		self.color = self.originalColor
	end 
end

function button:draw()
	love.graphics.setFont(self.font)

	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", self.x, self.y, 10 + 20-1, 10 + 20-1, self.rx, self.ry)

	love.graphics.setColor(self.textColor)
	love.graphics.print(self.text, self.x + 10, self.y+5)
	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(originalFont)
end 

function updateButtons()
	for i, v in pairs(buttons) do
		v:update()
	end
end

function drawButtons()
	for i, v in pairs(buttons) do
		--if v.vtype == 'Close' then 
      v:draw() 
      --end
	end 
end