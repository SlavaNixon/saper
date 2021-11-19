require("button")
utf8 = require("utf8")
function void()
end

function MineChecker1(x,y)
  local count = 0
  local i = 1
  --local places ={}
  for m,j in pairs(buttons) do
  if j.mine then
  for ii=-30,30,30 do
    for jj=-30,30,30 do
   --[[
    places[i] = {}
    places[i].x=x+ii
    places[i].y=y+jj
    places[i].mines = MineChecker1(x+ii,y+jj) flag =0 end
    print(places[i].mines)
    i = i+1  --]]
    if j.x == x+ii and j.y == y+jj then count = count +1 end
  end
end
end
end
for m,j in pairs(buttons) do
  if j.x == x and j.y == y then random = buttons[m].mine end
end

  if not random then 
    if count == 0 then
      --count = ''
      --[[
      for i=1,8 do
        if places[i] then if places[i].mines == '' then closeButton(places[i].x,places[i].y) break end end
        end--]]
      end
    return tostring(count)
  else return 'B' end
  end

function MineChecker(x,y)
  local count = 0
  local i = 1
  local places ={}
  for m,j in pairs(buttons) do
  if j.mine then
  for ii=-30,30,30 do
    for jj=-30,30,30 do
   ---[[
   if ii~=0 or jj ~=0 then
    places[i] = {}
    places[i].x=x+ii
    places[i].y=y+jj
    places[i].mines = MineChecker1(x+ii,y+jj) flag =0
    i = i+1  --]]
    if j.x == x+ii and j.y == y+jj then count = count +1 end
  end
  end
end
end
end
i = 1
for a,b in pairs(places) do print(b.x/30,b.y/30,b.mines) end
  if not random then 
    if count == 0 then
      count = ''
      --[[
      for i=1,8 do
        if places[i] then if places[i].mines == '' then closeButton(places[i].x,places[i].y) break end end
        end--]]
      end
    return tostring(count)
  else return 'B' end
  end

function closeButton(x,y)
  local rem = 0
  for m,j in pairs(buttons) do
  if j.x == x and j.y == y then random = buttons[m].mine ;buttons[m] = nil ; rem = m end
end
button:new(void,MineChecker(x,y) ,x, y, 0, 0, {1,1,1}, love.graphics.newFont(20), {0,0,0},random,rem,true)
  end

function randomMine()
  local rnd = love.math.random(101) -- 1 - 101
  if rnd <= 10 then return true
  else return false end
  end

function love.update(dt)
	updateButtons()
end
function love.draw()
	drawButtons()
end
function love.load()
  love.window.setMode(600,600)
  for x = 0, 600-30, 30 do
  for y = 0, 600-30, 30 do
  button:new(closeButton,'' ,x, y, 0, 0, {0,0,255}, love.graphics.newFont(20), {255,0,0},randomMine())
end
end
end