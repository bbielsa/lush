local uv = require('luv')

function spy(...)
    print(...)

    return ...
end

uv.fs_scandir('/', function(err, req) 
    local next = uv.fs_scandir_next(req)

    while next do
        print(next)

        next = spy(uv.fs_scandir_next(req))
    end
end)

uv.run('default')
