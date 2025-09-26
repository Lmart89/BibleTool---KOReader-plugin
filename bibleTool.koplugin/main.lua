local WidgetContainer = require("ui/widget/container/widgetcontainer")
local UIManager = require("ui/uimanager")
local FrameContainer = require("ui/widget/container/framecontainer")
local VerticalGroup = require("ui/widget/container/verticalgroup")
local HorizontalGroup = require("ui/widget/container/horizontalgroup")
local TextWidget = require("ui/widget/textwidget")
local datetime = require("datetime")
local Device = require("device")
local _ = require("gettext")

-- Cargar módulos
local Bible = require("plugins/bibletool/modules/bible")
local Commentary = require("plugins/bibletool/modules/commentary")
local Dictionary = require("plugins/bibletool/modules/dictionary")
local Notes = require("plugins/bibletool/modules/notes")
local Settings = require("plugins/bibletool/modules/settings")

local BibleTool = WidgetContainer:extend{
    name = "bibletool",
}

function BibleTool:init()
    self.ui.menu:registerToMainMenu(self)
end

function BibleTool:addToMainMenu(menu_items)
    menu_items.bibletool = {
        text = _("BibleTool"),
        keep_menu_open = false,
        callback = function() self:openApp() end,
    }
end

--------------------------------------------------------
-- Barra superior personalizada con reloj, wifi, batería
--------------------------------------------------------
local function makeTopBar(update_callback)
    local powerd = Device:getPowerDevice()
    local battery = (powerd:getCapacity() or 0) .. "%"
    if powerd:isCharging() then
        battery = battery .. "⚡"
    end

    local wifi = ""
    if Device:hasWifi() then
        local wifiDev = Device:getWifiDevice()
        if wifiDev:isConnected() then
            wifi = "📶"
        else
            wifi = "❌"
        end
    end

    local time_str = datetime.formatTime(datetime.now())

    local titleWidget = TextWidget:new{ text = "📖 BibleTool - Bible Study App", face = "titlefont", width = 220, align = "left" }
    local timeWidget = TextWidget:new{ text = time_str, face = "titlefont", width = 100, align = "center" }
    local statusWidget = TextWidget:new{ text = wifi .. "  🔋" .. battery, face = "titlefont", width = 120, align = "right" }

    local container = FrameContainer:new{
        bordersize = 1,
        padding = 2,
        HorizontalGroup:new{
            titleWidget,
            timeWidget,
            statusWidget,
        }
    }

    -- Refresco automático cada minuto
    UIManager:schedule(60 * 1000, function()
        update_callback()
    end)

    return container, timeWidget, statusWidget
end

-- Barra inferior
local function makeBottomBar()
    return FrameContainer:new{
        bordersize = 1,
        padding = 2,
        TextWidget:new{ text = "Contexto: aún sin módulo activo" }
    }
end

-- Barra lateral izquierda
local function makeSideBar(callbacks)
    local side = VerticalGroup:new{}
    local buttons = {
        { icon = "📖", name = "Biblia", action = callbacks.bible },
        { icon = "💬", name = "Coment.", action = callbacks.commentary },
        { icon = "📚", name = "Dicc.", action = callbacks.dictionary },
        { icon = "📝", name = "Notas", action = callbacks.notes },
        { icon = "⚙️", name = "Config.", action = callbacks.settings },
    }
    for _, b in ipairs(buttons) do
        side:addWidget(TextWidget:new{
            text = b.icon .. " " .. b.name,
            face = "menufont",
            callback = b.action,
        })
    end
    return side
end

-- Pantalla principal
function BibleTool:openApp()
    local mainView = TextWidget:new{ text = "Selecciona un módulo desde la barra lateral." }

    -- Callbacks de los botones para cargar módulos
    local callbacks = {
        bible = function() Bible:show(mainView) end,
        commentary = function() Commentary:show(mainView) end,
        dictionary = function() Dictionary:show(mainView) end,
        notes = function() Notes:show(mainView) end,
        settings = function() Settings:show(mainView) end,
    }

    -- Construimos la barra superior con widgets dinámicos
    local topBar, timeWidget, statusWidget
    topBar, timeWidget, statusWidget = makeTopBar(function()
        -- Refrescar contenido dinámico
        local powerd = Device:getPowerDevice()
        local battery = (powerd:getCapacity() or 0) .. "%"
        if powerd:isCharging() then
            battery = battery .. "⚡"
        end

        local wifi = ""
        if Device:hasWifi() then
            local wifiDev = Device:getWifiDevice()
            wifi = wifiDev:isConnected() and "📶" or "❌"
        end

        timeWidget:setText(datetime.formatTime(datetime.now()))
        statusWidget:setText(wifi .. "  🔋" .. battery)

        -- Reschedule
        UIManager:schedule(60 * 1000, function()
            timeWidget:setText(datetime.formatTime(datetime.now()))
        end)
    end)

    local layout = VerticalGroup:new{
        topBar,
        HorizontalGroup:new{
            makeSideBar(callbacks),
            mainView
        },
        makeBottomBar(),
    }

    UIManager:show(layout)
end

return BibleTool
