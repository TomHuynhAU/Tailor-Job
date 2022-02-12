ESX                             = nil
local PlayerData                = {}

local blip1 = {}
local blips = false
local blipActive = false
local khaithacactive = false
local chebienactive = false
local donggoiactive = false
local firstspawn = false
local impacts = 0
local timer = 0
local locations = { 
    { ['x'] = 1834.7938232422,  ['y'] = 4993.978515625,  ['z'] = 53.732063293457},
    { ['x'] = 1831.8640136719,  ['y'] = 4991.3403320313,  ['z'] = 53.023147583008},
    { ['x'] = 1830.2668457031,  ['y'] = 4998.5966796875,  ['z'] = 54.28360748291},
    { ['x'] = 1826.0640869141,  ['y'] = 4995.0341796875,  ['z'] = 53.312934875488},
}

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)  

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent("esx_vai:givevai")
AddEventHandler("esx_vai:givevai", function()
    Animation()
end)

RegisterNetEvent("esx_vai:detvai")
AddEventHandler("esx_vai:detvai", function()
    Chebien()
end)

RegisterNetEvent("esx_daumo:donggoi")
AddEventHandler("esx_daumo:donggoi", function()
    Donggoi()
end)

RegisterNetEvent('esx_daumo:timer')
AddEventHandler('esx_daumo:timer', function()
    local timer = 0
    local ped = PlayerPedId()
    
    Citizen.CreateThread(function()
		while timer > -1 do
			Citizen.Wait(150)

			if timer > -1 then
				timer = timer + 1
            end
            if timer == 100 then
                break
            end
		end
    end) 

    -- Citizen.CreateThread(function()
    --     while true do
    --         Citizen.Wait(1)
    --         if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ChebienX, Config.ChebienY, Config.ChebienZ, true) < 5 then
    --             Draw3DText( Config.ChebienX, Config.ChebienY, Config.ChebienZ+0.5 -1.400, ('<FONT FACE="Baloo Paaji 2 SemiBold">Đang Lọc Dầu ' .. timer .. '%'), 4, 0.1, 0.1)
    --         end
    --         if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ, true) < 5 then
    --             Draw3DText( Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ+0.5 -1.400, ('<FONT FACE="Baloo Paaji 2 SemiBold">Đang Chế Biến ' .. timer .. '%'), 4, 0.1, 0.1)
    --         end
    --         if timer == 100 then
    --             timer = 0
    --             break
    --         end
    --     end
    -- end)
end)

