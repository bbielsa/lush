
local class = require '30log'


function iter_next(g, i)
    local status, v = coroutine.resume(g)

    if status and v then
        i = i + 1

        return i, v
    end
end

function iter(e)    
    local f = e.source
    local g = coroutine.create(f)

    return iter_next, g, 0
end

local enumerator = class()
function enumerator:__init(source)
    assert(type(source) == 'table' or type(source) == 'function')

    local source_type = type(source)

    if source_type == 'function' then
        self.source = source
    else
        self.source = enumerator.wrap(source)
    end
end

function enumerator.wrap(t)
    assert(type(t) == 'table')

    return function() 
        for k, v in ipairs(t) do
            coroutine.yield(k, v)
        end
    end
end

function enumerator:next()
    print('next called')
end

function enumerator:skip(n) 

end

function enumerator:take(n)

end

-- local s = function() 
--     coroutine.yield(1)
--     coroutine.yield(2)
--     coroutine.yield(3)
--     coroutine.yield(4)
-- end

s = {1, 2, 3, 4}

local e = enumerator(s)

for k, n in iter(e) do
    print(n)
end
