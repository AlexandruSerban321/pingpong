require("player")
require("ball")
require("ai")
require("score")

function love.load()
   Player:load()
   Ball:load()
   Ai:load()
   Score:load()
end


function love.update(dt)
   Player:update(dt)
   Ball:update(dt)
   Ai:update(dt)
   Score:update(dt)
end


function love.draw()
   Player:draw()
   Ball:draw()
   Ai:draw()
   Score:draw()
end

function checkCollision(a, b)
   if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
      return true
   else
      return false
   end
end
