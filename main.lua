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

        local roll = love.math.random(4)
        if roll == 1 then
            newEmptyY = emptyY - 1
        elseif roll == 2 then
            newEmptyY = emptyY + 1
        elseif roll == 3 then
            newEmptyX = emptyX - 1
        elseif roll == 4 then
            newEmptyX = emptyX + 1
        end

        if grid[newEmptyY] and grid[newEmptyY][newEmptyX] then
            grid[newEmptyY][newEmptyX], grid[emptyY][emptyX] = 
            grid[emptyY][emptyX], grid[newEmptyY][newEmptyX]
        end
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

    if key == 'down' then
        newEmptyY = emptyY - 1
    elseif key == 'up' then
        newEmptyY = emptyY + 1
    elseif key == 'right' then
        newEmptyX = emptyX - 1
    elseif key == 'left' then
        newEmptyX = emptyX + 1
    end

    if grid[newEmptyY] and grid[newEmptyY][newEmptyX] then
        grid[newEmptyY][newEmptyX], grid[emptyY][emptyX] = 
        grid[emptyY][emptyX], grid[newEmptyY][newEmptyX]
    end
end