RegisterNetEvent('esx_daumo:createblips')
AddEventHandler('esx_daumo:createblips', function()
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(1)
                if blips == true and blipActive == false then
                    blip1 = AddBlipForCoord(1834.7600097656, 4994.4692382813, 53.69132232666)
                    blip2 = AddBlipForCoord(Config.ChebienX, Config.ChebienY, Config.ChebienZ)
                    blip3 = AddBlipForCoord(Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ)
--[[                     blip4 = AddBlipForCoord(Config.SellX, Config.SellY, Config.SellZ)
 ]]                    SetBlipSprite(blip1, 366)
                    SetBlipColour(blip1, 0)
                    SetBlipScale(blip1, 0.65)
                    SetBlipAsShortRange(blip1, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('[~y~Nghề Vải~s~] Hái Bông Gòn')
                    EndTextCommandSetBlipName(blip1)   
                    SetBlipSprite(blip2, 366)
                    SetBlipColour(blip2, 0)
                    SetBlipScale(blip2, 0.65)
                    SetBlipAsShortRange(blip2, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('[~y~Nghề Vải~s~] Dệt Vải')
                    EndTextCommandSetBlipName(blip2)   
                    SetBlipSprite(blip3, 366)
                    SetBlipColour(blip3, 0)
                    SetBlipScale(blip3, 0.65)
                    SetBlipAsShortRange(blip3, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('[~y~Nghề Vải~s~] May Quần Áo')
                    EndTextCommandSetBlipName(blip3)
--[[                     SetBlipSprite(blip4, 436)
                    SetBlipColour(blip4, 5)
                    SetBlipAsShortRange(blip4, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString('<FONT FACE="Baloo Paaji 2 SemiBold">Khu | Giao Xăng')
                    EndTextCommandSetBlipName(blip4)  ]]   
                    blipActive = true
                elseif blips == false and blipActive == false then
                    RemoveBlip(blip1)
                    RemoveBlip(blip2)
                    RemoveBlip(blip3)
--[[                     RemoveBlip(blip4)
 ]]                end
        end
    end)
end)


Citizen.CreateThread(function()
    blip1 = AddBlipForCoord(Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ)
    SetBlipSprite(blip1, 366)
    SetBlipColour(blip1, 0)
    SetBlipScale(blip1, 0.65)
    SetBlipAsShortRange(blip1, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('[~y~Nghề Vải~s~] Nơi làm việc')
    EndTextCommandSetBlipName(blip1)   
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 25 then
                    DrawMarker(20, Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, 0, 0, 0, 0, 0, 90.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 1 then
                            ESX.ShowHelpNotification('Nhấn [E] để thay đồ')
                                if IsControlJustReleased(1, 51) then
                                    Cloakroom() 
                            end
                        end
                    end
                end
            end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
            for i=1, #locations, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 25 and khaithacactive == false then
                DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 1 then
                        ESX.ShowHelpNotification('Nhấn [E] để lấy vải')
                            if IsControlJustReleased(1, 51) then
                                if ESX.GetPlayerData() and ESX.GetPlayerData().job.name == 'tailor' then  
                                    TriggerEvent("progressbar:client:progress", {
                                        name = "occupation",
                                        duration = 15900,
                                        label = 'đang lấy len',
                                        useWhileDead = false,
                                        canCancel = true,
                                        controlDisables = {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                        },
                                        --[[ animation = {
                                            animDict = "missheistdockssetup1clipboard@idle_a",
                                            anim = "idle_a",
                                        },
                                        prop = {
                                            model = "",
                                        } ]]
                                    }, function(status)
                                        if not status then 
                                        
                                        end
                                    end)
                                    Animation()
                                    -- khaithacactive = true
                                else 
                                    exports['qt-notify']:Alert("Hệ Thống", "Bạn không phải là thợ vải", 5000, 'error')
                                end
                            end
                        end
			end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ChebienX, Config.ChebienY, Config.ChebienZ, true) < 25 and chebienactive == false then
            DrawMarker(20, Config.ChebienX, Config.ChebienY, Config.ChebienZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.ChebienX, Config.ChebienY, Config.ChebienZ, true) < 1 then
                    ESX.ShowHelpNotification('Nhấn [E] để dệt vải')
                        if IsControlJustReleased(1, 51) then
                            if ESX.GetPlayerData() and ESX.GetPlayerData().job.name == 'tailor' then
                                TriggerEvent("progressbar:client:progress", {
                                    name = "occupation",
                                    duration = 15900,
                                    label = 'đang dệt vải',
                                    useWhileDead = false,
                                    canCancel = true,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    },
                                    --[[ animation = {
                                        animDict = "missheistdockssetup1clipboard@idle_a",
                                        anim = "idle_a",
                                    },
                                    prop = {
                                        model = "",
                                    } ]]
                                }, function(status)
                                    if not status then 
                                    
                                    end
                                end)
                                TriggerServerEvent("esx_vai:detvai")
                            else 
                                exports['qt-notify']:Alert("Hệ Thống", "Bạn không phải là thợ may", 5000, 'error')
                            end
                end
			end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ, true) < 25 and donggoiactive == false then
            DrawMarker(20, Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.DonggoiX, Config.DonggoiY, Config.DonggoiZ, true) < 1 then
                    ESX.ShowHelpNotification('Nhấn [E] để may quần áo')
                        if IsControlJustReleased(1, 51) then
                            if ESX.GetPlayerData() and ESX.GetPlayerData().job.name == 'tailor' then
                                TriggerEvent("progressbar:client:progress", {
                                    name = "occupation",
                                    duration = 15900,
                                    label = 'đang may quần áo',
                                    useWhileDead = false,
                                    canCancel = true,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    },
                                    --[[ animation = {
                                        animDict = "missheistdockssetup1clipboard@idle_a",
                                        anim = "idle_a",
                                    },
                                    prop = {
                                        model = "",
                                    } ]]
                                }, function(status)
                                    if not status then 
                                    
                                    end
                                end)
                                TriggerServerEvent("esx_vai:quanao")  
                            else 
                                exports['qt-notify']:Alert("Hệ Thống", "Bạn không phải là thợ may", 5000, 'error')
                            end
                    end
				end
            end
        end
    end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX, Config.SellY, Config.SellZ, true) < 2 then
                ESX.ShowHelpNotification('Nhấn [E] để bán Quần Áo')
                    if IsControlJustReleased(1, 51) then
                        Jeweler()                          
            end
        end
    end
 end)
    

