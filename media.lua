local standart_font = love.graphics.getFont()

function createFonts()    
    local FontNormal = love.graphics.newFont("font.ttf", 30)
    local FontSmall = love.graphics.newFont("font.ttf", 15)
    local FontBig = love.graphics.newFont("fontNumber.ttf", 150)
    return FontSmall,FontNormal,FontBig
end

function standartFont()
  return standart_font
end

function WinAndLoseMelody(volume)
  local win = love.audio.newSource('game-won.wav','static')
  local lose = love.audio.newSource('game-lose.wav','static')
  love.audio.setVolume(volume)
  return win,lose
  end