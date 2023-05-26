local locations = {
  -- {name="", color=, id=, x=, y=, z=},

  {name="Mechanic", color=5, id=446, x = -347.291, y = -133.370, z = 38.009},
  {name="Pacific Bank", color=5, id=108, x = 260.130, y = 204.308, z = 109.287},
}


Citizen.CreateThread(function()

    for _, info in pairs(locations) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z) -- Adds the blip at location determined inside each line of blips.lua
      SetBlipSprite(info.blip, info.id) -- Sets the displayed sprite for a specific blips. Determined in the blips.lua
      SetBlipDisplay(info.blip, 3)
      -- Blip Display Behavior: 0 = Never Shows Up, 2 = Shows Up On Both Mini and Main Map , 3 = Shows up on main map (selectable), 5 = Shows up on minimap only , 8 = Shows on both maps
      SetBlipScale(info.blip, 0.6) -- Sets The Blip Scale from 0.1 to 1.0
      SetBlipColour(info.blip, info.color) -- Sets The Color Based on the Color ID Selected inside blips.lua
      SetBlipAsShortRange(info.blip, true) -- Sets whether or not the specified blip should only be displayed when nearby, or on the minimap.
	  BeginTextCommandSetBlipName("STRING") -- "STRING" entails that whatever is changed in the blips.lua file under the NAME section is what will show
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)