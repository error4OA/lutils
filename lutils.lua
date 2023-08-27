local lutils = {}

function lutils:URLify(str)
    return str:gsub("[^%w%-%._~]", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
end

function lutils:split(str, delimiter)
    local result = {}
    local pattern = string.format("([^%s]+)", delimiter)
    str:gsub(pattern, function(item)
        result[#result + 1] = item
    end)
    return result
end

function lutils:tableContains(myTable, targetString)
    for _, value in ipairs(myTable) do
        if value == targetString then
            return true
        end
    end
    return false
end

return lutils
