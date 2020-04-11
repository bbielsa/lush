local uv = require('luv')
local command = require('cmd.command')
local task = require('cmd.task')


math.randomseed(uv.hrtime())

local random = command:extend()

random:param {name='from', type='number', default=0, help='Lower bound of the random number'}
random:param {name='to', type='number', default=1, help='Upper bound of the random number'}
random:param {name='int', type='boolean', default=false, help='Truncate the number to an integer'}

function random:validate()
    random.super:validate()
    
    assert(self.values.to >= self.values.from)
end

function random:process(context, pipeline, id)
    local range = self.values.to - self.values.from
    local random = math.random() 
    local result = task(true, random)
    
    pipeline:send(id, result)
end


return random

