ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterCommand("checkiftuning", function(source, args, rawCommand)
	local playerPed = PlayerPedId()
	local vehicle, mods

    if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
		mods = ESX.Game.GetVehicleProperties(vehicle)

		local trans = mods['modTransmission'] + 2
		local engine = mods['modEngine'] + 2
		local susp = mods['modSuspension'] + 2
		local brakes = mods['modBrakes'] + 2
		local turbo = "nee"
	
		if mods['modTurbo'] then
			turbo = "ja"
		end
	
		TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
			multiline = true,
			args = {"Auto Tunings: ", "Motor: "..engine.."/5, Versnellingsbak: "..trans.."/4, Verlaging: "..susp.."/5, Remmen: "..brakes.."/4, Turbo: "..turbo..""}
		  })
		  
	end
	-- plus 2 want readable for hoomans.

	  

end, false)


