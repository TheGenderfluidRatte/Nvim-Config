local git = {}

git.utils = require("heirline.utils")
git.conditions = require("heirline.conditions")

function git.getStatusDict()
    return vim.b.gitsigns_status_dict or {}
end

function git.hasChanges()
    local status = git.getStatusDict()

    return (status.added or 0) > 0
        or (status.removed or 0) > 0
        or (status.changed or 0) > 0
end

function git.makeBranchName()
    return {
        provider = function()
            local head_name = git.getStatusDict().head or ""

            if head_name == "" and git.conditions.is_git_repo then
                return " Git Repo "
            end

            return "  " .. head_name .. " "
        end,

        hl = { bg = git.utils.get_highlight("LineNr").bg, bold = true }
    }
end

function git.makeDelimiters()
    return {
        {
            provider = function()
                local status = git.getStatusDict()
                local count = status.added or 0
                return count > 0 and ("+" .. count .. " ")
            end,

            hl = { fg = git.utils.get_highlight("diffAdded").fg }
        },
        {
            provider = function()
                local status = git.getStatusDict()
                local count = status.removed or 0
                return count > 0 and (" -" .. count .. " ")
            end,

            hl = { fg = git.utils.get_highlight("diffDeleted").fg }
        },
        {

            provider = function()
                local status = git.getStatusDict()
                local count = status.changed or 0
                return count > 0 and (" ~" .. count .. " ")
            end,

            hl = { fg = git.utils.get_highlight("diffChanged").fg }
        },

        hl = { bg = git.utils.get_highlight("LineNr").bg },
    }
end

function git.makeEndPiece()
    return {
        provider = "",

        hl = {
            fg = git.utils.get_highlight("LineNr").bg,
            bg = ""
        }
    }
end

function git.getStatusLineObj()
    return {
        git.makeBranchName(),
        git.makeDelimiters(),
        git.makeEndPiece(),
    }
end

return git
