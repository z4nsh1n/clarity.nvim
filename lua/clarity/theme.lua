local palette = require("clarity.palette")
local utils = require("clarity.utils")

local theme = {
    Normal = {
        fg = palette.fg,
        bg = palette.bg
    },
    Comment = {
        fg = palette.grey,
    },
    Identifier = {
        fg = palette.blue,
    },
    Function = {
        fg = palette.yellow,
    },
    Keyword = {
        bold = false,
        -- fg = palette.yellow,
        -- fg = utils.lighten(palette.blue, -0.5),
        -- fg = utils.darken(palette.blue, 0.5),
        fg = palette.orange, 
    },
    String = {
        fg = palette.green,
    },
    Constant = {
        fg = palette.blue,
    },
    Type = {
        fg = palette.fg,
    },
    Special = {
        fg = palette.fg,
    },
    Operator = {
        fg = palette.fg,
    },
    Number = {
        fg = palette.green,
    },
    Boolean = {
        fg = palette.green,
    },
    Delimiter = {
        fg = utils.lighten(palette.bg, 0.3),
    },

    -- NOTE: Just lua stuff
    ["@constructor.lua"] = {
        fg = utils.lighten(palette.bg, 0.3),
    },
    ["@lsp.type.property"] = {
        link = "Normal",
    },
    ["@lsp.typemod.variable.declaration"] = {
        link = "Constant",
    },
    ["@lsp.typemod.variable.defaultLibrary"] = {
        link = "Normal",
    },
    ["@lsp.type.method"] = {
        link = "Normal",
    },
    ["@lsp.type.function"] = {
        link = "Normal",
    },

    -- NOTE: Just python stuff
    ["@variable.parameter.python"] = {
        link = "Constant",
    },
    ["@type.python"] = {
        link = "Function",
    },
    ["@variable.member"] = {
        link = "Constant",
    },
    ["@function.method.call"] = {
        link = "Normal",
    },
    ["@function.call"] = {
        link = "Normal",
    },

    -- NOTE: Just JavaS*ript stuff
    ["@lsp.typemod.function.defaultLibrary"] = {
        link = "Normal",
    },
    ["@lsp.typemod.class.declaration"] = {
        link = "Function",
    },
    ["@lsp.typemod.function.declaration"] = {
        link = "Function",
    },

    -- NOTE: Just go stuff
    ["@type.definition"] = {
        link = "Function",
    },
}

return theme
