if AZP == nil then AZP = {} end
if AZP.VersionControl == nil then AZP.VersionControl = {} end

if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end
if AZP.KeyStoneMaster.Events == nil then AZP.KeyStoneMaster.Events = {} end
if AZP.KeyStoneMaster.EncJournal == nil then AZP.KeyStoneMaster.EncJournal = {} end
local OGSetItem = nil

local curWantedMythicLevel = 1
local MythicLevelOptions = {  1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,  15,}
local MythicRewardRankD  = {  1,   1,   2,   3,   4,   5,   5,   6,   6,   7,   7,   8,   8,   9,   9,}
local MythicILevelsD     = {236, 236, 239, 242, 246, 249, 249, 252, 252, 255, 255, 259, 259, 262, 262,}
local MythicRewardRankV  = {  0,   4,   4,   4,   5,   5,   6,   7,   7,   8,   9,  10,  10,  11,  12,}
local MythicILevelsV     = {  0, 252, 252, 252, 255, 255, 259, 262, 262, 265, 268, 272, 272, 275, 278,}

--      M+      D/12    DiLevel     V/12    ViLevel
--      M+ - Dungeon - Vault
--      +15 - 9/12 (262) - 12/12 (278)

function AZP.KeyStoneMaster.EncJournal:OnLoad()
    OGSetItem = GameTooltip.SetHyperlink
    GameTooltip.SetHyperlink = function(self, itemlink, ...)
        local newLink = AZP.KeyStoneMaster.EncJournal:ToolTips(itemlink)
        if newLink ~= nil then
            itemlink = newLink
        end
        OGSetItem(self, itemlink, ...)
    end

    C_Timer.After(5,
        function()
            UIParentLoadAddOn("Blizzard_EncounterJournal")

            RankLevelDropDown = CreateFrame("Button", nil, EncounterJournal, "UIDropDownMenuTemplate")
            RankLevelDropDown:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", -50, -2)

            UIDropDownMenu_SetWidth(RankLevelDropDown, 225)

            UIDropDownMenu_Initialize(RankLevelDropDown, function(self, level, menuList)
                local info = UIDropDownMenu_CreateInfo()
                info.func = AZP.KeyStoneMaster.EncJournal.DropDownStuff
                for i = 1, #MythicLevelOptions do
                    local levelSection, dungeonSection, vaultSection = nil, nil, nil
                    local optionalIndent, optionalRankIndent = "", ""
                    if i < 10 then optionalIndent = "  " end
                    if MythicRewardRankV[i] < 10 then optionalRankIndent = "  " end

                    levelSection = string.format("%sM+%d", optionalIndent, MythicLevelOptions[i])
                    dungeonSection = string.format("%d/12 (%d)", MythicRewardRankD[i], MythicILevelsD[i])
                    if i == 1 then
                        vaultSection = "           N/A"
                    else
                        vaultSection = string.format("%s%d/12 (%d)", optionalRankIndent, MythicRewardRankV[i], MythicILevelsV[i])
                    end

                    --info.text = string.format("%s+%d  -  %d/12 (%d)  -  %s%d/12 (%d)", optionalIndent, MythicLevelOptions[i], MythicRewardRankD[i], MythicILevelsD[i], optionalRankIndent, MythicRewardRankV[i], MythicILevelsV[i])
                    info.text = string.format("%s  -  %s  -  %s", levelSection, dungeonSection, vaultSection)
                    info.arg1 = MythicLevelOptions[i]
                    info.arg2 = string.format("%s  -  %s  -  %s", levelSection, dungeonSection, vaultSection)
                    UIDropDownMenu_AddButton(info, 1)
                end
            end)

            local v1, v2, v3, v4, v5 = EncounterJournalSearchBox:GetPoint()
            EncounterJournalSearchBox:SetPoint(v1, v2, v3, v4, v5 - 12)

            AZP.KeyStoneMaster.EncJournal:DropDownStuff(1, "  M+1  -  1/12 (236)  -             N/A")
        end)
end

function AZP.KeyStoneMaster.EncJournal:DropDownStuff(MLevel, fullString)
    curWantedMythicLevel = MythicRewardRankD[MLevel]
    CloseDropDownMenus()
    UIDropDownMenu_SetText(RankLevelDropDown, fullString)
end

function AZP.KeyStoneMaster.EncJournal:ToolTips(itemLink)

    if itemLink ~= nil then
        local itemID = select(2, strsplit(":", itemLink))
        itemID = tonumber(itemID)

        local rankBonusID, iLevelBonusID = 0, 0

        for GroupID, GroupData in pairs(AZP.KeyStoneMaster.ItemIDs) do
            for _, GroupEntry in ipairs(GroupData) do
                if tContains(GroupEntry.ItemIDs, itemID) then
                    rankBonusID = GroupEntry.BonusIDs[curWantedMythicLevel]
                    iLevelBonusID = GroupEntry.iLevelBonusIDs[curWantedMythicLevel]
                end
            end
        end

        print(string.format("Unchanged Link %s", itemLink:gsub("|", "||")))
        -- 50+ Unchanged Link |cffa335ee|Hitem:142215:    :::::::60:102::23:1:3524:1:28:1169:::::|h[Wine-Stained Mantle]|h|r
        -- 288  Equipped Link |cffa335ee|Hitem:142215:6202:::::::60:102::35:8:7359:8281:8765:8136:8138:6652:3167:6646::::::|h[Wine-Stained Mantle]|h|r
        -- 128   Changed Link |cffa335ee|Hitem:142215:    :::::::60:102::33:3:8273:1550:6646:1:28:1180:::::|h[Wine-Stained Mantle]|h|r




        -- 50+ Unchanged Link :1:3524
        -- 288  Equipped Link :8:7359:8281:8765:8136:8138:6652:3167:6646
        -- 128   Changed Link :3:8273:1550:6646

        -- 8281 (Rank 9/12)
        -- 3167 (iLVL 288)
        local replaceString = string.format(":33:3:%d:%d:6646:", rankBonusID, iLevelBonusID)
        --local replaceString = ":23:2:3170:6646:"
        local changedItemLink = itemLink:gsub(":23:1:3524:", replaceString)
        print(string.format("Changed Link %s", changedItemLink:gsub("|", "||")))

        -- local replaceString = string.format(":35:5:%d:%d:6652:3167:6646:", rankBonusID, iLevelBonusID)
        -- local changedItemLink = itemLink:gsub(":23:1:3524:", replaceString)
        return changedItemLink
    end
    return nil
end

AZP.KeyStoneMaster.EncJournal:OnLoad()