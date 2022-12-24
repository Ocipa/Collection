
export type Queue = typeof(constructors.new(...))

export type Node = {
    Value: any,
    Next: Node?
}

local module = {} :: Queue

--[[

]]
function module:Append(Value: any): nil
    if Value == nil then return nil end

    local Node: Node = {
        Value = Value,
        Next = nil,
    }

    if not self._Head then
        self._Head = Node
    end

    if self._Tail then
        self._Tail.Next = Node
    end
    self._Tail = Node

    return nil
end

--[[

]]
function module:Remove(): nil
    if not self._Head then return nil end

    local Next = self._Head.Next

    table.clear(self._Head)
    self._Head = Next

    if not self._Head then
        self._Tail = nil
    end

    return nil
end

--[[

]]
function module:Pop(): any?
    if not self._Head then return nil end

    local Value = self._Head.Value

    self:Remove()

    return Value
end

--[[

]]
function module:Peek(): any?
    if not self._Head then return nil end

    return self._Head.Value
end

constructors = {
    new = function()
        local self = {}

        self._Head = nil :: Node?
        self._Tail = nil :: Node?

        return setmetatable(self, {__index = module})
    end,

    fromTable = function(Table: {})
        local self = constructors.new()

        for _, v in Table do
            self:Append(v)
        end

        return self
    end
}

return constructors
