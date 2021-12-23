if AZP == nil then AZP = {} end
if AZP.VersionControl == nil then AZP.VersionControl = {} end

AZP.VersionControl["KeyStoneMaster"] = 1
if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end
if AZP.KeyStoneMaster.Events == nil then AZP.KeyStoneMaster.Events = {} end

local KSMFrame, EventFrame, UpdateFrame = nil, nil, nil
local KeyFrames = {}

function AZP.KeyStoneMaster:OnLoadSelf()
    EventFrame = CreateFrame("FRAME", nil)
    EventFrame:RegisterEvent("VARIABLES_LOADED")
    EventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
    EventFrame:RegisterEvent("MYTHIC_PLUS_CURRENT_AFFIX_UPDATE")
    EventFrame:RegisterEvent("MYTHIC_PLUS_NEW_WEEKLY_RECORD")
    EventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
    EventFrame:SetScript("OnEvent", function(...) AZP.KeyStoneMaster:OnEvent(...) end)

    KSMFrame = CreateFrame("FRAME", nil, UIParent, "BackdropTemplate")
    KSMFrame:SetSize(425, 275)
    KSMFrame:SetPoint("CENTER", 0, 0)
    KSMFrame:EnableMouse(true)
    KSMFrame:SetMovable(true)
    KSMFrame:RegisterForDrag("LeftButton")
    KSMFrame:SetScript("OnDragStart", KSMFrame.StartMoving)
    KSMFrame:SetScript("OnDragStop", function() KSMFrame:StopMovingOrSizing() end)
    KSMFrame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 24,
        insets = { left = 5, right = 5, top = 5, bottom = 5 },
    })
    KSMFrame:SetBackdropColor(0.5, 0.5, 0.5, 1)

    KSMFrame.Header = KSMFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalHuge")
    KSMFrame.Header:SetSize(KSMFrame:GetWidth(), 25)
    KSMFrame.Header:SetPoint("TOP", 0, -10)
    KSMFrame.Header:SetText(string.format("|cFF00FFFFAzerPUG's KeyStoneMaster v%s|r", AZP.VersionControl["KeyStoneMaster"]))
    -- KSMFrame.SubHeader = KSMFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    -- KSMFrame.SubHeader:SetSize(KSMFrame:GetWidth(), 25)
    -- KSMFrame.SubHeader:SetPoint("TOP", KSMFrame.Header, "BOTTOM", 0, 0)
    -- KSMFrame.SubHeader:SetText("|cFF00FFFF - XXX - |r")

    KSMFrame.FramesHeader = CreateFrame("FRAME", nil, KSMFrame)
    KSMFrame.FramesHeader:SetSize(KSMFrame:GetWidth() - 10, 25)
    KSMFrame.FramesHeader:SetPoint("TOPLEFT", KSMFrame.Header, "BOTTOMLEFT", 0, -5)

    KSMFrame.FramesHeader.Name = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Name:SetSize(100, 25)
    KSMFrame.FramesHeader.Name:SetPoint("LEFT", 0, 0)
    KSMFrame.FramesHeader.Name:SetText("Name")

    KSMFrame.FramesHeader.Tyranical = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Tyranical:SetSize(100, 25)
    KSMFrame.FramesHeader.Tyranical:SetPoint("LEFT", KSMFrame.FramesHeader.Name, "RIGHT", 0, 0)
    KSMFrame.FramesHeader.Tyranical:SetText("Tyranical")

    KSMFrame.FramesHeader.Fortified = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Fortified:SetSize(100, 25)
    KSMFrame.FramesHeader.Fortified:SetPoint("LEFT", KSMFrame.FramesHeader.Tyranical, "RIGHT", 10, 0)
    KSMFrame.FramesHeader.Fortified:SetText("Fortified")

    KSMFrame.FramesHeader.Total = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Total:SetSize(50, 25)
    KSMFrame.FramesHeader.Total:SetPoint("LEFT", KSMFrame.FramesHeader.Fortified, "RIGHT", 10, 0)
    KSMFrame.FramesHeader.Total:SetText("Total")

    KSMFrame.FramesHeader.Percent = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Percent:SetSize(50, 25)
    KSMFrame.FramesHeader.Percent:SetPoint("LEFT", KSMFrame.FramesHeader.Total, "RIGHT", 0, 0)
    KSMFrame.FramesHeader.Percent:SetText("%")

    local KeyList = AZP.KeyStoneMaster.KeyList

    KeyFrames.Number = 0

    for ID, Info in pairs(KeyList) do
        local curFrame = CreateFrame("FRAME", nil, KSMFrame)
        curFrame:SetSize(KSMFrame:GetWidth() - 10, 25)
        curFrame:SetPoint("TOP", KSMFrame.FramesHeader, "BOTTOM", 0,  -25 * KeyFrames.Number)

        curFrame.Name = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.Name:SetSize(100, curFrame:GetHeight())
        curFrame.Name:SetPoint("LEFT", 0, 0)
        curFrame.Name:SetText(string.format("|cFF00FFFF%s|r", Info.Name))

        curFrame.TBScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.TBScore:SetSize(50, curFrame:GetHeight())
        curFrame.TBScore:SetPoint("LEFT", curFrame.Name, "RIGHT", 0, 0)
        curFrame.TBScore:SetText("|cFFFF0000??|r")

        curFrame.TMScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.TMScore:SetSize(50, curFrame:GetHeight())
        curFrame.TMScore:SetPoint("LEFT", curFrame.TBScore, "RIGHT", 0, 0)
        curFrame.TMScore:SetText("|cFFFF0000??|r")

        curFrame.FBScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.FBScore:SetSize(50, curFrame:GetHeight())
        curFrame.FBScore:SetPoint("LEFT", curFrame.TMScore, "RIGHT", 10, 0)
        curFrame.FBScore:SetText("|cFFFF0000??|r")

        curFrame.FMScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.FMScore:SetSize(50, curFrame:GetHeight())
        curFrame.FMScore:SetPoint("LEFT", curFrame.FBScore, "RIGHT", 0, 0)
        curFrame.FMScore:SetText("|cFFFF0000??|r")

        curFrame.TotalScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.TotalScore:SetSize(50, curFrame:GetHeight())
        curFrame.TotalScore:SetPoint("LEFT", curFrame.FMScore, "RIGHT", 10, 0)
        curFrame.TotalScore:SetText("|cFFFF0000??|r")

        curFrame.Percentage = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.Percentage:SetSize(50, curFrame:GetHeight())
        curFrame.Percentage:SetPoint("LEFT", curFrame.TotalScore, "RIGHT", 0, 0)
        curFrame.Percentage:SetText("|cFFFF0000??|r")

        KeyFrames.Number = KeyFrames.Number + 1
        KeyFrames[ID] = curFrame
    end

    KSMFrame.CloseButton = CreateFrame("Button", nil, KSMFrame, "UIPanelCloseButton, BackDropTemplate")
    KSMFrame.CloseButton:SetSize(24, 24)
    KSMFrame.CloseButton:SetPoint("TOPRIGHT", KSMFrame, "TOPRIGHT", -3, -3)
    KSMFrame.CloseButton:SetScript("OnClick", function() KSMFrame:Hide() end)
