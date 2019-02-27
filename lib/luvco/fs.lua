local uv = require('luv')


function readdir(path)
    return coroutine.create(function()
        uv.fs_scandir(path, function(err, req)
            local entry, entry_type = uv.fs_scandir_next(req)

            while entry do
                coroutine.yield(entry)
                print(entry)
                entry, entry_type = uv.fs_scandir_next(req)
            end
        end)
    end)
end

return {
    readdir = readdir
}

