local playerMeta = FindMetaTable("Player")
function playerMeta:SetWanted()
    if self:IsWanted() then
        self:setNetVar("wanted", false)
    else
        self:setNetVar("wanted", true)
    end
end