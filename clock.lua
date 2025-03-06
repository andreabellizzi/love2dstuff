function love.load()
    circle_center_x = 350
    circle_center_y = 350
    circle_rad = 150
    hour_offset_lut = {
        [12]  = {-7, 0},
        [11]  = { 0, 0},
        [10]  = { 0, 0},
        [9]   = { 0, 0},
        [8]   = { 0, 0},
        [7]   = { 0, 0},
        [6]   = { 0, 0},
        [5]   = { 0, 0},
        [4]   = { 0, 0},
        [3]   = { 0, 0},
        [2]   = {-5, 0},
        [1]   = { 0, 2},
        [0]   = { 0, 0}
    }
end


function draw_hour()
    love.graphics.line(circle_center_x, circle_center_y, circle_center_x, circle_center_y-circle_rad)
    local d = circle_rad
    local xoff = circle_center_x
    local yoff = circle_center_y
    local x = circle_center_x
    local y = circle_center_y-circle_rad
    local h = 3
    local hoffx = 0
    local hoffy = 0
    for i = 1,12 do
        hoffx = hour_offset_lut[h][1]
        hoffy = hour_offset_lut[h][2]
        x = circle_rad*math.cos((i-1)*(2*math.pi)/12)
        y = circle_rad*math.sin((i-1)*(2*math.pi)/12)
        love.graphics.printf(tostring(h), hoffx+xoff+x, hoffy+yoff+y, 300)
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
