
-- Add read delimited file into hash?
-- ex. https://stackoverflow.com/questions/40460712/read-file-line-by-line-into-array

local fileUtil = {}

function fileUtil.readWholeFile(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

return fileUtil
