local class = require('30log')


local task = class()
function task:init(complete, result)
    self.complete = complete
    self.result = result
end


return task

