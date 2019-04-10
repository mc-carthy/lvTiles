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

    if grid[emptyY - 1] then
        grid[emptyY - 1][emptyX], grid[emptyY][emptyX] = grid[emptyY][emptyX], grid[emptyY - 1][emptyX]
    end
end