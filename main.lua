require("player")
require("ball")
require("ai")
require("score")
require("pause_menu")

function love.load()
   Player:load()
   Ball:load()
   Ai:load()
   Score:load()
   Pause_menu:load()
end


function love.update(dt)
  if dt > 0.1 then
    dt = 0.1
  end
  if not Pause_menu.paused then
   Player:update(dt)
   Ball:update(dt)
   Ai:update(dt)
   Score:update(dt)
   Pause_menu:update()
  end
end


function love.draw()
   Score:draw()
   Player:draw()
   Ball:draw()
   Ai:draw()
   if Pause_menu.paused then
      Pause_menu:draw()
   end 
end

function checkCollision(a, b)
   if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
      return true
   else
      return false
   end
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      Pause_menu.paused = not Pause_menu.paused
   end
end