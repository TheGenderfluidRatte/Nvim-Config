local mode_indicator = {}

mode_indicator.utils = require("heirline.utils")
mode_indicator.conditions = require("heirline.conditions")

mode_indicator.names = {
    n = "N",
    no = "OP",
    nov = "OP",
    noV = "OP",
    ["no\22"] = "OP",
    niI = "N",
    niR = "N",
    niV = "N",
    nt = "N",
    ntT = "N",
    v = "V",
    vs = "V",
    V = "V",
    Vs = "V",
    ["\22"] = "V",
    ["\22s"] = "V",
    s = "S",
    S = "S",
    ["\19"] = "S",
    i = "I",
    ic = "I",
    ix = "I",
    R = "R",
    Rc = "R",
    Rx = "R",
    Rvc = "R",
    Rvx = "R",
    c = "CMD",
    cr = "CMD",
    cv = "Ex",
    cvr = "Ex",
    r = "...",
    rm = "More",
    ["r?"] = "Query",
    ["!"] = "Shell",
    t = "T",
}

mode_indicator.colors = {
    n = "red",
    v = "cyan",
    V = "cyan",
    ["\22"] = "cyan",
    s = "purple",
    S = "purple",
    ["\19"] = "purple",
    i = "orange",
    R = "purple",
    c = "purple",
    r = "red",
    ["!"] = "red",
    t = "red",
}

function mode_indicator.getCurrentMode()
    return vim.fn.mode(1)
end

function mode_indicator.makeModeIndicator()
    return {
        provider = function()
            return "  󰄛  " .. mode_indicator.names[mode_indicator.getCurrentMode()] .. "  "
        end,

        hl = function()
            local mode = mode_indicator.getCurrentMode():sub(1, 1)
            return {
                bg = mode_indicator.utils.get_highlight("FloatBorder").fg,
                fg = mode_indicator.colors[mode],
                bold = true
            }
        end,

        update = {
            "ModeChanged",
            pattern = "*:*",
            callback = vim.schedule_wrap(function()
                vim.cmd("redrawstatus")
            end)
        }
    }
end

function mode_indicator.makeEndPiece()
    return {
        provider = "",

        hl = {
            fg = mode_indicator.utils.get_highlight("FloatBorder").fg,
            bg = "",
            bold = true
        }
    }
end

function mode_indicator.getStatusLineObj()
    return {mode_indicator.makeModeIndicator(), mode_indicator.makeEndPiece()}
end

return mode_indicator
