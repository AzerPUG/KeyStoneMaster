if AZP == nil then AZP = {} end
if AZP.VersionControl == nil then AZP.VersionControl = {} end

AZP.VersionControl["KeyStoneMaster"] = 13
if AZP.KeyStoneMaster == nil then AZP.KeyStoneMaster = {} end
if AZP.KeyStoneMaster.Events == nil then AZP.KeyStoneMaster.Events = {} end

local KSMFrame, EventFrame = nil, nil
local KeyFrames = {}

local LoadingBarTicker = 0
local ShowLoadingBar = false

function AZP.KeyStoneMaster:OnLoadSelf()
    EventFrame = CreateFrame("FRAME", nil)
    EventFrame:RegisterEvent("VARIABLES_LOADED")
    EventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
    EventFrame:RegisterEvent("MYTHIC_PLUS_CURRENT_AFFIX_UPDATE")
    EventFrame:RegisterEvent("MYTHIC_PLUS_NEW_WEEKLY_RECORD")
    EventFrame:RegisterEvent("PLAYER_LOGIN")
    EventFrame:SetScript("OnEvent", function(...) AZP.KeyStoneMaster:OnEvent(...) end)

    KSMFrame = CreateFrame("FRAME", nil, UIParent, "BackdropTemplate")
    KSMFrame:SetPoint("CENTER", 0, 0)
    KSMFrame:EnableMouse(true)
    KSMFrame:SetMovable(true)
    KSMFrame:RegisterForDrag("LeftButton")
    KSMFrame:SetScript("OnDragStart", KSMFrame.StartMoving)
    KSMFrame:SetScript("OnDragStop", function() KSMFrame:StopMovingOrSizing() AZP.KeyStoneMaster:SaveMainFrameLocation() end)
    KSMFrame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 24,
        insets = { left = 5, right = 5, top = 5, bottom = 5 },
    })
    KSMFrame:SetBackdropColor(0.5, 0.5, 0.5, 1)

    KSMFrame.Header = KSMFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalHuge")
    KSMFrame.Header:SetPoint("TOP", 0, -10)
    KSMFrame.Header:SetText(string.format("|cFF00FFFFAzerPUG's KeyStoneMaster v%s|r", AZP.VersionControl["KeyStoneMaster"]))

    KSMFrame.FramesHeader = CreateFrame("FRAME", nil, KSMFrame)
    KSMFrame.FramesHeader:SetPoint("TOPLEFT", KSMFrame.Header, "BOTTOMLEFT", 0, -5)

    KSMFrame.FramesHeader.Name = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Name:SetSize(100, 25)
    KSMFrame.FramesHeader.Name:SetPoint("LEFT", 0, 0)
    KSMFrame.FramesHeader.Name:SetText("Name")

    KSMFrame.FramesHeader.Tyrannical = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Tyrannical:SetPoint("LEFT", KSMFrame.FramesHeader.Name, "RIGHT", 0, 0)
    KSMFrame.FramesHeader.Tyrannical:SetText("Tyrannical")

    KSMFrame.FramesHeader.Fortified = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Fortified:SetPoint("LEFT", KSMFrame.FramesHeader.Tyrannical, "RIGHT", 10, 0)
    KSMFrame.FramesHeader.Fortified:SetText("Fortified")

    KSMFrame.FramesHeader.Total = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Total:SetSize(50, 25)
    KSMFrame.FramesHeader.Total:SetPoint("LEFT", KSMFrame.FramesHeader.Fortified, "RIGHT", 10, 0)
    KSMFrame.FramesHeader.Total:SetText("Total")

    KSMFrame.FramesHeader.Percent = KSMFrame.FramesHeader:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.FramesHeader.Percent:SetSize(50, 25)
    KSMFrame.FramesHeader.Percent:SetPoint("LEFT", KSMFrame.FramesHeader.Total, "RIGHT", 0, 0)
    KSMFrame.FramesHeader.Percent:SetText("%")

    KSMFrame.TotalFrame = CreateFrame("FRAME", nil, KSMFrame)
    KSMFrame.TotalFrame:SetPoint("TOP", KSMFrame.FramesHeader, "BOTTOM", 0, 0)

    KSMFrame.TotalFrame.Name = KSMFrame.TotalFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.TotalFrame.Name:SetSize(100, KSMFrame.TotalFrame:GetHeight())
    KSMFrame.TotalFrame.Name:SetPoint("LEFT", 0, 0)
    KSMFrame.TotalFrame.Name:SetText("|cFF00FFFFTotal|r")

    KSMFrame.TotalFrame.TScore = KSMFrame.TotalFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.TotalFrame.TScore:SetPoint("LEFT", KSMFrame.TotalFrame.Name, "RIGHT", 0, 0)
    KSMFrame.TotalFrame.TScore:SetText("|cFF00FFFF??|r")

    KSMFrame.TotalFrame.FScore = KSMFrame.TotalFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.TotalFrame.FScore:SetPoint("LEFT", KSMFrame.TotalFrame.TScore, "RIGHT", 10, 0)
    KSMFrame.TotalFrame.FScore:SetText("|cFF00FFFF??|r")

    KSMFrame.TotalFrame.TotalScore = KSMFrame.TotalFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.TotalFrame.TotalScore:SetSize(100, KSMFrame.TotalFrame:GetHeight())
    KSMFrame.TotalFrame.TotalScore:SetPoint("LEFT", KSMFrame.TotalFrame.FScore, "RIGHT", 10, 0)
    KSMFrame.TotalFrame.TotalScore:SetText("|cFF00FFFF??|r")

    KSMFrame.CloseButton = CreateFrame("Button", nil, KSMFrame, "UIPanelCloseButton")
    KSMFrame.CloseButton:SetSize(24, 24)
    KSMFrame.CloseButton:SetPoint("TOPRIGHT", KSMFrame, "TOPRIGHT", -3, -3)
    KSMFrame.CloseButton:SetScript("OnClick", function() AZP.KeyStoneMaster:ToggleScoreFrame() end)

    KSMFrame.LoadingBar = CreateFrame("StatusBar", nil, KSMFrame)
    KSMFrame.LoadingBar:SetPoint("CENTER", 0, 0)
    KSMFrame.LoadingBar:SetStatusBarTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
    KSMFrame.LoadingBar:SetMinMaxValues(0, 10)
    KSMFrame.LoadingBar:SetValue(0)
    KSMFrame.LoadingBar:SetStatusBarColor(0, 1, 1)
    KSMFrame.LoadingBar:SetFrameStrata("HIGH")

    KSMFrame.LoadingBar.BG = KSMFrame.LoadingBar:CreateTexture(nil, "BACKGROUND")
    KSMFrame.LoadingBar.BG:SetTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
    KSMFrame.LoadingBar.BG:SetAllPoints(true)
    KSMFrame.LoadingBar.BG:SetVertexColor(0.25, 0.25, 0.25)

    KSMFrame.LoadingBar.Text = KSMFrame.LoadingBar:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
    KSMFrame.LoadingBar.Text:SetSize(KSMFrame.LoadingBar:GetWidth(), KSMFrame.LoadingBar:GetHeight())
    KSMFrame.LoadingBar.Text:SetPoint("CENTER", 0, 0)
    KSMFrame.LoadingBar.Text:SetText("Loading Scores...")
    KSMFrame.LoadingBar.Text:SetJustifyH("CENTER")
    KSMFrame.LoadingBar.Text:SetJustifyV("CENTER")

    KSMFrame.LoadingBar:Hide()

    PVEFrame.ToggleOptionsButton = CreateFrame("BUTTON", nil, PVEFrame)
    PVEFrame.ToggleOptionsButton:SetPoint("RIGHT", PVEFrameCloseButton, "LEFT", 5, 0)
    PVEFrame.ToggleOptionsButton:SetSize(PVEFrameCloseButton:GetWidth(), PVEFrameCloseButton:GetHeight())
    PVEFrame.ToggleOptionsButton:SetScript("OnMouseDown", function() AZP.KeyStoneMaster:ToggleOptionsFrame() end)
    PVEFrame.ToggleOptionsButton:SetFrameStrata("HIGH")
    PVEFrame.ToggleOptionsButton:SetFrameLevel(10)
    PVEFrame.ToggleOptionsButton:SetScale(0.75)

    PVEFrame.ToggleOptionsButton.BG = PVEFrame.ToggleOptionsButton:CreateTexture(nil, "BACKGROUND")
    PVEFrame.ToggleOptionsButton.BG:SetTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
    PVEFrame.ToggleOptionsButton.BG:SetAllPoints(true)
    PVEFrame.ToggleOptionsButton.BG:SetVertexColor(1, 1, 1)

    PVEFrame.AZPKSMOptions = CreateFrame("FRAME", nil, PVEFrame, "BackdropTemplate")
    PVEFrame.AZPKSMOptions:SetPoint("TOPLEFT", PVEFrame, "TOPRIGHT", 0, 0)
    PVEFrame.AZPKSMOptions:SetSize(300, 425)
    PVEFrame.AZPKSMOptions:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 24,
        insets = { left = 5, right = 5, top = 5, bottom = 5 },
    })
    PVEFrame.AZPKSMOptions:SetBackdropColor(0.5, 0.5, 0.5, 1)

    PVEFrame.AZPKSMOptions.Header = PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormalHuge")
    PVEFrame.AZPKSMOptions.Header:SetSize(PVEFrame.AZPKSMOptions:GetWidth(), 50)
    PVEFrame.AZPKSMOptions.Header:SetPoint("TOP", 0, -10)
    PVEFrame.AZPKSMOptions.Header:SetText(string.format("|cFF00FFFFAzerPUG's\nKeyStoneMaster v%s|r", AZP.VersionControl["KeyStoneMaster"]))

    PVEFrame.AZPKSMOptions.SubHeader = PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormalLarge")
    PVEFrame.AZPKSMOptions.SubHeader:SetSize(PVEFrame.AZPKSMOptions:GetWidth(), 16)
    PVEFrame.AZPKSMOptions.SubHeader:SetPoint("TOP", PVEFrame.AZPKSMOptions.Header, "BOTTOM", 0, 0)
    PVEFrame.AZPKSMOptions.SubHeader:SetText("M+ Scores Options Frame")

    PVEFrame.AZPKSMOptions.ScoresButton = CreateFrame("BUTTON", nil, PVEFrame.AZPKSMOptions, "UIPanelButtonTemplate")
    PVEFrame.AZPKSMOptions.ScoresButton:SetPoint("TOPLEFT", PVEFrame.AZPKSMOptions.SubHeader, "BOTTOMLEFT", 15, -10)
    PVEFrame.AZPKSMOptions.ScoresButton:SetSize(130, 25)
    PVEFrame.AZPKSMOptions.ScoresButton:SetText("Update Scores!")
    PVEFrame.AZPKSMOptions.ScoresButton:SetScript("OnMouseDown", function() ShowLoadingBar = true AZP.KeyStoneMaster.MPlusUpdateScores() end)

    PVEFrame.AZPKSMOptions.ToggleScoreFrameButton = CreateFrame("BUTTON", nil, PVEFrame.AZPKSMOptions, "UIPanelButtonTemplate")
    PVEFrame.AZPKSMOptions.ToggleScoreFrameButton:SetPoint("LEFT", PVEFrame.AZPKSMOptions.ScoresButton, "RIGHT", 10, 0)
    PVEFrame.AZPKSMOptions.ToggleScoreFrameButton:SetSize(130, 25)
    PVEFrame.AZPKSMOptions.ToggleScoreFrameButton:SetText("Toggle ScoreFrame!")
    PVEFrame.AZPKSMOptions.ToggleScoreFrameButton:SetScript("OnMouseDown", function() AZP.KeyStoneMaster:ToggleScoreFrame() end)

    PVEFrame.AZPKSMOptions.ToggleAttachementButton = CreateFrame("BUTTON", nil, PVEFrame.AZPKSMOptions, "UIPanelButtonTemplate")
    PVEFrame.AZPKSMOptions.ToggleAttachementButton:SetPoint("TOP", PVEFrame.AZPKSMOptions.ToggleScoreFrameButton, "BOTTOM", 0, -10)
    PVEFrame.AZPKSMOptions.ToggleAttachementButton:SetSize(130, 25)
    PVEFrame.AZPKSMOptions.ToggleAttachementButton:SetText("Toggle Attachment!")
    PVEFrame.AZPKSMOptions.ToggleAttachementButton:SetScript("OnMouseDown", function() AZP.KeyStoneMaster:ToggleAttachment() end)

    PVEFrame.AZPKSMOptions.PopUpCheckBox = CreateFrame("CheckButton", nil, PVEFrame.AZPKSMOptions, "ChatConfigCheckButtonTemplate")
    PVEFrame.AZPKSMOptions.PopUpCheckBox:SetSize(25, 25)
    PVEFrame.AZPKSMOptions.PopUpCheckBox:SetPoint("TOPLEFT", PVEFrame.AZPKSMOptions.ToggleAttachementButton, "BOTTOMLEFT", -40, -15)
    PVEFrame.AZPKSMOptions.PopUpCheckBox:SetHitRectInsets(0, 0, 0, 0)

    PVEFrame.AZPKSMOptions.PopUpCheckBox:SetScript("OnClick", function()
        if PVEFrame.AZPKSMOptions.PopUpCheckBox:GetChecked() == true then
            AZPKSMAutoPopUp = true
        elseif PVEFrame.AZPKSMOptions.PopUpCheckBox:GetChecked() == false then
            AZPKSMAutoPopUp = false
        end
    end)

    PVEFrame.AZPKSMOptions.PopUpLabel= PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormal")
    PVEFrame.AZPKSMOptions.PopUpLabel:SetSize(150, 75)
    PVEFrame.AZPKSMOptions.PopUpLabel:SetPoint("LEFT", PVEFrame.AZPKSMOptions.PopUpCheckBox, "RIGHT", 2, 0)
    PVEFrame.AZPKSMOptions.PopUpLabel:SetText("Auto PopUp After Dungeon!\nOnly on Detached ScoreFrame!")

    PVEFrame.AZPKSMOptions.BaseScoreCheckBox = CreateFrame("CheckButton", nil, PVEFrame.AZPKSMOptions, "ChatConfigCheckButtonTemplate")
    PVEFrame.AZPKSMOptions.BaseScoreCheckBox:SetSize(25, 25)
    PVEFrame.AZPKSMOptions.BaseScoreCheckBox:SetPoint("TOP", PVEFrame.AZPKSMOptions.PopUpCheckBox, "BOTTOM", 0, -10)
    PVEFrame.AZPKSMOptions.BaseScoreCheckBox:SetHitRectInsets(0, 0, 0, 0)

    PVEFrame.AZPKSMOptions.BaseScoreCheckBox:SetScript("OnClick", function()
        if PVEFrame.AZPKSMOptions.BaseScoreCheckBox:GetChecked() == true then
            AZPKSMBaseScore = true
        elseif PVEFrame.AZPKSMOptions.BaseScoreCheckBox:GetChecked() == false then
            AZPKSMBaseScore = false
        end
        -- Give popup for user needing to reload!
    end)

    PVEFrame.AZPKSMOptions.BaseScoreLabel= PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormal")
    PVEFrame.AZPKSMOptions.BaseScoreLabel:SetSize(150, 75)
    PVEFrame.AZPKSMOptions.BaseScoreLabel:SetPoint("LEFT", PVEFrame.AZPKSMOptions.BaseScoreCheckBox, "RIGHT", 2, 0)
    PVEFrame.AZPKSMOptions.BaseScoreLabel:SetText("Show base scores.\nRequires Reload!")

    PVEFrame.AZPKSMOptions.ScoreDisclaimer = PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormal")
    PVEFrame.AZPKSMOptions.ScoreDisclaimer:SetSize(PVEFrame.AZPKSMOptions:GetWidth(), 75)
    PVEFrame.AZPKSMOptions.ScoreDisclaimer:SetPoint("BOTTOM", PVEFrame.AZPKSMOptions, "BOTTOM", 2, 0)
    PVEFrame.AZPKSMOptions.ScoreDisclaimer:SetText("|cFFFF0000DISCLAIMER!\nThe API sometimes returns scores not\nmatching the native displayed scores.\nDue to this, scores in this addon could be\noff by up to 0.5 compared to displayed scores.|r")

    PVEFrame.AZPKSMOptions.ComingSoonDisclaimer = PVEFrame.AZPKSMOptions:CreateFontString("PVEFrame.AZPKSMOptions", "ARTWORK", "GameFontNormalLarge")
    PVEFrame.AZPKSMOptions.ComingSoonDisclaimer:SetSize(PVEFrame.AZPKSMOptions:GetWidth(), 75)
    PVEFrame.AZPKSMOptions.ComingSoonDisclaimer:SetPoint("BOTTOM", PVEFrame.AZPKSMOptions.ScoreDisclaimer, "TOP", 0, 50)
    PVEFrame.AZPKSMOptions.ComingSoonDisclaimer:SetText("|cFF00FFFFMore options coming Soon™!|r")

    PVEFrame.AZPKSMOptions.CloseButton = CreateFrame("Button", nil, PVEFrame.AZPKSMOptions, "UIPanelCloseButton")
    PVEFrame.AZPKSMOptions.CloseButton:SetSize(24, 24)
    PVEFrame.AZPKSMOptions.CloseButton:SetPoint("TOPRIGHT", PVEFrame.AZPKSMOptions, "TOPRIGHT", -3, -3)
    PVEFrame.AZPKSMOptions.CloseButton:SetScript("OnClick", function() AZP.KeyStoneMaster:ToggleOptionsFrame() end)
