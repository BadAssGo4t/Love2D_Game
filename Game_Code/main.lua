function love.load()
   
  love.window.setTitle("Goat_Game")
  
  love.graphics.setBackgroundColor(0, 0, 0)
  frogImage = love.graphics.newImage("frog.png")
  
   lock_Up_Down=false
   lock_Rigth_Left=false
  
  frog = {
    posX = 0,
    posY = 0
	}

  
  recX = 200
  recY = 0


  speed = 150.0

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end

function love.update(dt)
   
  
       if recY < 620 then
	    recY = recY + 300 * dt
		end
		if recY >= 620 then 
		recY = 0
        end
  
  
 if love.keyboard.isDown("a") then
        frog.posX = frog.posX - speed * dt
elseif love.keyboard.isDown("d") then
        frog.posX = frog.posX + speed * dt
elseif love.keyboard.isDown("w") then
        frog.posY = frog.posY - speed * dt
elseif love.keyboard.isDown("s") then
        frog.posY = frog.posY + speed * dt
end

  print(frog.posX)
  print(frog.posY)
  
end


function love.draw()
  
  love.graphics.rectangle("line", recX, recY, 50, 50)
  
  love.graphics.draw( frogImage, frog.posX, frog.posY )

end