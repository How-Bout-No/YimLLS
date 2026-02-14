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

---@param format string
---@param ... any
function log.finfo(format, ...) end

---Logs a warning message.
---**Example Usage:**
---```lua
---log.warning(data)
---```
---@param data string
function log.warning(data) end

---@param format string
---@param ... any
function log.fwarning(format, ...) end

---Logs a debug message.
---**Example Usage:**
---```lua
---log.debug(data)
---```
---@param data string
function log.debug(data) end

---@param format string
---@param ... any
function log.fdebug(format, ...) end


