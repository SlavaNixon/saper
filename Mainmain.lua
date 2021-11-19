menuengine = require('menuengine')

hM,wM = 600,600

local function prs()
  print('start')
end
local function prse()
  print('settings')
end
local function prq()
  print('quit')
  end

function love.draw()
  --love.graphics.rectangle('fill',wM-550,hM/9,500,100)
  --love.graphics.rectangle('fill',wM-550,3*hM/9,500,100)
  --love.graphics.rectangle('fill',wM-550,5*hM/9,500,100)
  --love.graphics.rectangle('fill',wM-550,7*hM/9,500,100)
  menu:draw()
end

function love.load()
  love.window.setMode(600,600)
  buttons={}
  menu = menuengine.new(200,100)
  menu:addEntry("Start Game", prs)
    menu:addEntry("Options", prse)
    menu:addSep()
    menu:addEntry("Quit Game", prq)
end

function love.mousepressed(x,y,button,istouch)
end

function love.update()
  menu:update()
end

function love.keypressed(key, scancode, isrepeat)
    menuengine.keypressed(scancode)
end

function love.mousemoved(x, y, dx, dy, istouch)
    menuengine.mousemoved(x, y)
end

--[[
local menuengine = require "menuengine"

local text = "Nothing was selected."

-- Mainmenu
local mainmenu

-- Start Game
local function start_game()
    text = "Start Game was selected!"
end

-- Options
local function options()
    text = "Options was selected!"
end

-- Quit Game
local function quit_game()
    text = "Quit Game was selected!"
end

 -- ----------

function love.load()
    love.window.setMode(600,400)
    love.graphics.setFont(love.graphics.newFont(20))

    mainmenu = menuengine.new(200,100)
    mainmenu:addEntry("Start Game", start_game)
    mainmenu:addEntry("Options", options)
    mainmenu:addSep()
    mainmenu:addEntry("Quit Game", quit_game)
end

function love.update(dt)
    mainmenu:update()
end

function love.draw()
    love.graphics.clear()
    love.graphics.print(text)
    mainmenu:draw()
end

function love.keypressed(key, scancode, isrepeat)
    menuengine.keypressed(scancode)

    if scancode == "escape" then
        love.event.quit()
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    menuengine.mousemoved(x, y)
end
--]]