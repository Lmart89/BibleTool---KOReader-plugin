local WidgetContainer = require("ui/widget/container/widgetcontainer")
local UIManager = require("ui/uimanager")
local KeyValuePage = require("ui/widget/keyvaluepage")
local _ = require("gettext")

local BibleTool = WidgetContainer:extend{
    name = "bibletool",
}

function BibleTool:init()
    self.ui.menu:registerToMainMenu(self)
end

function BibleTool:addToMainMenu(menu_items)
    menu_items.bibletool = {
        text = _("BibleTool"),
        keep_menu_open = true,
        callback = function() self:openApp() end,
    }
end

-- Pantalla principal de BibleTool
function BibleTool:openApp()
    local kv_pairs = {
        { _("BibleTool"), _("Aplicación en desarrollo") },
        { _("Opciones disponibles"), "" },
        { "📖 " .. _("Leer Biblia"), _("Abrir texto bíblico") },
        { "🔍 " .. _("Buscar"), _("Buscar un pasaje") },
        { "⭐ " .. _("Favoritos"), _("Lista de versículos favoritos") },
        { "📝 " .. _("Notas"), _("Tus anotaciones") },
    }

    UIManager:show(KeyValuePage:new{
        title = _("BibleTool"),
        kv_pairs = kv_pairs,
    })
end

return BibleTool
