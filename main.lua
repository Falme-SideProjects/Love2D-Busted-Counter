counter = require('counter')

function love.load()
end

function love.Update(dt)
    --Counter:update(dt)
end

function love.draw()
    Counter:draw()
end

function love.mousepressed(x, y, button, istouch)
    Counter:mousepressed(x, y, button, istouch)
end