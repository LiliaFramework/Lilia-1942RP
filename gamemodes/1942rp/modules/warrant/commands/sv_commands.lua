--------------------------------------------------------------------------------------------------------
lia.command.add(
    "warrant",
    {
        adminOnly = false,
        privilege = "Basic User Permissions",
        onRun = function(client, arguments)
            local target = lia.command.findPlayer(client, arguments[1])
            local uniqueID = client:GetUserGroup()
            if not client:getChar():hasFlags("W") then
                client:notify("No permission to run this command!")

                return
            end

            if IsValid(target) and target:getChar() then
                if target:IsWanted() then
                    target:SetWanted()
                    client:notify("This person no longer has active warrants.")
                else
                    target:SetWanted()
                    client:notify("You have issued this person an active warrant.")
                end
            end
        end
    }
)
--------------------------------------------------------------------------------------------------------