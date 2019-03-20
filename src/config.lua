local config = {}


function config.load_config(path)
    local config_function, err = loadfile(path)
end


config.load_config('rc.lua')

return {
    config = config
}

