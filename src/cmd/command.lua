local class = require('30log')


local param = {
    param = function(self, options)
        local p = options
        local params = self.params or {}

        table.insert(params, p)

        self.params = params
    end
}

local command = class()
command:with(param)

function command:init(values)
    self.values = values

    self:validate()
end

function command:validate()
    if not self.params then
        return true
    end

    for i, param in ipairs(self.params) do
        local value = self.values[param.name] or param.default
        local expectedtype = param.type

        assert(type(value) == expectedtype)
    end
end

return command
