-- Spawns a new thread without waiting one step
-- Fastest implementation I know of
-- @author Validark

local coroutine_wrap = coroutine.wrap
local coroutine_yield = coroutine.yield

local function FunctionWrapper(callback, ...)
    coroutine_yield()
    callback(...)
end

local Bindable = Instance.new("BindableEvent")
Bindable.Event:Connect(function(callback) callback() end)

local function FastSpawn(callback, ...)
    local func = coroutine_wrap(FunctionWrapper)
	func(callback, ...)
    Bindable:Fire(func)
end

return FastSpawn
