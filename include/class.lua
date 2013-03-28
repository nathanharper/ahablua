-- Stolen wholesale from: 
-- http://lua-users.org/wiki/LuaClassesWithMetatable
function Class(members)
    members = members or {}
    local mt = {
        __metatable = members;
        __index     = members;
        __tostring  = function(self) 
            -- If a key is not printed,
            -- it is still default.
            local str, mytype = ""
            for k,v in pairs(self) do 
                mytype = type(v)
                if mytype == "number" or mytype == "string" then
                    str = str .. k .. " = " .. v .. "\n"
                end
            end
            return str
        end;
    }
    local function new(_, init)
        return setmetatable(init or {}, mt)
    end
    local function copy(obj, ...)
        local newobj = obj:new(unpack(arg))
        for n,v in pairs(obj) do newobj[n] = v end
        return newobj
    end
    members.new  = members.new  or new
    members.copy = members.copy or copy
    return mt
end

Mover = {x=1, y=1, dx=1, dy=1}
Class(Mover)

m = Mover:new()

-- Whale = {}
-- Whale = Class(Mover)
-- -- setmetatable(Whale, Mover)
-- function Whale:sayHi()
--     print('ima whale')
-- end
