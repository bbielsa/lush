local inode = require('foundation.fs.inode').inode
local enumerator = require('enumerator').enumerator
local uv = require('luv')


function scandir(path)
    local source = function()
        local req = uv.fs_scandir(path)

        local name = uv.fs_scandir_next(req)

        while name do
            yield(name)

            name = uv.fs_scandir_next(req)   
        end
    end

    return enumerator(source)
end


return {
    inode = inode,

    scandir = scandir
}

