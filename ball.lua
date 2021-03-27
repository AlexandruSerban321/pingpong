Ball = {}

function Ball:load()
   collisionsound = love.audio.newSource("assets/sounds/collision.wav", "static")
   collisionsound:setPitch(0.8)
   collisionsound:setVolume(0.3)
   self.image = love.graphics.newImage("assets/ball.png")
   self.width = self.image:getWidth()
   self.height = self.image:getHeight()
   self.speed = 300
   self.xVel = -self.speed
   math.randomseed(os.time())
   self.yVel = math.random(-360,360)
   self.x = love.graphics.getWidth() / 2
   self.y = love.graphics.getHeight() / 2 - self.height/2
end


function Ball:update(dt)
   self:move(dt)
   self:collide()
end


function Ball:collide()

   if checkCollision(self, Player) then
      collisionsound:play()
      if self.speed <= 1000 then
        self.speed = self.speed + 10
      end
      self.xVel = self.speed
      local middleBall = self.y + self.height / 2
      local middlePlayer = Player.y + Player.height / 2
      self.yVel = (middleBall - middlePlayer)*5
   end

   if checkCollision(self, Ai) then
     collisionsound:play()
     if self.speed <= 1000 then
       self.speed = self.speed + 10
     end
     self.xVel = -self.speed
     local middleBall = self.y + self.height/2
     local middleAi = Ai.y + Ai.height/2
     self.yVel = (middleBall-middleAi)*5
   end

   if self.y < 0 then
      collisionsound:play()
      self.y = 0
      self.yVel = -self.yVel
   elseif self.y + self.height > love.graphics.getHeight() then
      collisionsound:play()
      self.y = love.graphics.getHeight() - self.height
      self.yVel = -self.yVel
   end

end

function Ball:move(dt)
   self.x = self.x + self.xVel * dt
   self.y = self.y + self.yVel * dt
end

function Ball:draw()
   love.graphics.draw(self.image,self.x,self.y)
end
