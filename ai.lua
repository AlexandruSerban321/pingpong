Ai = {}

function Ai:load()
  self.width =Player.width
  self.height = Player.height
  self.x = love.graphics.getWidth() - self.width - 50
  self.y = love.graphics.getHeight() / 2
  self.yVel = 0
  self.speed = 500
end

function Ai:update(dt)
  self:acquireTarget()
  self:move(dt)
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

function Ai:draw()
  love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
end
