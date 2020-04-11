require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('foundation.fs')


local entries = fs.scandir('/')
    :filter(function(name) return name:find("^s") end)
    :skip(1)
    :take(3)

for i, name in iter(entries) do
    print(name)
end

uv.run('default')

