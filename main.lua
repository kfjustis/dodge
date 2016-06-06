

function love.load()
	--start debug off
	debugGfx = false;

	--load window
	window = {
		width = love.graphics.getWidth(),
		height = love.graphics.getHeight()
	}

	--load player (at 1/4 up from bottom)
	player = {
		x = window.width / 2,
		y = window.height / 2,
		speed = 200,
		radius = 30,
		segments = 16
	}
end

function love.update(dt)
	--move player in 8 directions
	if love.keyboard.isDown("up") then
		player.y = player.y - (player.speed * dt)
	end

	if love.keyboard.isDown("down") then
		player.y = player.y + (player.speed * dt)
	end

	if love.keyboard.isDown("left") then
		player.x = player.x - (player.speed * dt)
	end

	if love.keyboard.isDown("right") then
		player.x = player.x + (player.speed * dt)
	end

	--show debug grid with F1
	if love.keyboard.isDown("f1") and debugGfx == false then
		debugGfx = true;
	else
		debugGfx = false;
	end

	--exit game with ESC
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
	--draw debug
	if (debugGfx) then
		love.graphics.setColor(255, 0, 0)
		love.graphics.line(window.width/2, 0, window.width/2, window.height)
		love.graphics.line(0, window.height/2, window.width, window.height/2)
	end

	--draw player
	love.graphics.setColor(255,255,255)
	love.graphics.circle("fill", player.x, player.y,
	                             player.radius, player.segments)
end
