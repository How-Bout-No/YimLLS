---@meta
---@class log
---Table containing functions for printing to console / log file.
log = {}
-- Functions (6)

---Logs an informational message.
---**Example Usage:**
---```lua
---log.info(data)
---```
---@param data string
function log.info(data) end


---Logs a warning message.
---**Example Usage:**
---```lua
---log.warning(data)
---```
---@param data string
function log.warning(data) end


---Logs a debug message.
---**Example Usage:**
---```lua
---log.debug(data)
---```
---@param data string
function log.debug(data) end

---Logs a formatted informational message.
---**Example Usage:**
---```lua
---log.finfo("Loaded %d objects in %.2f ms", count, duration)
---```
---@param fmt string
---@param ... any
function log.finfo(fmt, ...) end


---Logs a formatted warning message.
---**Example Usage:**
---```lua
---log.fwarning("Spawned %d objects out of a maximum of %d", count, max_entities)
---```
---@param fmt string
---@param ... any
function log.fwarning(fmt, ...) end


---Logs a formatted debug message.
---**Example Usage:**
---```lua
---log.fdebug("Current player position: %s", Self:GetPos())
---```
---@param fmt string
---@param ... any
function log.fdebug(fmt, ...) end
