local game = require("Game")


spritemapsize = 480
chartilex = 96
chartiley = 64

z = {}
File = love.filesystem.read("sprites/player/character_dimensions.txt")

for x in File:gmatch("[^\n]+") do
	z = x
	for z in x:gmatch("[^{},]+") do
		print(z)
	end
end

print(z)

function love.load()

	love.physics.setMeter(30)
	world = love.physics.newWorld( 0, 9.81*40, true)
	image = love.graphics.newImage("sprites/player/character_sprite_map.png")
	characters = love.graphics.newSpriteBatch(image)


	--[[
	player_limbs = loadchar(0)
	
	playerbody = love.graphics.newImage("sprites/player/body2.png")
	playerhead = love.graphics.newImage("sprites/player/head.png")
	playerrarm = love.graphics.newImage("sprites/player/right-arm.png")
	playerlarm = love.graphics.newImage("sprites/player/left-arm.png")
	playerrleg = love.graphics.newImage("sprites/player/right-leg.png")
	playerlleg = love.graphics.newImage("sprites/player/left-leg.png")
	]]--
	playerx = 50
	playery = 100
end

function love.draw()
	love.graphics.print(z,0,0)

end


function love.update(dt)
	if love.keyboard.isDown("down") then   -- reduce the value
      playery = playery + 5
   end
   if love.keyboard.isDown("up") then   -- increase the value
      playery = playery-5
   end
   	if love.keyboard.isDown("right") then   -- reduce the value
      playerx = playerx + 5
   end
   if love.keyboard.isDown("left") then   -- increase the value
      playerx = playerx-5
   end
end

function loadchar(pos)
	size = 32
	offsetx = pos*chartilex % spritemapsize
	if pos ~= 0 then
		offsety = math.floor(pos*chartilex/spritemapsize) * chartiley
	else
		offsety = 0
	end
	limbs = love.graphics.newSpriteBatch(love.graphics.newQuad(offsetx, offsetx, size, size, image:getDimensions()))

	return limbs
end