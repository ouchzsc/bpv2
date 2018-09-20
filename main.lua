function love.load()
    require "autoScript.autoRequires"
    boot.init()
end

function love.draw()
    event.onDraw:Trigger()
end

function love.keypressed(key)
    event.onKeyPressed:Trigger(key)
end

function love.update(dt)
    event.onUpdate:Trigger(dt)
    event.onLateUpdate:Trigger(dt)
end