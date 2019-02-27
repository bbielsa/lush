local iter = require('iter').iter
local enumerator = require('iter').enumerator
local fs = require('luvco.fs')


local numbers = coroutine.create(function()
    for i = 1, 10 do
        print("yielding", i)
        coroutine.yield(i)
    end
end)

local double = n:map(function(v) return v * 2 end)

for n in iter(double) do
    print("got", n)
end




-- local numbers = {}

-- for i = 1, 10 do 
--     print("yielding", i)
--     numbers[i] = i
-- end


-- for k, n in ipairs(numbers) do
--     print("got", n)
-- end

-- local map = function(e, f)
--     return enumerator.create(function(e, f)
--         for v in iter(e) do
--             enumerator.yield(f(v))
--         end
--     end)
-- end

-- local for_each = function(e, f)
--     return enumerator.create(function(e, f)
--         for v in iter(e) do
--             f(e)
--         end
--     end)
-- end

-- local mapped = map(e, function(v) return v + 1 end)

-- print(mapped.next())
--for_each(mapped, function(v) print("v", v) end)

