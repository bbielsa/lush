

local enumerator = {}

function enumerator.create(generator)
    assert(type(generator) == 'function')
	
    local co = coroutine.wrap(generator)

    return {
        type = 'enumerator',
    	generator = co
    }
end

enumerator.yield = coroutine.yield
enumerator.next = coroutine.resume
enumerator.status = coroutine.status

function iter_next(g, i)
    local status, v = coroutine.resume(g)

    if status and v then
        i = i + 1

        return i, v
    end
end

function iter(g)
    -- assert(type(e) == 'table')
    -- assert(e.type == 'enumerator')

    -- local g = e.generator
    
    return iter_next, g, 0
end

return {
    iter = iter,
    enumerator = enumerator
}

