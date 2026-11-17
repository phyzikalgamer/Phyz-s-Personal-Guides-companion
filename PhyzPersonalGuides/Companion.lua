local WEBSITE = "https://xp.bulo.cloud/"
local panel
local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cffffd100Phyz Personal Guides:|r " .. message)
end

local function FindImporter()
    -- Resolve AceConsole's registered command rather than reaching into private addon state.
    for key, handler in pairs(SlashCmdList) do
        if type(handler) == "function" then
            local index = 1
            while _G["SLASH_" .. key .. index] do
                if _G["SLASH_" .. key .. index] == "/phyzleveling" then return handler end
                index = index + 1
            end
        end
    end
end

local function OpenImporter()
    if InCombatLockdown() then
        Print("Finish combat, then click Open guide importer again.")
        return
    end
    local handler = FindImporter()
    if not handler then
        Print("Enable Phyz Leveling and restart WoW. You can also try /phyzleveling import.")
        return
    end
    local ok = pcall(handler, "import")
    if not ok then
        Print("Could not open the importer. Try /phyzleveling import and check Phyz Leveling for errors.")
        return
    end
    if panel then panel:Hide() end
end

local function Text(parent, value, y, font)
    local label = parent:CreateFontString(nil, "ARTWORK", font or "GameFontHighlight")
    label:SetPoint("TOPLEFT", 20, y)
    label:SetWidth(380)
    label:SetJustifyH("LEFT")
    label:SetText(value)
    return label
end

local function ShowSetup()
    if not panel then
        panel = CreateFrame("Frame", "PhyzPersonalGuidesSetup", UIParent, "BasicFrameTemplateWithInset")
        panel:SetSize(420, 370)
        panel:SetPoint("CENTER")
        panel:SetFrameStrata("DIALOG")
        panel:SetClampedToScreen(true)
        panel:SetMovable(true)
        panel:EnableMouse(true)
        panel:RegisterForDrag("LeftButton")
        panel:SetScript("OnDragStart", panel.StartMoving)
        panel:SetScript("OnDragStop", panel.StopMovingOrSizing)
        panel.TitleText:SetText("Phyz Personal Guides")
        tinsert(UISpecialFrames, "PhyzPersonalGuidesSetup")

        Text(panel, "Set up your guides", -42, "GameFontNormalLarge")
        Text(panel, "1. Copy this address with Ctrl+C and open it in your browser.", -72)
        local address = CreateFrame("EditBox", nil, panel, "InputBoxTemplate")
        address:SetSize(366, 26)
        address:SetPoint("TOPLEFT", 26, -111)
        address:SetAutoFocus(false)
        address:SetMaxLetters(128)
        address:SetText(WEBSITE)
        address:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
        address:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
        address:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
        address:SetScript("OnEditFocusLost", function(self) self:SetText(WEBSITE) end)
        panel.address = address

        Text(panel, "2. Follow the website's instructions and copy a guide import intended for your own account.", -157)
        Text(panel, "3. Open Phyz Leveling's importer, paste the import, and follow its prompts. Then choose a guide in Phyz Leveling.", -208)
        local button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
        button:SetSize(210, 26)
        button:SetPoint("TOP", 0, -266)
        button:SetText("Open guide importer")
        button:SetScript("OnClick", OpenImporter)
        Text(panel, "No guides are included. Imports are checked by Phyz Leveling. This companion does not sign in, download files, or collect Battle.net details.", -309, "GameFontDisableSmall")
    end
    panel:Show()
    panel.address:SetText(WEBSITE)
    panel.address:SetFocus()
    panel.address:HighlightText()
end

SLASH_PHYZPERSONALGUIDES1 = "/phyzguides"
SLASH_PHYZPERSONALGUIDES2 = "/ppg"
SlashCmdList.PHYZPERSONALGUIDES = function(message)
    local command = (message or ""):match("^%s*(.-)%s*$"):lower()
    if command == "import" then OpenImporter() else ShowSetup() end
end

local events = CreateFrame("Frame")
events:SetScript("OnEvent", function()
    Print("Type /phyzguides to set up guides or open the manual importer.")
end)
events:RegisterEvent("PLAYER_LOGIN")
