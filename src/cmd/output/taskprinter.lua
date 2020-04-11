local class = require('30log')
local command = require('cmd.command')

local resultformatter = class()
function resultformatter:init()
end

local primitiveformatter = resultformatter:extend()

function primitiveformatter:format(value)
    assert(type(value) == 'number'
            or type(value) == 'string'
            or type(value) == 'boolean')

    return tostring(value)
end

local tableformatter = resultformatter:extend()

function tableformatter:format(value)
    error('not implemented')
end

local taskprinter = command:extend()
function taskprinter:init()
end

function taskprinter:process(context, pipeline, i)
    local task = pipeline:receive()

    self:print(task)
end

function taskprinter:print(task)
    print(task.result)
end


return taskprinter

