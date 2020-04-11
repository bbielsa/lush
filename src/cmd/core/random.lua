local uv = require('luv')
local command = require('cmd.command')


math.randomseed(uv.hrtime())

local random = command:extend()

random:param {name='from', type='number', default=0, help='Lower bound of the random number'}
random:param {name='to', type='number', default=1, help='Upper bound of the random number'}

function random:process(context)
    local random = math.random(self.values.from, self.values.to)

    print(self.values.from, self.values.to)

    print('Generated random number', random)
end


return random

