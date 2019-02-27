local iter = require('iter').iter
local fs = require('luvco.fs')


local readdir_iter = fs.readdir('/')

for f in iter(readdir_iter) do
    print('got here')
    print(f)
end

