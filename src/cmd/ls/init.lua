local uv = require('luv')
local enumerator = require('enumerator').enumerator


local getfiles = function()    
    local req = uv.fs_scandir('/')

    local name, node_type = uv.fs_scandir_next(req)

    while name do
        coroutine.yield(name, node_type)
        
        name, node_type = uv.fs_scandir_next(req)
    end
end

local cmd = function()
    return enumerator(getfiles)    
end


return {
    cmd = cmd
}
