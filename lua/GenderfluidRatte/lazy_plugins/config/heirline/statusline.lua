local statusline = {
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.mode_indicator").getStatusLineObj(),
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.filename").getStatusLineObj(),
    { provider = "%=" },
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.icon").getStatusLineObj(),
    require("GenderfluidRatte.lazy_plugins.config.heirline.statusline.ruler").getStatusLineObj(),
}

return statusline
