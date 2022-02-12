ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("esx_vai:givevai")
AddEventHandler("esx_vai:givevai", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.canCarryItem('wool', math.random(1, 3)) then
                xPlayer.addInventoryItem('wool', math.random(1, 3))
--                --TriggerEvent("api:randomItemSv", _source, 40, {"chi","thanda"}, math.random(1, 3))
                TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn đã nhận được Bông Gòn", 5000, 'success')
            else 
                TriggerClientEvent('qt-notify:Alert', _source, "ERROR", "Bạn đã đủ Bông Gòn trong túi", 5000, 'error')
            end
        end
    end)

    
-- RegisterNetEvent("esx_daumo:chebien")
-- AddEventHandler("esx_daumo:chebien", function(item, count)
--     local _source = source
--     local xPlayer  = ESX.GetPlayerFromId(_source)
--         if xPlayer ~= nil then
--             if xPlayer.getInventoryItem('petrol_raffin').count >= 100 then
--                 TriggerClientEvent('esx:showNotification', _source, 'Bạn đã đủ dầu sạch trong túi.')
--             elseif xPlayer.getInventoryItem('petrol').count >= 5 then
--                 xPlayer.removeInventoryItem("petrol", 5)
--                 TriggerClientEvent("esx_daumo:chebien", _source)
--                 Citizen.Wait(15900)
--                 xPlayer.addInventoryItem('petrol_raffin', 5)
--                 --TriggerEvent("api:randomItemSv", _source, 30, {"cat","resin"}, math.random(1, 3))
--                 --xPlayer.removeInventoryItem("petrol", 5)
--                 TriggerClientEvent('esx:showNotification', _source, 'Bạn nhận được 5 dầu sạch')
--             elseif xPlayer.getInventoryItem('petrol').count < 40 then
--                 TriggerClientEvent('esx:showNotification', _source, 'Bạn không có dầu.')
--             end
--         end
--     end)

RegisterNetEvent("esx_vai:detvai")
AddEventHandler("esx_vai:detvai", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('wool').count >= 1 then
                TriggerClientEvent("esx_vai:detvai", _source)
                Citizen.Wait(15900)
                if xPlayer.getInventoryItem('wool').count >= 10 and xPlayer.canCarryItem('fabric', 10) and math.random(1, 10) == 10 then 
                    xPlayer.removeInventoryItem("wool", 10)
                    xPlayer.addInventoryItem("fabric", 10)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 10 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 9 and xPlayer.canCarryItem('fabric', 9) and math.random(1, 9) == 9 then 
                    xPlayer.removeInventoryItem("wool", 9)
                    xPlayer.addInventoryItem("fabric", 9)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 9 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 8 and xPlayer.canCarryItem('fabric', 8) and math.random(1, 8) == 8 then 
                    xPlayer.removeInventoryItem("wool", 8)
                    xPlayer.addInventoryItem("fabric", 8)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 8 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 7 and xPlayer.canCarryItem('fabric', 7) and math.random(1, 4) == 7 then 
                    xPlayer.removeInventoryItem("wool", 7)
                    xPlayer.addInventoryItem("fabric", 7)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 7 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 6 and xPlayer.canCarryItem('fabric', 6) and math.random(1, 6) == 6 then 
                    xPlayer.removeInventoryItem("wool", 6)
                    xPlayer.addInventoryItem("fabric", 6)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 6 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 5 and xPlayer.canCarryItem('fabric', 5) and math.random(1, 5) == 5 then 
                    xPlayer.removeInventoryItem("wool", 5)
                    xPlayer.addInventoryItem("fabric", 5)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 5 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 4 and xPlayer.canCarryItem('fabric', 4) and math.random(1, 4) == 4 then 
                    xPlayer.removeInventoryItem("wool", 4)
                    xPlayer.addInventoryItem("fabric", 4)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 4 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 3 and xPlayer.canCarryItem('fabric', 3) and math.random(1, 3) == 3 then 
                    xPlayer.removeInventoryItem("wool", 3)
                    xPlayer.addInventoryItem("fabric", 3)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 3 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 2 and xPlayer.canCarryItem('fabric', 2) and math.random(1, 2) == 2 then 
                    xPlayer.removeInventoryItem("wool", 2)
                    xPlayer.addInventoryItem("fabric", 2)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 2 Vải", 5000, 'success')
                elseif xPlayer.getInventoryItem('wool').count >= 1 and xPlayer.canCarryItem('fabric', 1) and math.random(1, 1) == 1 then 
                    xPlayer.removeInventoryItem("wool", 1)
                    xPlayer.addInventoryItem("fabric", 1)
                    TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 1 Vải", 5000, 'success')
                else
                    TriggerClientEvent('qt-notify:Alert', _source, "ERROR", "Bạn cần 1 Bông Gòn hoặc đã đủ Vải trong túi", 5000, 'error')
                end
            else
                TriggerClientEvent('qt-notify:Alert', _source, "ERROR", "Bạn cần 1 Bông Gòn ", 5000, 'error')
            end
        end
    end)

RegisterNetEvent("esx_vai:quanao")
AddEventHandler("esx_vai:quanao", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local randomChance = math.random(1, 100)
    if xPlayer.getInventoryItem('fabric').count >= 5 then  
        if xPlayer.canCarryItem('clothe', 5) then 
            TriggerClientEvent("esx_daumo:donggoi", source)
            Citizen.Wait(15900)
        -- --TriggerEvent("api:randomItemSv", _source, 50, {"nhom","resin"}, math.random(1, 3))
            if xPlayer.canCarryItem('clothe', 5) and randomChance > 1 and randomChance < 100  then
                xPlayer.addInventoryItem("clothe", 5)
                xPlayer.removeInventoryItem("fabric", 5)
                TriggerClientEvent('qt-notify:Alert', _source, "Hệ Thống", "Bạn nhận được 5 bộ quần áo bởi 5 vải", 5000, 'success')
            end
        else
            TriggerClientEvent('qt-notify:Alert', _source, "ERROR", "Bạn cần 1 vải hoặc đã đủ quần áo trong túi", 5000, 'error')
        end
    else
        TriggerClientEvent('qt-notify:Alert', _source, "ERROR", "Bạn cần 1 vải hoặc đã quần áo trong túi", 5000, 'error')
    end
end) 
---------
RegisterNetEvent("esx_vai:sellquanao")
AddEventHandler("esx_vai:sellquanao", function(item, count)
    local _source = source
    local QAPrice = 400
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local QAQuantity = xPlayer.getInventoryItem('clothe').count

    if QAQuantity > 0  then
        xPlayer.addMoney(QAQuantity * QAPrice)
        xPlayer.removeInventoryItem('clothe', QAQuantity)
        TriggerClientEvent('qt-notify:Alert', xPlayer.source, "SUCCESS",'Bạn bán ' .. QAQuantity .. ' quần áo và nhận được <span style="color:#47cf73">' .. QAQuantity * QAPrice .. '$</span>', 5000, 'success')
        else
            TriggerClientEvent('qt-notify:Alert', xPlayer.source, "SUCCESS","Bạn không có quần áo để bán", 5000, 'error')
        end
    end)