end

function AZP.KeyStoneMaster:CreateScoresFrame()
    KSMFrame:SetSize(395, 350)

    if AZPKSMBaseScore == true then
        KSMFrame:SetWidth(KSMFrame:GetWidth() + 30)
        KSMFrame.FramesHeader.Tyrannical:SetSize(100, 25)
        KSMFrame.FramesHeader.Fortified:SetSize(100, 25)
        KSMFrame.TotalFrame.TScore:SetSize(100, KSMFrame.TotalFrame:GetHeight())
        KSMFrame.TotalFrame.FScore:SetSize(100, KSMFrame.TotalFrame:GetHeight())
    elseif AZPKSMBaseScore == false then
        KSMFrame.FramesHeader.Tyrannical:SetSize(85, 25)
        KSMFrame.FramesHeader.Fortified:SetSize(85, 25)
        KSMFrame.TotalFrame.TScore:SetSize(85, KSMFrame.TotalFrame:GetHeight())
        KSMFrame.TotalFrame.FScore:SetSize(85, KSMFrame.TotalFrame:GetHeight())
    end

    KSMFrame.Header:SetSize(KSMFrame:GetWidth(), 25)
    KSMFrame.FramesHeader:SetSize(KSMFrame:GetWidth() - 10, 25)
    KSMFrame.TotalFrame:SetSize(KSMFrame:GetWidth() - 10, 25)
    KSMFrame.LoadingBar:SetSize(KSMFrame:GetWidth() * 0.8, 35)

    local KeyList = AZP.KeyStoneMaster.KeyList
    KeyFrames.Number = 0

    for ID, Info in pairs(KeyList) do
        local curFrame = CreateFrame("FRAME", nil, KSMFrame)
        curFrame:SetSize(KSMFrame:GetWidth() - 10, 25)
        curFrame:SetPoint("TOP", KSMFrame.TotalFrame, "BOTTOM", 0, -25 * KeyFrames.Number)

        curFrame.Name = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormalLarge")
        curFrame.Name:SetSize(100, curFrame:GetHeight())
        curFrame.Name:SetPoint("LEFT", 0, 0)
        curFrame.Name:SetText(string.format("|cFF00FFFF%s|r", Info.Name))

        curFrame.TBScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.TBScore:SetPoint("LEFT", curFrame.Name, "RIGHT", 0, 0)
        curFrame.TBScore:SetText("|cFFFF0000??|r")

        curFrame.TMScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.TMScore:SetText("|cFFFF0000??|r")

        curFrame.FBScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.FBScore:SetPoint("LEFT", curFrame.TMScore, "RIGHT", 10, 0)
        curFrame.FBScore:SetText("|cFFFF0000??|r")

        curFrame.FMScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.FMScore:SetText("|cFFFF0000??|r")

        curFrame.TotalScore = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.TotalScore:SetSize(50, curFrame:GetHeight())
        curFrame.TotalScore:SetPoint("LEFT", curFrame.FMScore, "RIGHT", 10, 0)
        curFrame.TotalScore:SetText("|cFFFF0000??|r")

        curFrame.Percentage = curFrame:CreateFontString("KSMFrame", "ARTWORK", "GameFontNormal")
        curFrame.Percentage:SetSize(50, curFrame:GetHeight())
        curFrame.Percentage:SetPoint("LEFT", curFrame.TotalScore, "RIGHT", 0, 0)
        curFrame.Percentage:SetText("|cFFFF0000??|r")

        if AZPKSMBaseScore == true then
            curFrame.TBScore:SetSize(50, curFrame:GetHeight())
            curFrame.TMScore:SetPoint("LEFT", curFrame.Name, "RIGHT", 50, 0)
            curFrame.TMScore:SetSize(50, curFrame:GetHeight())
            curFrame.FBScore:SetSize(50, curFrame:GetHeight())
            curFrame.FMScore:SetPoint("LEFT", curFrame.TMScore, "RIGHT", 50, 0)
            curFrame.FMScore:SetSize(50, curFrame:GetHeight())
        elseif AZPKSMBaseScore == false then
            curFrame.TBScore:SetSize(0, curFrame:GetHeight())
            curFrame.TMScore:SetPoint("LEFT", curFrame.Name, "RIGHT", 0, 0)
            curFrame.TMScore:SetSize(85, curFrame:GetHeight())
            curFrame.FBScore:SetSize(0, curFrame:GetHeight())
            curFrame.FMScore:SetPoint("LEFT", curFrame.TMScore, "RIGHT", 10, 0)
            curFrame.FMScore:SetSize(85, curFrame:GetHeight())
        end

        KeyFrames.Number = KeyFrames.Number + 1
        KeyFrames[ID] = curFrame
    end
