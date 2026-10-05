local utils = {}

function utils.lighten(hex, percent)
    hex = hex:gsub("#","")

    local r = tonumber(hex:sub(1,2),16)
    local g = tonumber(hex:sub(3,4),16)
    local b = tonumber(hex:sub(5,6),16)

    r = math.min(255, r + (255 - r) * percent)
    g = math.min(255, g + (255 - g) * percent)
    b = math.min(255, b + (255 - b) * percent)

    return string.format("#%02x%02x%02x", r, g, b)
end

function utils.blend(fg, bg, alpha)
    fg = fg:gsub("#","")
    bg = bg:gsub("#","")

    local fr = tonumber(fg:sub(1,2),16)
    local fg_g = tonumber(fg:sub(3,4),16)
    local fb = tonumber(fg:sub(5,6),16)

    local br = tonumber(bg:sub(1,2),16)
    local bg_g = tonumber(bg:sub(3,4),16)
    local bb = tonumber(bg:sub(5,6),16)

    local r = math.floor((alpha * fr) + ((1 - alpha) * br))
    local g = math.floor((alpha * fg_g) + ((1 - alpha) * bg_g))
    local b = math.floor((alpha * fb) + ((1 - alpha) * bb))

    return string.format("#%02x%02x%02x", r, g, b)
end

return utils
