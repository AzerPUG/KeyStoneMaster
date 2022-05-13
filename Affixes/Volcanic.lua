if AZP == nil then AZP = {} end
if AZP.VersionControl == nil then AZP.VersionControl = {} end
if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end
if AZP.KeyStoneMaster.Volcanic == nil then AZP.KeyStoneMaster.Volcanic = {} end
if AZP.KeyStoneMaster.Volcanic.Events == nil then AZP.KeyStoneMaster.Volcanic.Events = {} end

local EventFrame = nil

local VolcanicData = {}
local TotHits, TotDamage = 0, 0

function AZP.KeyStoneMaster.Volcanic:OnLoadSelf()
    print("Volcanic Loaded!")
    EventFrame = CreateFrame("FRAME", nil)
    EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    EventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
    EventFrame:SetScript("OnEvent", function(...) AZP.KeyStoneMaster.Volcanic:OnEvent(...) end)
end

function AZP.KeyStoneMaster.Volcanic:CombatLogEventUnfiltered()
    local v1, combatEvent, v3, UnitGUID, casterName, v6, v7, destGUID, destName, v10, v11, spellID, spellName, v14, spellDamage, v16, v17, v18 = CombatLogGetCurrentEventInfo()
    if spellID == 209862 then
        if combatEvent == "SPELL_DAMAGE" then
            if VolcanicData[destGUID] == nil then VolcanicData[destGUID] = {Name = nil, TotHits = 0, TotDamage = 0} end
            VolcanicData[destGUID].Name = destName
            VolcanicData[destGUID].TotHits = VolcanicData[destGUID].TotHits + 1
            VolcanicData[destGUID].TotDamage = VolcanicData[destGUID].TotDamage + tonumber(spellDamage)
            local curFormatText = "%s stood in Volcanic: %d damage. %d total hits for %d total damage!"
            local curChatText = string.format(curFormatText, destName, tonumber(spellDamage), VolcanicData[destGUID].TotHits, VolcanicData[destGUID].TotDamage)
            print(curChatText)
        end
    end
end

function AZP.KeyStoneMaster.Volcanic:OnEvent(_, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        AZP.KeyStoneMaster.Volcanic:CombatLogEventUnfiltered()
    elseif event == "CHALLENGE_MODE_START" then
        
    -- elseif event == "CHALLENGE_MODE_COMPLETED" then
    --     SendChatMessage("Damage taken from not moving out of Volcanic:", PARTY, nil)
    --     for curGUID, PlayerData in pairs(VolcanicData) do
    --         local curFormatText = "%s: %d (%d hits)!"
    --         local curChatText = string.format(curFormatText, PlayerData.Name, PlayerData.TotDamage, PlayerData.TotHits)
    --         SendChatMessage(curChatText, PARTY, nil)
    --     end
    --     VolcanicData = {}
    end
end