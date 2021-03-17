Score={}

function Score:load()
  self.image = love.graphics.newImage("assets/universe.png")
  self.playerScore = 0
  self.aiScore = 0
  self.font = love.graphics.newFont(30)
end

function Score:update(dt)
  self:winCondition()
end

function Score:winCondition()
  if Ball.x < 0  or Ball.x > love.graphics.getWidth() then
    Ball.speed = 200
    if Ball.x  < 0 then
      Ball.xVel = Ball.speed
      self.aiScore = self.aiScore+1
    elseif Ball.x > love.graphics.getWidth() then
      Ball.xVel = -Ball.speed
      self.playerScore = self.playerScore+1
    end
    Ball.yVel = 0
    Ball.x = love.graphics.getWidth()/2 - Ball.width/2
    Ball.y = love.graphics.getHeight()/2 - Ball.height/2
    Player.y = love.graphics.getHeight()/2 - Player.height/2
    Ai.y = Player.y
  end
end

function Score:draw()
  love.graphics.draw(self.image,0,0)
  love.graphics.setFont(self.font)
  love.graphics.print(self.playerScore..':'..self.aiScore,love.graphics.getWidth()/2-self.font:getWidth(self.playerScore..':'..self.aiScore))
end
