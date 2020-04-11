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
    self.values = values or {}

    self:default()
    self:validate()
end

function command:default()
    if not self.params then
        return
    end

    for k, param in ipairs(self.params) do
        self.values[param.name] = self.values[param.name] or param.default
    end
end

function command:validate()
    if not self.params then
        return true
    end

    for k, param in ipairs(self.params) do
        local value = self.values[param.name]
        local expectedtype = param.type

        assert(type(value) == expectedtype)

        self.values[param.name] = value
    end
end


return command

