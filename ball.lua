Ball = {}

function Ball:load()
   self.width = 15
   self.height = 15
   self.speed = 200
   self.xVel = -self.speed
   self.yVel = 0
   self.x = love.graphics.getWidth() / 2
   self.y = love.graphics.getHeight() / 2 - self.height/2
end


function Ball:update(dt)
   self:move(dt)
   self:collide()
end


function Ball:collide()

   if checkCollision(self, Player) then
      if self.speed <= 500 then
        self.speed = self.speed + 5
      end
      self.xVel = self.speed
      local middleBall = self.y + self.height / 2
      local middlePlayer = Player.y + Player.height / 2
      self.yVel = (middleBall - middlePlayer)*5
   end

   if checkCollision(self, Ai) then
     if self.speed <= 500 then
       self.speed = self.speed + 5
     end
     self.xVel = -self.speed
     local middleBall = self.y + self.height/2
     local middleAi = Ai.y + Ai.height/2
     self.yVel = (middleBall-middleAi)*5
   end

   if self.y < 0 then
      self.y = 0
      self.yVel = -self.yVel
   elseif self.y + self.height > love.graphics.getHeight() then
      self.y = love.graphics.getHeight() - self.height
      self.yVel = -self.yVel
   end

end

function Ball:move(dt)
   self.x = self.x + self.xVel * dt
   self.y = self.y + self.yVel * dt
end

function Ball:draw()
   love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
