function love.load()
    love.graphics.setNewFont(30)
end

function love.update(dt)

end

function love.draw()
    for y = 1, 4 do
        for x = 1, 4 do
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
                x + ((y - 1) * 4),
                (x - 1) * pieceSize,
                (y - 1) * pieceSize
            )
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end