end

function AZP.KeyStoneMaster.GetAllKeyStoneValues()
    local curGUID = UnitGUID("PLAYER")
    local allCurInfo = {}
    local totalScore = 0
    allCurInfo.Max = 0
    allCurInfo.Min = 1000

    local KeyList = AZP.KeyStoneMaster.KeyList
    for ID, Info in pairs(KeyList) do
        allCurInfo[ID] = {}
        allCurInfo[ID].Percentage = 0
        allCurInfo[ID].Score = 0
        allCurInfo[ID].Color = ""
        local curInfo = C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(ID)
        if curInfo ~= nil then
            if curInfo[1] ~= nil then allCurInfo[ID][curInfo[1].name] = {Score = curInfo[1].score, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end
            if curInfo[2] ~= nil then allCurInfo[ID][curInfo[2].name] = {Score = curInfo[2].score, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end
        end
        
        if allCurInfo[ID].Tyranical == nil then allCurInfo[ID].Tyranical = {Score = 0, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end
        if allCurInfo[ID].Fortified == nil then allCurInfo[ID].Fortified = {Score = 0, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end

        if allCurInfo[ID].Tyranical.Score > allCurInfo[ID].Fortified.Score then
            allCurInfo[ID].Tyranical.Color = "FF00FF00"
            allCurInfo[ID].Tyranical.Multiplier = 1.5
        else
            allCurInfo[ID].Fortified.Color = "FF00FF00"
            allCurInfo[ID].Fortified.Multiplier = 1.5
        end
        allCurInfo[ID].Fortified.MScore = allCurInfo[ID].Fortified.Score * allCurInfo[ID].Fortified.Multiplier
        allCurInfo[ID].Tyranical.MScore = allCurInfo[ID].Tyranical.Score * allCurInfo[ID].Tyranical.Multiplier
        allCurInfo[ID].Score = allCurInfo[ID].Fortified.MScore + allCurInfo[ID].Tyranical.MScore

        local curInfoID = allCurInfo[ID]
        local curTyr = curInfoID.Tyranical
        local curFort = curInfoID.Fortified
        KeyFrames[ID].TBScore:SetText(string.format("|c%s%s|r", curTyr.Color, curTyr.Score))
        KeyFrames[ID].TMScore:SetText(string.format("|c%s(%.1f)|r", curTyr.Color, curTyr.MScore))
        KeyFrames[ID].FBScore:SetText(string.format("|c%s%s|r", curFort.Color, curFort.Score))
        KeyFrames[ID].FMScore:SetText(string.format("|c%s(%.1f)|r", curFort.Color, curFort.MScore))

        local curTotScore = curTyr.MScore + curFort.MScore
        totalScore = totalScore + curTotScore
    end

    for ID, Info in pairs(KeyList) do
        local curPerc = (allCurInfo[ID].Tyranical.MScore + allCurInfo[ID].Fortified.MScore) / totalScore * 100
        allCurInfo[ID].Percentage = curPerc
        KeyFrames[ID].Percentage:SetText(string.format("|cFF00FFFF%.2f|r", curPerc))

        if allCurInfo.Max < allCurInfo[ID].Score then allCurInfo.Max = allCurInfo[ID].Score end
        if allCurInfo.Min > allCurInfo[ID].Score then allCurInfo.Min = allCurInfo[ID].Score end
    end

    for ID, Info in pairs(KeyList) do
        local GradColor = AZP.KeyStoneMaster:CalculateGradientColor(allCurInfo.Min, allCurInfo.Max, allCurInfo[ID].Score, ID)
        KeyFrames[ID].TotalScore:SetText(string.format("|cFF%s%.1f|r", GradColor, allCurInfo[ID].Score))
    end

    AZPKSMInfo[curGUID] = allCurInfo
end

function AZP.KeyStoneMaster:CalculateGradientColor(Min, Max, Cur, ID)
    local DeltaMax = Max - Min
    local DeltaCur = Cur - Min
    local Quotient = DeltaCur / DeltaMax
    local Quotient256 = Quotient * 256
    local curRed, curGreen = nil, nil

    if DeltaCur  < (DeltaMax / 2) then curRed = "FF" curGreen = AZP.KeyStoneMaster.CalculateRGBToHex(Quotient256, ID) end
    if DeltaCur == (DeltaMax / 2) then curRed = "FF" curGreen = "FF" end
    if DeltaCur  > (DeltaMax / 2) then curRed = AZP.KeyStoneMaster.CalculateRGBToHex(256 - Quotient256, ID) curGreen = "FF" end

    return string.format("%s%s00", curRed, curGreen)
end

function AZP.KeyStoneMaster.CalculateRGBToHex(RGB, ID)
    local FirstRGB = math.floor(RGB / 16)
    local SecondRGB = math.floor(RGB % 16)
    local FirstHex, SecondHex = nil, nil

        if FirstRGB  < 10 then FirstHex = FirstRGB
    elseif FirstRGB == 10 then FirstHex = "A"
    elseif FirstRGB == 11 then FirstHex = "B"
    elseif FirstRGB == 12 then FirstHex = "C"
    elseif FirstRGB == 13 then FirstHex = "D"
    elseif FirstRGB == 14 then FirstHex = "E"
    elseif FirstRGB == 15 then FirstHex = "F" end

        if SecondRGB  < 10 then SecondHex = SecondRGB
    elseif SecondRGB == 10 then SecondHex = "A"
    elseif SecondRGB == 11 then SecondHex = "B"
    elseif SecondRGB == 12 then SecondHex = "C"
    elseif SecondRGB == 13 then SecondHex = "D"
    elseif SecondRGB == 14 then SecondHex = "E"
    elseif SecondRGB == 15 then SecondHex = "F" end

    print(ID, RGB, FirstRGB, SecondRGB, FirstHex, SecondHex)

    local Hex = FirstHex .. SecondHex

    return Hex
end

function AZP.KeyStoneMaster:OnEvent(self, event, ...)
    if event == "VARIABLES_LOADED" then
        if AZPKSMInfo == nil then AZPKSMInfo = {} AZPKSMInfo[UnitGUID("PLAYER")] = {} end
        C_Timer.After(5, function() AZP.KeyStoneMaster.GetAllKeyStoneValues() end)
    elseif event == "CHALLENGE_MODE_COMPLETED" then
        print("Event: CHALLENGE_MODE_COMPLETED")
        C_Timer.After(5, function() AZP.KeyStoneMaster.GetAllKeyStoneValues() end)
    elseif event == "MYTHIC_PLUS_CURRENT_AFFIX_UPDATE" then
        print("Event: MYTHIC_PLUS_CURRENT_AFFIX_UPDATE")
        C_Timer.After(5, function() AZP.KeyStoneMaster.GetAllKeyStoneValues() end)
    elseif event == "MYTHIC_PLUS_NEW_WEEKLY_RECORD" then
        print("Event: MYTHIC_PLUS_NEW_WEEKLY_RECORD")
        C_Timer.After(5, function() AZP.KeyStoneMaster.GetAllKeyStoneValues() end)
    end
end



-- vars loaded
-- if AZPKSMInfo does not exist then {}
-- if AZPKSMInfo[GUID] does not exist then {}
-- reload values and data, so that it is easy to bring in new functionality ;)

AZP.KeyStoneMaster:OnLoadSelf()