-- Citizen.CreateThread(function()
--     local hash = GetHashKey("s_m_m_dockwork_01")

--     if not HasModelLoaded(hash) then
--         RequestModel(hash)
--         Citizen.Wait(100)
--     end

--     while not HasModelLoaded(hash) do
--         Citizen.Wait(0)
--     end

--     if firstspawn == false then
--         local npc = CreatePed(6, hash, Config.SellX, Config.SellY, Config.SellZ, 17.5, false, false)
--         SetEntityInvincible(npc, true)
--         FreezeEntityPosition(npc, true)
--         SetPedDiesWhenInjured(npc, false)
--         SetPedCanRagdollFromPlayerImpact(npc, false)
--         SetPedCanRagdoll(npc, false)
--         SetEntityAsMissionEntity(npc, true, true)
--         SetEntityDynamic(npc, true)
--         SetBlockingOfNonTemporaryEvents(npc, true)
--     end
-- end)

--[[ Citizen.CreateThread(function()
    Concac()
end)

function Concac()
		while true do
			Citizen.Wait(0)			
		if GetDistanceBetweenCoords( -588.72, -135.47, 38.61, GetEntityCoords(GetPlayerPed(-1))) < 40.0 then
			Draw3DText( -588.72, -135.47, 38.61  -0.000000200, "<FONT FACE='Baloo Paaji 2 SemiBold'>Người Mua Xăng Dầu", 8, 0.1, 0.1)	
		end		
	end
end ]]

function Cloakroom()
    local elements = {
        {label = 'Quần Áo Thường',   value = 'cloakroom1'},
        {label = 'Quần Áo Làm Việc',      value = 'cloakroom2'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'daumo_actions', {
        title    = 'Phòng Thay Đồ',
        align    = 'bottom-right',
        elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom1' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
            end)
            blips = false
            blipActive = false
            TriggerEvent("esx_daumo:createblips")
		elseif data.current.value == 'cloakroom2' then
				TriggerEvent('skinchanger:getSkin', function(skin)
                    if skin.sex == 0 then
					  local clothesSkin = {
						['tshirt_1'] = 23, ['tshirt_2'] = 1,
                        ['torso_1'] = 230, ['torso_2'] = 0,
                        ['decals_1'] = 0, ['decals_2'] = 0,
                        ['arms'] = 70,
                        ['pants_1'] = 9, ['pants_2'] = 0,
                        ['shoes_1'] = 12, ['shoes_2'] = 6,
                        ['helmet_1'] = -1, ['helmet_2'] = 0,
                        ['chain_1'] = 0, ['chain_2'] = 0,
                        ['ears_1'] = -1, ['ears_2'] = 0
					  }
					  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                    end
                    blips = true
                    TriggerEvent("esx_daumo:createblips")
				end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function Jeweler()
    local elements = {
        {label = 'Bán Quần Áo',   value = 'clothe'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jeweler_actions', {
        title    = 'Chọn vật phẩm để bán',
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'clothe' then
            menu.close()
            --TriggerServerEvent("balance:server:sellStock", "essence")
            TriggerServerEvent("esx_vai:sellquanao")
        end
    end, function(data, menu)
        menu.close()
    end)
end

function Animation()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    khaithacactive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_miner:timer")
    Citizen.Wait(15900)
    TriggerServerEvent("esx_vai:givevai")
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    khaithacactive = false
end

function Chebien()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    chebienactive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_daumo:timer")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    chebienactive = false
end

function Donggoi()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    donggoiactive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_daumo:timer")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    donggoiactive = false
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 
    SetTextScale(0.35, 0.35)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   
end
