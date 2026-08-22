local ruler = {}

ruler.utils = require("heirline.utils")

function ruler.makeRulerValues()
    return {
        provider = "  %l:%c  %p%%  ",
        hl = { bg = ruler.utils.get_highlight("LineNr").bg }
    }
end

function ruler.makeEndPiece()
    return {
        provider = "",
        hl = {
            fg = ruler.utils.get_highlight("LineNr").bg,
            bg = ruler.utils.get_highlight("DiffChange").bg
        }
    }
end

function ruler.getStatusLineObj()
    return { ruler.makeEndPiece(), ruler.makeRulerValues() }
end

return ruler
