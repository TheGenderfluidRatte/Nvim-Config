local icon = {}

icon.utils = require("heirline.utils")

function icon.makeIcon()
    return {
        init = function(self)
            local filename = vim.api.nvim_buf_get_name(0)
            local extension = vim.fn.fnamemodify(filename, ":e")
            self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        end,

        provider = function(self)
            return ("  " .. self.icon .. "  ")
        end,

        hl = function(self)
            return {
                fg = self.icon_color,
                bg = icon.utils.get_highlight("DiffChange").bg
            }
        end
    }
end

function icon.makeEndPiece()
    return {
        provider = "",
        hl = {
            fg = icon.utils.get_highlight("DiffChange").bg
        }
    }
end

function icon.getStatusLineObj()
    return {
        icon.makeEndPiece(), icon.makeIcon()
    }
end

return icon
