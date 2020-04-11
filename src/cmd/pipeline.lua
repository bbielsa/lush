local class = require('30log')


local pipeline = class()
function pipeline:init(commands)
    self.commands = commands
end

function pipeline:execute(context)
    for i, command in ipairs(self.commands) do
        command:process(context)
    end
end
