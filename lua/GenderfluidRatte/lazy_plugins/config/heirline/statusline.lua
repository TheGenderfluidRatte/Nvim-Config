local statusline = {
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.mode_indicator").getStatusLineObj(),
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.filename").getStatusLineObj(),
}

return statusline
