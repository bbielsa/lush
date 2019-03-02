require('packages')

local busted = require('busted')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter


describe('Enumerators', function()
    it('should iterate over a table', function()
        local e = enumerator({1, 2, 3})
        local i = 1

        for k, v in iter(e) do
            print(k, v)
            
            assert.are.same(i, v)

            i = i + 1
        end
    end)

    it('should iterate over a generator', function()
        local g = function()
            coroutine.yield(1)
            coroutine.yield(2)
            coroutine.yield(3)
        end
        local e = enumerator(g)
        local i = 1

        for k, v in iter(e) do
            assert.are.same(i, v)

            i = i + 1
        end
    end)

    it('should eagerly evaluate enumerators', function()
        local e = enumerator({1, 2, 3})
        local t = e:totable()
        
        assert.are.same({1, 2, 3}, t)
    end)

    it('should take from another enumerator', function()
        local e = enumerator({1, 2, 3, 4, 5})

        local a = e:take(4)
        local b = a:take(2)

        local t = b:totable()

        assert.are.same({1, 2}, t)
    end)

    it('should map to another enumerator', function()
        local e = enumerator({1, 2, 3, 4})
        local m = e:map(function(v) return v * 2 end)

        local t = m:totable()

        assert.are.same({2, 4, 6, 8}, t)
    end)

    it('should return a new enumerator after skipping some items', function()
        local e = enumerator({1, 2, 3, 4})
        local s = e:skip(3)

        local t = s:totable()

        assert.are.same({4}, t)
    end)

    it('should filter items to a new enumerator', function()
        local e = enumerator({1, 2, 3, 4, 5, 6})
        local evens = function(v) return math.fmod(v, 2) == 0 end
        local f = e:filter(evens)

        local t = f:totable()

        assert.are.same({2, 4, 6}, t)
    end)
end)
