require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('foundation.fs')


local entries = fs.scandir('/')
    :map(function(p) return fs.stat('/' .. p) end)

for i, entry in iter(entries) do
    print(entry.path, entry.size)
end

uv.run('default')

