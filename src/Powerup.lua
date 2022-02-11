--Author: Shrijan Tiwari
--shrijangamer32@gmail.com



Powerup = Class{}

function Powerup:init(powerupgrade, x, y)
    
     self.width = 32
     self.height = 32
     self.dy = 45
     self.dx = 0   
     self.x = x   
     self.y = y

   
     if powerupgrade then
        self.type = 10
    else
        self.type = math.random(1, 4)
    end
    self.collided = false

     self.powerupgrade = powerupgrade
     self.inplay = true 

end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    return true
end


function Powerup:update(dt)

    if self.y < VIRTUAL_HEIGHT then
        self.y = self.y + self.dy * dt
    end

end


function Powerup:render()
    if self.inplay then
        love.graphics.draw(gTextures['main'], gFrames['power'][self.powerupgrade], self.x, self.y)
    end
end