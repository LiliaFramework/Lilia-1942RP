function PLUGIN:PlayerLiliaDataLoaded(client)
    lia.char.restore(client, function(charList)
        if not IsValid(client) then return end
        MsgN("Loaded (" .. table.concat(charList, ", ") .. ") for " .. client:Name())

        for k, v in ipairs(charList) do
            if lia.char.loaded[v] then
                lia.char.loaded[v]:sync(client)
            end
        end

        for k, v in ipairs(player.GetAll()) do
            if v:getChar() then
                v:getChar():sync(client)
            end
        end

        client.liaCharList = charList
        self:syncCharList(client)
        client.liaLoaded = true
        client:setLiliaData("intro", true)
    end)
end

function PLUGIN:PostPlayerInitialSpawn(client)
    client:SetNoDraw(true)
    client:SetNotSolid(true)
    client:Lock()

    timer.Simple(1, function()
        if not IsValid(client) then return end
        client:KillSilent()
        client:StripAmmo()
    end)
end

function PLUGIN:PlayerLoadedChar(client, character, oldCharacter)
    client:Spawn()
end

function PLUGIN:OnCharCreated(client, character)
    local id = character:getID()
    MsgN("Created character '" .. id .. "' for " .. client:steamName() .. ".")
end