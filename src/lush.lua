require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('foundation.fs')
local random = require('cmd.core.random')
local taskprinter = require('cmd.output.taskprinter')
local pipeline = require('cmd.pipeline')


local context = {}
local randomcmd = random()
local taskprinter = taskprinter()
local commands = {randomcmd, taskprinter}
local pipe = pipeline(commands)

pipe:execute(context)

--[[
local entries = fs.scandir('/')
    :map(function(p) return fs.stat('/' .. p) end)

for i, entry in iter(entries) do
    print(entry.path, entry.size)
end
]]

uv.run('default')

