local heirline = {}

local TEST_TabLine = {
    provider = "TabLine",
    hl = {bg = "#00FF00", fg = "#000000"}
}

function heirline.setup()
    return {
        statusline = {require("GenderfluidRatte.lazy_plugins.config.heirline.statusline")},
        tabline = {TEST_TabLine},
    }
end

return heirline
