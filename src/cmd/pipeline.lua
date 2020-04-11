local class = require('30log')


local pipeline = class()
function pipeline:init(commands)
    self.commands = commands
    self.result = nil
end

function pipeline:execute(context)
    for i, command in ipairs(self.commands) do
        command:process(context, self, i)
    end
end

function pipeline:send(id, task)
    self.result = task
end

function pipeline:receive()
    return self.result
end

return pipeline

