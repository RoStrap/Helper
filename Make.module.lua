-- @author Validark
-- @readme https://github.com/NevermoreFramework/Helper#make

local type = type
local unpack = unpack
local setmetatable = setmetatable

local Clone = game.Clone
local CreateInstance = Instance.new

local Instances = {}

function Instances:__call(Table, ...)
	local Object = CreateInstance(self.InstanceType)
	local Parent = Table.Parent

	if Parent then
		Table.Parent = nil
	end

	for Property, Value in next, Table do
		if type(Property) == "number" then
			Value.Parent = Object
		else
			Object[Property] = Value
		end
	end

	if Parent then
		Object.Parent = Parent
	end

	if ... then
		local Objects = {...}
		for a = 1, #Objects do
			local Object = Clone(Object)
			for Property, Value in next, Objects[a] do
				if type(Property) == "number" then
					Value.Parent = Object
				else
					Object[Property] = Value
				end
			end
			Object.Parent = not Object.Parent and Parent
			Objects[a] = Object
		end
		return Object, unpack(Objects)
	else
		return Object
	end
end

return function(InstanceType)
	return setmetatable({InstanceType = InstanceType}, Instances)
end
