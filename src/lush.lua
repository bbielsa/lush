require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('luvco.fs').fs

local ls = require('ls').cmd

for file, node_type in iter(ls('/')) do
    print(file, node_type)
end

uv.run('default')

