local Roblox = {}
local HttpService = game:GetService('HttpService')
function Roblox:loadModule(url)
	local data = HttpService:GetAsync(url) or 'error("Unable to load")'
	return loadstring(data)()
end
return Roblox
