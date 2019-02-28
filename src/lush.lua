require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('luvco.fs').fs


e = enumerator{1, 2, 3}

for k, v in iter(e) do
  print(k, v)
end

uv.run('default')
