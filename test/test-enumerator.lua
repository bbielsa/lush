require('packages')

local busted = require('busted')
local enumerator = require('enumerator').enumerator
local iter = require('enumerator').iter


describe('Enumerators', function()
    it('should iterate over tables', function()
        local e = enumerator({1, 2, 3})
        local i = 1

        for k, v in iter(e) do
            assert.are.same(i, v)

            i = i + 1
        end
    end)
end)
