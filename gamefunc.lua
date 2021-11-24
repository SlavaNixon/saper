function void()
end

function winChecker()
local flag = 0
  local count = 0
  for i,j in pairs(buttons) do
    if j.mine and j.text =='M' then count = count + 1 end
    if not j.mine and j.text =='M' then flag = 1 end
  end
  if count == jG and flag == 0 then 
    -- win actions
    if UpdateButtons then  time = os.clock()-0.550-time-(os.clock()-0.550-time)%0.01; love.audio.play(win_melody) end
    UpdateButtons = false
    love.graphics.setFont(f_b)
    love.graphics.setColor(0.2,1,0.2)
    love.graphics.print('YOU WIN!',80,210)
    love.graphics.setFont(f_n)
    love.graphics.print('YOUR TIME:'..time,80,210)
    love.graphics.setFont(f_s)
    love.graphics.print('TO RESTART GAME PRESS SPACE',80,340)
    love.graphics.setFont(standart_font)
    --
    end
end
function loseChecker()
  for m,j in pairs(buttons) do
    if j.mine and not j.colorChange then 
      if UpdateButtons then  time = os.clock()-0.550-time-(os.clock()-0.550-time)%0.01;love.audio.play(lose_melody) end
      love.graphics.setFont(f_b)
      love.graphics.setColor(0.6,0.3,0.6)
      love.graphics.print('YOU LOSE!',80,210)
      love.graphics.setFont(f_n)
      love.graphics.print('YOUR TIME:'..time,80,210)
      love.graphics.setFont(f_s)
      love.graphics.print('TO RESTART GAME PRESS SPACE',80,340)
      love.graphics.setFont(standart_font)
      UpdateButtons = false
      end
  end
  end

function clearZero(x,y)
    if ButtonPlace(x,y+30) ~= nil and buttons[ButtonPlace(x,y+30)] ~= nil and buttons[ButtonPlace(x,y+30)].colorChange then closeButton(x,y+30) end
    if ButtonPlace(x+30,y) ~= nil and buttons[ButtonPlace(x+30,y)] ~= nil and buttons[ButtonPlace(x+30,y)].colorChange then closeButton(x+30,y) end
    if ButtonPlace(x+30,y+30) ~= nil and buttons[ButtonPlace(x+30,y+30)] ~= nil and buttons[ButtonPlace(x+30,y+30)].colorChange then  closeButton(x+30,y+30) end
    ---[[
    if ButtonPlace(x-30,y-30) ~= nil and buttons[ButtonPlace(x-30,y-30)] ~= nil and buttons[ButtonPlace(x-30,y-30)].colorChange then closeButton(x-30,y-30) end
    if ButtonPlace(x,y-30) ~= nil and buttons[ButtonPlace(x,y-30)] ~= nil and buttons[ButtonPlace(x,y-30)].colorChange then closeButton(x,y-30) end
    if ButtonPlace(x-30,y) ~= nil and buttons[ButtonPlace(x-30,y)] ~= nil and buttons[ButtonPlace(x-30,y)].colorChange then closeButton(x-30,y) end
    if ButtonPlace(x-30,y+30) ~= nil and buttons[ButtonPlace(x-30,y+30)] ~= nil and buttons[ButtonPlace(x-30,y+30)].colorChange then closeButton(x-30,y+30) end
    if ButtonPlace(x+30,y-30) ~= nil and buttons[ButtonPlace(x+30,y-30)] ~= nil and buttons[ButtonPlace(x+30,y-30)].colorChange then closeButton(x+30,y-30) end
  end

function ButtonPlace(x,y)
  local ans = 1
  for i = 0, 600-30, 30 do
  for j = 0, 600-30, 30 do
    if x == i and y == j then return ans end
    ans = ans+1
  end end
  return nil
end

function MineChecker(x,y)
  if not(x>=0 and x<600 and y>=0 and y<600) then return nil end
  local count = 0
  local i = 1
  for m,j in pairs(buttons) do
  if j.mine then
  for ii=-30,30,30 do
    for jj=-30,30,30 do
    if ii~=0 or jj ~=0 then
    if j.x == x+ii and j.y == y+jj then count = count +1 end
  end
  end
end
end
end
  if not random then 
    if count == 0 then
      clearZero(x,y)
      count = ''
      end
    return tostring(count)
  else return 'B' end
  end

function closeButton(x,y)
  if not(x>=0 and x<600 and y>=0 and y<600) then return nil end
  local rem = 0
  for m,j in pairs(buttons) do
  if j.x == x and j.y == y then random= buttons[m].mine ;buttons[m] = nil ; rem = m end
end
button:new(void,MineChecker(x,y) ,x, y, 0, 0, {1,1,1}, love.graphics.newFont(20), {0,0,0},random,rem,true)
if buttons[ButtonPlace(x,y)].text == 'B' then 
  buttons[ButtonPlace(x,y)].originalColor = {0,0,0.55}
  buttons[ButtonPlace(x,y)].color = {0,0,0.55}
  end
  end

function randomMine(prc)
  local rnd = love.math.random(101) -- 1 - 101
  if rnd <= prc*100 then return true
  else return false end
  end

function createMinePool()
  jG = 0
  for x = 0, 600-30, 30 do
  for y = 0, 600-30, 30 do
  local random = randomMine(0.10)
  button:new(closeButton,'' ,x, y, 0, 0, {0,0,255}, love.graphics.newFont(20), {255,0,0},random)
  if random then jG =jG+1 end
end
end
  end