function love.load()
	circle_center_x = 350
	circle_center_y = 350
	circle_rad = 150
end


function draw_hour()
	love.graphics.line(circle_center_x, circle_center_y, circle_center_x, circle_center_y-circle_rad)
	local d = circle_rad
	local xoff = circle_center_x-7
	local yoff = circle_center_y
	local x = circle_center_x-7
	local y = circle_center_y-circle_rad
	local h = 3
	for i = 1,12 do		
		x = circle_rad*math.cos((i-1)*(2*math.pi)/12)
		y = circle_rad*math.sin((i-1)*(2*math.pi)/12)
		love.graphics.printf(tostring(h), xoff+x, yoff+y, 300)
		h = (h+1)%12
		if h == 0 then h = 12 end
	end
end

function love.draw()
	love.graphics.printf(
		string.format("FPS: %f\nOS: %s Ver: %d.%d.%d\nScreen: %d x %d",
			love.timer.getFPS(),
			love.system.getOS(), love._version_major, love._version_minor, love._version_revision,
			love.graphics.getWidth(), love.graphics.getHeight()
		), love.graphics.getWidth() - 305, 3, 300, 'right')

	love.graphics.circle('line', circle_center_x , circle_center_y , circle_rad , 50)
	draw_hour()

end
