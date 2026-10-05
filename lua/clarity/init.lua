local M = {}

function M.setup()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")

    vim.g.colors_name = "clarity"

    local theme = require("clarity.theme")

    for group, opts in pairs(theme) do
        if opts.link then
            vim.api.nvim_set_hl(0, group, { link = opts.link })
        else
            vim.api.nvim_set_hl(0, group, opts)
        end
    end
end

return M
