local class = require('30log')


local pipeline = class()
function pipeline:__init(commands)
    self.commands = commands
end

function pipeline:execute(context)
    for i, command in ipairs(self.commands) do
        command:process(context)
    end
end


local command = class()
function command:__init()

end

