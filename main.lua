function love.load()
    love.graphics.setNewFont(30)

    gridXCount = 4
    gridYCount = 4

    grid = {}
    for y = 1, gridYCount do
        grid[y] = {}
        for x = 1, gridXCount do
            grid[y][x] = x + ((y - 1) * gridXCount)
        end
    end


    for moveNumber = 1, 1000 do
        local roll = love.math.random(4)
        if roll == 1 then
            move('down')
        elseif roll == 2 then
            move('up')
        elseif roll == 3 then
            move('right')
        elseif roll == 4 then
            move('left')
        end
    end

    for moveNumber = 1, gridXCount - 1 do
        move('left')
    end

    for moveNumber = 1, gridYCount - 1 do
        move('up')
    end
end

function move(direction)
    local emptyX
    local emptyY

    for y = 1, gridYCount do
        for x = 1, gridXCount do
            if grid[y][x] == gridXCount * gridYCount then
                emptyX = x
                emptyY = y
            end
        end
    end

    local newEmptyY = emptyY
    local newEmptyX = emptyX

    if direction == 'down' then
        newEmptyY = emptyY -  1
    elseif direction == 'up' then
        newEmptyY = emptyY +  1
    elseif direction == 'right' then
        newEmptyX = emptyX -  1
    elseif direction == 'left' then
        newEmptyX = emptyX +  1
    end

    if grid[newEmptyY] and grid[newEmptyY][newEmptyX] then
        grid[newEmptyY][newEmptyX], grid[emptyY][emptyX] = 
        grid[emptyY][emptyX], grid[newEmptyY][newEmptyX]
    end
end

function love.update(dt)

end

function love.draw()
    for y = 1, gridYCount do
        for x = 1, gridXCount do
            if grid[y][x] ~= gridXCount * gridYCount then
                local pieceSize = 100
                local pieceDrawSize = pieceSize - 1
                love.graphics.setColor(.4, .1, .6)
                love.graphics.rectangle(
                    'fill',
                    (x - 1) * pieceSize,
                    (y - 1) * pieceSize,
                    pieceDrawSize,
                    pieceDrawSize
                )
                love.graphics.setColor(1, 1, 1)
                love.graphics.print(
                    grid[y][x],
                    (x - 1) * pieceSize,
                    (y - 1) * pieceSize
                )
            end
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if key == 'down' then
        move('down')
    elseif key == 'up' then
        move('up')
    elseif key == 'right' then
        move('right')
    elseif key == 'left' then
        move('left')
    end
end