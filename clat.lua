local meta = {
    __tostring = function (self)
        local s = ""
        for k, v in pairs(self) do
            if type(k) == "string" then
                if type(v) == "string" then
                    s = s .. "-" .. k .. "=" .. v .. "\t"
                else
                    s = s .. "-" .. k .. "\t"
                end
            else
                s = s .. v .. "\t"
            end
        end
        return s
    end
}

---@param text string
---@return string[]
return function (text)
    local tokens = setmetatable({}, meta)
    local idx, temp = 1, ""
    while idx <= #text do
        local rest = text:sub(idx)
        repeat
            local match = rest:match("%s*")
            if match == rest:sub(1, #match) and #match > 0 then
                idx = idx + #match
                break
            end
            if rest:sub(1, 1) == "\"" then
                idx = idx + 1
                rest = text:sub(idx)
                local match = rest:match("[^\"]*")
                if match == rest:sub(1, #match) and #match > 0 then
                    idx = idx + #match + 1
                    table.insert(tokens, match)
                    break
                end
            end
            if rest:sub(1, 1) == "-" then
                idx = idx + 1
                rest = text:sub(idx)
                local key = rest:match("[^=%s]*")
                if key == rest:sub(1, #key) and #key > 0 then
                    idx = idx + #key
                    rest = text:sub(idx)
                    if rest:sub(1, 1) == "=" then
                        idx = idx + 1
                        rest = text:sub(idx)
                        if rest:sub(1, 1) == "\"" then
                            idx = idx + 1
                            rest = text:sub(idx)
                            local value = rest:match("[^\"]*")
                            if value == rest:sub(1, #value) and #value > 0 then
                                idx = idx + #value + 1
                                tokens[key] = value
                                break
                            end
                        else
                            local value = rest:match("[^%s]*")
                            if value == rest:sub(1, #value) and #value > 0 then
                                idx = idx + #value
                                tokens[key] = value
                                break
                            end
                        end
                    else
                        tokens[key] = true
                        break
                    end
                end
            end
            local match = rest:match("[^%s]*")
            if match == rest:sub(1, #match) and #match > 0 then
                idx = idx + #match
                table.insert(tokens, match)
                break
            end
        until true
    end
    return tokens
end