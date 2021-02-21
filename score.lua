Score={}

function Score:load()
  self.playerScore = 0
  self.aiScore = 0
  self.font = love.graphics.newFont(40)
end

function Score:update(dt)
  self:winCondition()
  self.score = self.playerScore ..":" ..self.aiScore
end

function Score:winCondition()
  if Ball.x < 0 then
    Ball.x = love.graphics.getWidth()/2
    Ball.speed = 200
    Ball.yVel = 0
    Player.y = love.graphics.getHeight()/2
    self.aiScore = self.aiScore+1
  elseif Ball.x > love.graphics.getWidth() then
    Ball.x = love.getWidth()/2
    Ball.speed = 200
    Ball.yVel = 0
    Player.y = love.graphics.getHeight/2
    self.playerScore = self.playerScore+1
  end
end

function Score:draw()
  love.graphics.setFont(self.font)
  love.graphics.print(self.score, love.graphics.getWidth()/2)
end
