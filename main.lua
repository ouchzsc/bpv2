function love.load()
    love.graphics.setDefaultFilter('nearest')
    love.graphics.setLineStyle("rough")
    require "autoScript.autoRequires"

    system.init()
    ui = {}
    ui.panelDashBoard = PanelDashBoard:new()
    ui.panelPauseMenu = PanelPauseMenu:new()
    ui.panelStartMenu = PanelStartMenu:new()
    ui.panelStartMenu:show()
end

function love.draw()
    event.onDraw:Trigger()
    event.onDrawUi:Trigger()
end

function love.keypressed(key)
    event.onKeyPressed:Trigger(key)
end

function love.update(dt)

    if _G.pause then
        return
    end

    --  => CmdX CmdY
    timer.onUpdate(dt)

    --  => CmdX CmdY
    event.onCmdUpdate:Trigger(dt)

    --  => AxMap AyMap v 有些操作有权限在此修改速度，比如二段跳
    event.onPhysicsUpdate:Trigger(dt)

    -- => nextX nextY
    event.onAccSystemUpdate:Trigger(dt)

    event.onAfterLateUpdate:Trigger(dt)
    --  =>v x y
    event.onLateUpdate:Trigger(dt)
end

function love.resize(w, h)
    event.resize:Trigger(w, h)
end