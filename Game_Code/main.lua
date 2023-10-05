
-- LOADER   ---------------------------------------------------------------------------------------------------------

function love.load()

  Object = require "classic"
  require "rectangle"
  
  start = false
  local screen_width, screen_height = love.graphics.getDimensions()
  love.window.setTitle("Goat_Game")
  
  love.graphics.setBackgroundColor(0, 0, 0)
  
  frogImage = love.graphics.newImage("frog.png")
  livesImage = love.graphics.newImage("greenLife.png")
  
   lock_Up_Down=false
   lock_Rigth_Left=false
  
  rectangleSize = 50
  topOfScreen = screen_height + rectangleSize
  
  start = true
  alive = true
  win = false
  
  
  frog = {
    X = 0,
    Y = screen_height  /2,
    Width = frogImage:getWidth( ),
    Height = frogImage:getHeight( ),
	SpawnX = 0,
	spawnY = screen_height  /2,
	Speed = 300.0,
	lives = 3
	}
	
	live = {
	width = livesImage:getWidth( ),
	height = livesImage:getHeight( )
	}
	
	frogColission = {
	x = frog.X,
	y = frog.Y,
	width = 40,
	height = 40,
	}
	
r1 = Rectangle(100, 0, 50, 50, 250) --x, y, width, height, speed
r7 = Rectangle(100, -250, 50, 50, 250) --x, y, width, height, speed
r2 = Rectangle(170, 0, 50, 100, 350) --x, y, width, height, speed
r3 = Rectangle(300, 0, 50, 150, 200) --x, y, width, height, speed
r4 = Rectangle(300, -250, 50, 150, 200) --x, y, width, height, speed
r5 = Rectangle(300, -500, 50, 150, 200) --x, y, width, height, speed
r6 = Rectangle(400, 0, 50, 50, 300) --x, y, width, height, speed
r8 = Rectangle(400, -300, 50, 50, 300) --x, y, width, height, speed
r9 = Rectangle(400, -300, 50, 50, 300) --x, y, width, height, speed
r10 = Rectangle(500, 0, 50, 50, 300) --x, y, width, height, speed
r11 = Rectangle(500, -200, 50, 50, 300) --x, y, width, height, speed
r12 = Rectangle(600, 0, 50, 150, 300) --x, y, width, height, speed
r13 = Rectangle(600, -400, 50, 150, 300) --x, y, width, height, speed

vicLine = Rectangle(700, 0, 80, 620, 0) --x, y, width, height, speed
end

-- UPDATE  ---------------------------------------------------------------------------------------------------------

function love.update(dt)
   
  if (alive) then
  
   if (win ~= true) then
       r1:update(dt)
	   r2:update(dt)
	   r3:update(dt)
	   r4:update(dt)
	   r5:update(dt)
	   r6:update(dt)
	   r7:update(dt)
	   r8:update(dt)
	   r9:update(dt)
	   r10:update(dt)
	   r11:update(dt)
	   r12:update(dt)
	   r13:update(dt)
		
		        if r1.y >= 620 then
		r1:ResetPos()
		end
				if r2.y >= 620 + r2.height then
		r2:ResetPos()
		end
				if r5.y >= 620 then
		r3:ResetPos()
		r4:ResetPos()
		r5:ResetPos()
		end
				if r6.y >= 620 + r6.height then
		r6:ResetPos()
		end
				if r7.y >= 620 then
		r7:ResetPos()
		end
				if r8.y >= 620 then
		r8:ResetPos()
		end
				if r9.y >= 620 then
		r9:ResetPos()
		end
				if r10.y >= 620 then
		r10:ResetPos()
		end
				if r11.y >= 620 then
		r11:ResetPos()
		end
				if r12.y >= 620 then
		r12:ResetPos()
		end
				if r13.y >= 620 then
		r13:ResetPos()
		end
		
    frogColission.x = frog.X
    frogColission.y = frog.Y
  
   if love.keyboard.isDown("a") then
        frog.X = frog.X - frog.Speed * dt
   elseif love.keyboard.isDown("d") then
        frog.X = frog.X + frog.Speed * dt
   elseif love.keyboard.isDown("w") then
        frog.Y = frog.Y - frog.Speed * dt
   elseif love.keyboard.isDown("s") then
        frog.Y = frog.Y + frog.Speed * dt
   end

    print(frog.X)
    print(frog.Y)
  
    if checkCollision(r1, frogColission) then
	frogCol(frog)
    end
	    if checkCollision(r2, frogColission) then
	frogCol(frog)
    end
	    if checkCollision(r3, frogColission) then
	frogCol(frog)
    end
	    if checkCollision(r4, frogColission) then
	frogCol(frog)
    end
	    if checkCollision(r5, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r6, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r7, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r8, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r9, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r10, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r11, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r12, frogColission) then
	frogCol(frog)
    end
		if checkCollision(r13, frogColission) then
	frogCol(frog)
    end
	
		if checkCollision(vicLine, frogColission) then
	win = true
    end
	
	if ( frog.lives == 0) then
	alive = false
	end
  
  end
  end
  
  
  if (alive ~= true) then
  if love.keyboard.isDown("r") then
  frogCol(frog)
  frog.lives = 3
  alive = true
  end
  end
  
  if (win) then
  if love.keyboard.isDown("r") then
  frogCol(frog)
  frog.lives = 3
  win = false
  end
  end  
  


end


-- DRAW  ---------------------------------------------------------------------------------------------------------
function love.draw()

     vicLine:drawFill()
	 
    if (alive ~=true) then
	love.graphics.print('You Lost!', 300, 210)
	love.graphics.print('Press R to Re-Start!', 300, 310)
	end
	
	 if (win) then
	love.graphics.print('You WON!', 300, 210)
	love.graphics.print('Press R to Re-Start!', 300, 310)
	end
	
  r1:draw()
  r2:draw()
  r3:draw()
  r4:draw()
  r5:draw()
  r6:draw()
  r7:draw()
  r8:draw()
  r9:draw()
  r10:draw()
  r11:draw()
  r12:draw()
  r13:draw()

  
  
  for i = 0, frog.lives-1, 1 do
love.graphics.draw( livesImage, live.width * i, live.height )

end

  love.graphics.draw( frogImage, frog.X, frog.Y )

end



-- FUNCTIONS ------------------------------------------------------------------------------------------------------

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end

function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    --Directly return this boolean value without using if-statement
    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end

function frogCol(frog)
    frog.X = 0 
	frog.Y = frog.spawnY 
    frog.lives = frog.lives - 1
	return frog
end