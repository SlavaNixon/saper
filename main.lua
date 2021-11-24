require("button")
require("media")
require("gamefunc")

function love.update(dt)
  if not UpdateButtons then
    if love.keyboard.isDown('space') then buttons = {}; createMinePool(); UpdateButtons = true;time = os.clock();end
  end
end

function love.draw()
    drawButtons()
    loseChecker()
    winChecker()
end
function love.load()
  win_melody,lose_melody = WinAndLoseMelody(0.30)
  time = 0 -- time in win message
  UpdateButtons = true
  f_s,f_n,f_b = createFonts()
  standart_font = standartFont()
  jG = 0 -- mines count
  createMinePool()
end

function love.mousepressed( x, y, button, istouch )
  if UpdateButtons then updateButtons() end
  end