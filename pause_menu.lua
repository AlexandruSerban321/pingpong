Pause_menu={}

function Pause_menu:load()
    self.font = love.graphics.newFont(30)
    self.paused = false
end

function Pause_menu:update()
end

function Pause_menu:draw()
    love.graphics.setFont(self.font)
    love.graphics.printf( "Pause Menu", love.graphics.getWidth()/2-self.font:getWidth("Pause Menu"), love.graphics.getHeight()/2-self.font:getHeight("Pause Menu"), love.graphics.getWidth()/2-self.font:getWidth("Pause Menu"), "center")
end