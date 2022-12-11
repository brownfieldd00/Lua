local Network = {}
local HttpService = game:GetService('HttpService')
function Network.get(url, headers)
    local headers = headers or {}
    local res = HttpService:GetAsync(url, true, headers)
    return res
end
function Network.post(url, data)
    local data = data or {}
    local res = HttpService:PostAsync(url, data)
    return res
end
function Network.encode(tbl)
    return HttpService:JSONEncode(tbl)
end
function Network.decode(json)
    return HttpService:JSONDecode(json)
end

return Network