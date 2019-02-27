
local class = require '30log'


function iter_next(e, i)
    local next = { e:next() }
    local status = table.remove(next, 1)
    local args = next

    if status then
        return table.unpack(args)
    end
end

function iter(e)    
    return iter_next, e, 0
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

    self.generator = coroutine.create(self.source)
end

function enumerator.wrap(t)
    assert(type(t) == 'table')

    return function() 
        for k, v in ipairs(t) do
            coroutine.yield(k, v)
        end
    end
end

function enumerator:next(i)
    return coroutine.resume(self.generator)
end

function enumerator:skip(n) 
    local new = enumerator(self.source)

    for i = 1, n do 
        new:next()
    end

    return new
end

function enumerator:take(n)

end


local s = function() 
    coroutine.yield(1)
    coroutine.yield(2)
    coroutine.yield(3)
    coroutine.yield(4)
end

local e = enumerator(s)
local e_skipped = e:skip(2)

for k, v in iter(e_skipped) do
    print(k, v)
end


return {
    iter = iter,
    enumerator = enumerator
}

