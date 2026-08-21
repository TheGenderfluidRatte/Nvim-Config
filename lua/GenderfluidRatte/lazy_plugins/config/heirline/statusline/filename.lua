local filename = {}

filename.utils = require("heirline.utils")
filename.conditions = require("heirline.conditions")

function filename.getFileName()
    return vim.api.nvim_buf_get_name(0)
end

function filename.makeFileFlags()
    return {
        {
            condition = function()
                return vim.bo.modified
            end,
            provider = "󰷈 ",
            hl = { fg = filename.utils.get_highlight("Normal").fg }
        },
        {
            condition = function()
                return not vim.bo.modifiable or vim.bo.readonly
            end,
            provider = " ",
            hl = { fg = "orange" }
        }
    }
end

function filename.makeFileNameAndPath()
    return {
        provider = function()
            local working_dir_filename = vim.fn.fnamemodify(filename.getFileName(), ":.")
            if working_dir_filename == "" then return " [No File Name] " end

            if not filename.conditions.width_percent_below(#working_dir_filename, 0.25) then
                working_dir_filename = vim.fn.pathshorten(working_dir_filename)
            end

            return " " .. working_dir_filename .. " "
        end,

        hl = {
            fg = filename.utils.get_highlight("Normal").fg,
            bg = ""
        },

        filename.makeFileFlags()
    }
end

function filename.getStatusLineObj()
    return {
        filename.makeFileNameAndPath()
    }
end

return filename
