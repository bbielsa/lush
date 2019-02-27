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

return {
    iter = iter
}

