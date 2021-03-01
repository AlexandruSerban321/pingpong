Ai = {}

function Ai:load()
  self.image = love.graphics.newImage("assets/ai.png")
  self.width =Player.width
  self.height = Player.height
  self.x = love.graphics.getWidth() - self.width - 50
  self.y = Player.y
  self.yVel = 0
  self.speed = 500
end

function Ai:update(dt)
  self:acquireTarget()
  self:move(dt)
  self:checkboundries()
end

function Ai:move(dt)
   self.y = self.y + self.yVel * dt
end

function Ai:acquireTarget()
   if Ball.y + Ball.height < self.y then
      self.yVel = -self.speed
   elseif Ball.y > self.y + self.height then
      self.yVel = self.speed
   else
      self.yVel = 0
   end
end

function Ai:checkboundries()
  if self.y < 0 then
    self.y = 0
  elseif self.y+self.height>love.graphics.getHeight() then
    self.y = love.graphics.getHeight()-self.height
  end
end

function Ai:draw()
  love.graphics.draw(self.image,self.x,self.y)
end
