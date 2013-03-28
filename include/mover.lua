require "class"

function Mover(members)
    local move = members or {}
    local function updatePos(self, dx, dy)
        self.dx = dx or self.dx
        self.dy = dy or self.dy
    end
    local function new(_, init)
        local postable = {x=0, y=0, dx=0, dy=0}
        return setmetatable(init or postable, mt)
    end
    -- local move = Class(class or {})
end
