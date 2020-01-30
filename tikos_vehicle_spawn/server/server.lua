AddEvent("OnPlayerJoin", function(player)
    SetPlayerSpawnLocation(player, 125773, 80246, 1645, 90) -- Base location spawn player join server
    AddPlayerChat(player, "Welcome to SERVER NAME," .. GetPlayerName(player).." !")
end)

print("Tikos Vehicle Lock script has been loaded to server !") -- do not touch

function cmd_v(player, model)
	if (model == nil) then
		return AddPlayerChat(player, "Usage: /v <model>")
	end

	model = tonumber(model)

	if (model < 1 or model > 25) then
		return AddPlayerChat(player, "Vehicle model "..model.." does not exist.")
	end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	if (vehicle == false) then
		return AddPlayerChat(player, "Failed to spawn your vehicle")
	end

	AddPlayerChat(player, "Vehicle spawned! (New ID: "..vehicle..")")
end
AddCommand("v", cmd_v)