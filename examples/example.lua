-- constants
local PI = 3.1415926535
local APP_NAME = "Clarity"

print(PI)

-- utility function
local function clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end
    return value
end

-- class-like table
local Vector = {}
Vector.__index = Vector

function Vector.new(x, y)
    local self = setmetatable({}, Vector)
    self.x = x or 0
    self.y = y or 0
    return self
end

function Vector:length()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector:normalize()
    local len = self:length()
    if len == 0 then
        return Vector.new(0, 0)
    end

    return Vector.new(self.x / len, self.y / len)
end

-- example function with loops and conditions
local function process_numbers(numbers)
    local results = {}

    for i, num in ipairs(numbers) do
        local squared = num ^ 2
        local limited = clamp(squared, 0, 100)

        if limited > 50 then
            table.insert(results, {
                index = i,
                value = limited,
                status = "large"
            })
        else
            table.insert(results, {
                index = i,
                value = limited,
                status = "small"
            })
        end
    end

    return results
end

-- test data
local input_numbers = {1, 4, 7, 12, 20, 3, 9}

local output = process_numbers(input_numbers)

-- printing results
for _, entry in ipairs(output) do
    print(string.format(
        "[%d] value=%d (%s)",
        entry.index,
        entry.value,
        entry.status
    ))
end

-- demonstrate vectors
local v = Vector.new(10, 20)
local normalized = v:normalize()

print("Vector length:", v:length())
print("Normalized:\n", normalized.x, normalized.y)

-- anonymous functions
local doubled = (function(n)
    return n * 2
end)(21)

print("Doubled:", doubled)

-- edge cases
local strange_values = {
    true,
    false,
    nil,
    math.huge,
    -math.huge
}

for _, v in ipairs(strange_values) do
    print("Value:", tostring(v))
end
