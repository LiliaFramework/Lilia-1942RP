ITEM.name = "Cigarette"
ITEM.desc = "A Cigarette."
ITEM.model = "models/mordeciga/mordes/oldcigshib.mdl"
ITEM.uniqueID = "weapon_ciga"

ITEM.functions.TakeOutCig = {
    name = "Light Up & Smoke",
    onRun = function(item)
        local client = item.player
        nut.chat.send(client, "me", "takes out a cigarette and lights it up.")

        timer.Simple(math.random(20, 45), function()
            nut.chat.send(client, "me", "finishes his smoke and stomps it out.")
        end)
    end
}