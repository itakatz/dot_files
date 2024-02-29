return {}
--[[
return {
    'glepnir/dbsession.nvim', 
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad'},
    opts = {}, --config
    config = function()
        require('dbsession').setup {
            -- config
        }
    end
}
]]--
