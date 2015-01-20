#!/usr/bin/lua
-- Lua syntax example

function example(x)
    for k, v in pairs(x) do
        local r
        if type(v) == "string" then
            r = v .. " World"
        elseif not v or v == 0xbada55 * 10 then
            r = nil
            break
        else
            r = false
        end
        print(r)
    end
    return true
end

local t = {a="Hello", b=9, c=false}
example(t)
