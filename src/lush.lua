require('packages')

local uv = require('luv')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter
local fs = require('luvco.fs').fs

function double(x)
  return 69, x*2
end

array = enumerator({2,3,4,5})
map = array:map(double)

for k,v, i in iter(map) do
  print(k,v,i)
end

uv.run('default')
