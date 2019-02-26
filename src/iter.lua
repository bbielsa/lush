function iter_next(g, i)
    local status, v = coroutine.resume(g)

    if status and v then
        i = i + 1

        return i, v
    end
end

function iter(g)
    return iter_next, g, 0
end

local co = coroutine.create(function()
    coroutine.yield("hello")
    coroutine.yield("world")
    coroutine.yield("!!!!!")
    coroutine.yield("it works!")
end)


for k, msg in iter(co) do
    print(k , msg)
end

