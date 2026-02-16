---@meta
---@alias BOOL boolean
---@alias float number
---@alias int integer
---@alias Hash integer
---@alias blip integer
---@alias Cam integer
---@alias entity integer
---@alias FireId integer
---@alias Interior integer
---@alias ItemSet integer
---@alias object integer
---@alias ped integer
---@alias Pickup integer
---@alias player integer
---@alias ScrHandle integer
---@alias vehicle integer
---@alias Any any
---@alias Vector3 vec3

SECURITY = {}
---@param variable number
function SECURITY.REGISTER_SCRIPT_VARIABLE(variable) end


---@param variable number
function SECURITY.UNREGISTER_SCRIPT_VARIABLE(variable) end


function SECURITY.FORCE_CHECK_SCRIPT_VARIABLES() end