end

function AZP.KeyStoneMaster.AffixLoader()
    local Affixes = C_MythicPlus.GetCurrentAffixes()
    for i = 1, #Affixes do
        if AZP.KeyStoneMaster[AZP.KeyStoneMaster.Affixes[i]] ~= nil then AZP.KeyStoneMaster[AZP.KeyStoneMaster.Affixes[i]]:OnLoadSelf() end
    end
end

function AZP.KeyStoneMaster:SaveMainFrameLocation()
    local temp = {}
    temp[1], temp[2], temp[3], temp[4], temp[5] = KSMFrame:GetPoint()
    AZPKSMLocation = temp
end

function AZP.KeyStoneMaster.GetAllKeyStoneValues()
    local curGUID = UnitGUID("PLAYER")
    local allCurInfo = {}
    local totalScore = 0
    allCurInfo.Max = 0
    allCurInfo.Min = 1000
    allCurInfo.Totals = {}
    allCurInfo.Totals.Tyrannical = 0
    allCurInfo.Totals.Fortified = 0

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
        -- Move these default assignments to above the curInfo, and always intialize Tyrannical and Fortiefied with score == 0.
        -- Then change code above to only update the score of the already intialized tables.
        if allCurInfo[ID].Tyrannical == nil then allCurInfo[ID].Tyrannical = {Score = 0, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end
        if allCurInfo[ID].Fortified == nil then allCurInfo[ID].Fortified = {Score = 0, Color = "FFFFFF00", Multiplier = 0.50, MScore = 0} end

        if allCurInfo[ID].Tyrannical.Score > allCurInfo[ID].Fortified.Score then
            allCurInfo[ID].Tyrannical.Color = "FF00FF00"
            allCurInfo[ID].Tyrannical.Multiplier = 1.5
        else
            allCurInfo[ID].Fortified.Color = "FF00FF00"
            allCurInfo[ID].Fortified.Multiplier = 1.5
        end
        allCurInfo[ID].Fortified.MScore = allCurInfo[ID].Fortified.Score * allCurInfo[ID].Fortified.Multiplier
        allCurInfo[ID].Tyrannical.MScore = allCurInfo[ID].Tyrannical.Score * allCurInfo[ID].Tyrannical.Multiplier
        allCurInfo[ID].Score = allCurInfo[ID].Fortified.MScore + allCurInfo[ID].Tyrannical.MScore

        allCurInfo.Totals.Tyrannical = allCurInfo.Totals.Tyrannical + allCurInfo[ID].Tyrannical.MScore
        allCurInfo.Totals.Fortified = allCurInfo.Totals.Fortified + allCurInfo[ID].Fortified.MScore

        local curInfoID = allCurInfo[ID]
        local curTyr = curInfoID.Tyrannical
        local curFort = curInfoID.Fortified

        if AZPKSMBaseScore == true then
            KeyFrames[ID].TBScore:SetText(string.format("|c%s%s|r", curTyr.Color, curTyr.Score))
            KeyFrames[ID].TMScore:SetText(string.format("|c%s(%.1f)|r", curTyr.Color, curTyr.MScore))
            KeyFrames[ID].FBScore:SetText(string.format("|c%s%s|r", curFort.Color, curFort.Score))
            KeyFrames[ID].FMScore:SetText(string.format("|c%s(%.1f)|r", curFort.Color, curFort.MScore))
        elseif AZPKSMBaseScore == false then
            KeyFrames[ID].TBScore:SetText(string.format("", curTyr.Color, curTyr.Score))
            KeyFrames[ID].TMScore:SetText(string.format("|c%s%.1f|r", curTyr.Color, curTyr.MScore))
            KeyFrames[ID].FBScore:SetText(string.format("", curFort.Color, curFort.Score))
            KeyFrames[ID].FMScore:SetText(string.format("|c%s%.1f|r", curFort.Color, curFort.MScore))
        end

        local curTotScore = curTyr.MScore + curFort.MScore
        totalScore = totalScore + curTotScore
    end

    for ID, Info in pairs(KeyList) do
        if totalScore ~= 0 then
            local curPerc = (allCurInfo[ID].Tyrannical.MScore + allCurInfo[ID].Fortified.MScore) / totalScore * 100
            allCurInfo[ID].Percentage = curPerc
            KeyFrames[ID].Percentage:SetText(string.format("|cFF00FFFF%.2f|r", curPerc))
        else allCurInfo[ID].Percentage = "?" end
        if allCurInfo.Max < allCurInfo[ID].Score then allCurInfo.Max = allCurInfo[ID].Score end
        if allCurInfo.Min > allCurInfo[ID].Score then allCurInfo.Min = allCurInfo[ID].Score end
    end

    for ID, Info in pairs(KeyList) do
        local GradColor = AZP.KeyStoneMaster:CalculateGradientColor(allCurInfo.Min, allCurInfo.Max, allCurInfo[ID].Score, ID)
        KeyFrames[ID].TotalScore:SetText(string.format("|cFF%s%.1f|r", GradColor, allCurInfo[ID].Score))
    end

    local TColor, FColor = nil, nil

    if allCurInfo.Totals.Tyrannical < allCurInfo.Totals.Fortified then
        TColor = "|cFFFFFF00"
        FColor = "|cFF00FF00"
    else
        TColor = "|cFF00FF00"
        FColor = "|cFFFFFF00"
    end

    KSMFrame.TotalFrame.TScore:SetText(string.format("%s%.1f|r", TColor, allCurInfo.Totals.Tyrannical))
    KSMFrame.TotalFrame.FScore:SetText(string.format("%s%.1f|r", FColor, allCurInfo.Totals.Fortified))
    KSMFrame.TotalFrame.TotalScore:SetText(string.format("|cFF00FFFF%.1f|r", (allCurInfo.Totals.Tyrannical + allCurInfo.Totals.Fortified)))

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

    local Hex = FirstHex .. SecondHex

    return Hex
end

function AZP.KeyStoneMaster:TickLoadingBar()
    LoadingBarTicker = LoadingBarTicker + 1
    KSMFrame.LoadingBar:SetValue(LoadingBarTicker)
end

function AZP.KeyStoneMaster.MPlusUpdateScores()
    LoadingBarTicker = 0
    KSMFrame.LoadingBar:SetValue(LoadingBarTicker)
    KSMFrame.LoadingBar:Show()
    C_Timer.After(2.5, function() AZP.KeyStoneMaster.GetAllKeyStoneValues() KSMFrame.LoadingBar:Hide() end)
    C_Timer.NewTicker(0.25, function() AZP.KeyStoneMaster:TickLoadingBar() end, 10)
end

function AZP.KeyStoneMaster:ToggleAttachment()
    if AZPKSMAttached == true then
        AZP.KeyStoneMaster:DeAttachFrame()
    else
        AZP.KeyStoneMaster:AttachFrame()
    end
end

function AZP.KeyStoneMaster:AttachFrame()
    KSMFrame:SetParent(PVEFrame.AZPKSMOptions)
    KSMFrame:ClearAllPoints()
    KSMFrame:SetPoint("TOPLEFT", PVEFrame.AZPKSMOptions, "TOPRIGHT", 0, 0)
    KSMFrame:EnableMouse(false)
    KSMFrame:SetMovable(false)
    KSMFrame:RegisterForDrag(nil)
    KSMFrame:SetScript("OnDragStart", nil)
    KSMFrame:SetScript("OnDragStop", nil)
    AZPKSMAttached = true
end

function AZP.KeyStoneMaster:DeAttachFrame()
    KSMFrame:SetParent(UIParent)
    if AZPKSMLocation ~= nil then
        KSMFrame:ClearAllPoints()
        KSMFrame:SetPoint(AZPKSMLocation[1], AZPKSMLocation[4], AZPKSMLocation[5])
    end
    KSMFrame:EnableMouse(true)
    KSMFrame:SetMovable(true)
    KSMFrame:RegisterForDrag("LeftButton")
    KSMFrame:SetScript("OnDragStart", KSMFrame.StartMoving)
    KSMFrame:SetScript("OnDragStop", function() KSMFrame:StopMovingOrSizing() AZP.KeyStoneMaster:SaveMainFrameLocation() end)
    AZPKSMAttached = false
end

function AZP.KeyStoneMaster:ToggleScoreFrame()
    --print("ToggleScoreFrame()")
    if KSMFrame:IsShown() == true then
        --print("IsShown() == true, hiding it now!")
        KSMFrame:Hide()
    else
        --print("IsShown() == false, showing it now!")
        KSMFrame:Show()
    end
end

function AZP.KeyStoneMaster:ToggleOptionsFrame()
    if PVEFrame.AZPKSMOptions:IsShown() == true then
        PVEFrame.ToggleOptionsButton.BG:SetTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
        PVEFrame.AZPKSMOptions:Hide()
    else
        PVEFrame.ToggleOptionsButton.BG:SetTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
        PVEFrame.AZPKSMOptions:Show()
    end
end

function AZP.KeyStoneMaster:OnEvent(self, event, ...)
    if event == "VARIABLES_LOADED" then
        if AZPKSMLocation ~= nil then
            KSMFrame:ClearAllPoints()
            KSMFrame:SetPoint(AZPKSMLocation[1], AZPKSMLocation[4], AZPKSMLocation[5])
        end

        if AZPKSMAutoPopUp == nil then AZPKSMAutoPopUp = false end
        PVEFrame.AZPKSMOptions.PopUpCheckBox:SetChecked(AZPKSMAutoPopUp)

        if AZPKSMBaseScore == nil then AZPKSMBaseScore = true end
        PVEFrame.AZPKSMOptions.BaseScoreCheckBox:SetChecked(AZPKSMBaseScore)

        if AZPKSMAttached == true then AZP.KeyStoneMaster:AttachFrame() end
        C_Timer.After(5, function() if ShowLoadingBar == true then AZP.KeyStoneMaster.MPlusUpdateScores() else ShowLoadingBar = true end end)

        if AZPKSMInfo == nil then AZPKSMInfo = {} end
        if AZPKSMInfo[UnitGUID("PLAYER")] == nil then AZPKSMInfo[UnitGUID("PLAYER")] = {} end

        C_Timer.After(5, function() AZP.KeyStoneMaster:CreateScoresFrame() AZP.KeyStoneMaster.GetAllKeyStoneValues() end)
    elseif event == "PLAYER_LOGIN" then
        C_MythicPlus.RequestMapInfo()
        C_MythicPlus.RequestCurrentAffixes()
    -- elseif event == "MYTHIC_PLUS_CURRENT_AFFIX_UPDATE" then
    elseif event == "CHALLENGE_MODE_COMPLETED" then
        --print(CHALLENGE_MODE_COMPLETED)
        if ShowLoadingBar == true then AZP.KeyStoneMaster.MPlusUpdateScores() else ShowLoadingBar = true end
        if AZPKSMAutoPopUp == true then AZP.KeyStoneMaster:ToggleScoreFrame() end --print("AZPKSMAutoPopUp:", AZPKSMAutoPopUp) end
    end
end

AZP.KeyStoneMaster:OnLoadSelf()

AZP.SlashCommands["KSM"] = function()
    AZP.KeyStoneMaster:ToggleScoreFrame()
end

AZP.SlashCommands["KSM Options"] = function()
    AZP.KeyStoneMaster:ToggleOptionsFrame()
end

AZP.SlashCommands["ksm"] = AZP.SlashCommands["KSM"]
AZP.SlashCommands["ksm option"] = AZP.SlashCommands["KSM Options"]
AZP.SlashCommands["ksm options"] = AZP.SlashCommands["KSM Options"]