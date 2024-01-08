print("Run Lua script Basic Necro.")

local API = require("api")
local constants = require("NecromancyConstants")
local player = API.GetLocalPlayerName()
local script_version = 1.0

local ritualNames = {}
for i = 1, #constants.rituals_data do
    ritualNames[i] = constants.rituals_data[i].name
end

local function getNecromancyXP()
    if (API.VB_FindPSett(7224).stateAlt > 0) then
        return API.VB_FindPSett(7224).stateAlt
    end
    return API.VB_FindPSett(7224).state
end

local function getNecromancyLevel()
    return constants.getLevelForXp(getNecromancyXP(), 120, false)
end

local function getBuffBarValue(id)
    local bar = API.Buffbar_GetIDstatus(id, false)
    if (bar.id <= 0) then
        return 0
    end
    local value = tonumber(bar.text)
    if (value > 0) then
        return value
    end
    value = tonumber(bar.conv_text)
    if (value > 0) then
        return value
    end
    return 0
end

local function isInsideArea(tile, minX, minY, maxX, maxY)
    if tile == nil then
        return false
    end
    return tile.x >= minX and tile.y >= minY and tile.x <= maxX and tile.y <= maxY
end

local function isScriptActive()
    return API.Read_LoopyLoop() and API.PlayerLoggedIn()
end


local function isOnCooldown(cd)
    if (cd > API.VB_FindPSett(7654).state) then
        return true
    end
    return false
end

local currentRitual = constants.getRitualByName(API.ScriptDialogWindow2("Basic Necro", ritualNames, "Start", "Close")
                                                    .Name)
if (currentRitual == nil) then
    return
end

if (getNecromancyLevel() < currentRitual.requiredLevels[1].requiredLevel) then
    print("You don't have the required level to do this ritual. You need level " ..
              currentRitual.requiredLevels[1].requiredLevel .. " necromancy to do the '" .. currentRitual.name ..
              "' ritual.")
    return
end
print("currentRitual=" .. currentRitual.name)
local input_index = -1
if (#currentRitual.input > 1) then
    local input_names = {}
    for i = 1, #currentRitual.input do
        input_names[i] = currentRitual.input[i].itemName
    end
    local selected = API.ScriptDialogWindow2("Select ritual input", input_names, "Start", "Close").Name
    for i = 1, #currentRitual.input do
        if (string.lower(currentRitual.input[i].itemName) == string.lower(selected)) then
            input_index = i
        end
    end
else
    input_index = 1
end
if (input_index == -1) then
    return
end
local alternations = {"None (Keep placed alternations)"}
for i = 1, #constants.alternations do
    table.insert(alternations, constants.alternations[i].npcName)
end

local selectedAlternation = constants.getAlternationByName(API.ScriptDialogWindow2("Select Alternation", alternations,
                                                               "Start", "Close").Name)
local input = currentRitual.input[input_index]
local afk = os.time()
local startTime = os.time()
local startXp = getNecromancyXP()
local startLevel = constants.getLevelForXp(startXp, 120, false)
local ritualsCompleted = 0
local ritualsRemaining = -1

local xOffset = 50
local yOffset = 20
local fieldsCount = 10

local function setupGUI()
    local fieldsCount = 1
    local y = 5
    title_box = API.CreateIG_answer()
    title_box.box_start = FFPOINT.new(xOffset, y, 0)
    title_box.box_name = "title"
    title_box.colour = ImColor.new(128, 0, 128)
    title_box.string_value = "-- Basic Necromancy " .. script_version .. " --"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    statusBox = API.CreateIG_answer()
    statusBox.box_start = FFPOINT.new(0, y, 0)
    statusBox.box_name = "status"
    statusBox.colour = ImColor.new(255, 255, 255)
    statusBox.string_value = "Status: Idle"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    runTimeBox = API.CreateIG_answer()
    runTimeBox.box_start = FFPOINT.new(0, y, 0)
    runTimeBox.box_name = "runTime"
    runTimeBox.colour = ImColor.new(255, 255, 255)
    runTimeBox.string_value = "Time elapsed: 00:00:00"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    ritualBox = API.CreateIG_answer()
    ritualBox.box_start = FFPOINT.new(0, y, 0)
    ritualBox.box_name = "currentritual"
    ritualBox.colour = ImColor.new(255, 255, 255)
    ritualBox.string_value = "Selected ritual: " .. currentRitual.name

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    inputbox = API.CreateIG_answer()
    inputbox.box_start = FFPOINT.new(0, y, 0)
    inputbox.box_name = "currentinput"
    inputbox.colour = ImColor.new(255, 255, 255)
    inputbox.string_value = "Selected Input: " .. input.itemName

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    completed = API.CreateIG_answer()
    completed.box_start = FFPOINT.new(0, y, 0)
    completed.box_name = "completedrituals"
    completed.colour = ImColor.new(255, 255, 255)
    completed.string_value = "Completed rituals: 0 (0)"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    levelBox = API.CreateIG_answer()
    levelBox.box_start = FFPOINT.new(0, y, 0)
    levelBox.box_name = "gainedlvls"
    levelBox.colour = ImColor.new(255, 255, 255)
    levelBox.string_value = "Necromancy Level: " .. getNecromancyLevel() .. " (0)"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    xpBox = API.CreateIG_answer()
    xpBox.box_start = FFPOINT.new(0, y, 0)
    xpBox.box_name = "gainedxp"
    xpBox.colour = ImColor.new(255, 255, 255)
    xpBox.string_value = "Necromancy XP: 0.00 (0.00)"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    remainingBox = API.CreateIG_answer()
    remainingBox.box_start = FFPOINT.new(0, y, 0)
    remainingBox.box_name = "remaining"
    remainingBox.colour = ImColor.new(255, 255, 255)
    remainingBox.string_value = "Remaining rituals: N/A"

    fieldsCount = fieldsCount + 1
    y = y + yOffset
    etaBox = API.CreateIG_answer()
    etaBox.box_start = FFPOINT.new(0, y, 0)
    etaBox.box_name = "eta"
    etaBox.colour = ImColor.new(255, 255, 255)
    etaBox.string_value = "ETA: N/A"
    ----------------- background ---------------------------
    background = API.CreateIG_answer()
    background.box_name = "back"
    background.box_start = FFPOINT.new(0, 0, 0)
    background.box_size = FFPOINT.new(182 + (xOffset * 2), 5 + (fieldsCount * yOffset) + (yOffset / 2), 0)
    background.colour = ImColor.new(15, 13, 18, 255)
    background.string_value = ""
end

local function drawGUI()
    API.DrawSquareFilled(background)
    API.DrawTextAt(title_box)
    API.DrawTextAt(statusBox)
    API.DrawTextAt(runTimeBox)
    API.DrawTextAt(ritualBox)
    API.DrawTextAt(inputbox)
    API.DrawTextAt(completed)
    API.DrawTextAt(levelBox)
    API.DrawTextAt(xpBox)
    API.DrawTextAt(remainingBox)
    API.DrawTextAt(etaBox)
end

local function round(val, decimal)
    if (val <= 0) then
        return 0
    end
    if decimal then
        return math.floor((val * 10 ^ decimal) + 0.5) / (10 ^ decimal)
    else
        return math.floor(val + 0.5)
    end
end

local function formatElapsedTime(time)
    local hours = math.floor(time / 3600)
    local minutes = math.floor((time % 3600) / 60)
    local seconds = math.floor(time % 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local function getFormattedNumber(value)
    local formattedValue = tostring(value)
    local formatted = string.gsub(formattedValue, "^(-?%d+)(%d%d%d)", '%1,%2')
    while true do
        local newFormatted, replacements = string.gsub(formatted, "(%d)(%d%d%d),", "%1,%2,")
        if replacements == 0 then
            break
        else
            formatted = newFormatted
        end
    end
    return formatted
end

local function calculateETA(remaining, perhour)
    return ((remaining / perhour) * 3600)
end

local function updateGUI()
    local xpGained = getNecromancyXP() - startXp
    local elapsedTime = (os.time() - startTime)
    local xpPerHour = round((xpGained * 60) / (elapsedTime / 60))
    local ritualsPerHour = round((ritualsCompleted * 60) / (elapsedTime / 60))
    local currentLevel = getNecromancyLevel()
    local gainedLevels = currentLevel - startLevel
    runTimeBox.string_value = "Time elapsed: " .. formatElapsedTime(elapsedTime)
    completed.string_value = "Completed rituals: " .. getFormattedNumber(ritualsCompleted) .. " (" ..
                                 getFormattedNumber(ritualsPerHour) .. ")"
    levelBox.string_value = "Necromancy Level: " .. currentLevel .. " (" .. gainedLevels .. ")"
    xpBox.string_value = "Necromancy XP: " .. getFormattedNumber(xpGained) .. " (" .. getFormattedNumber(xpPerHour) ..
                             ") "
    if (ritualsRemaining >= 0) then
        remainingBox.string_value = "Remaining rituals: ~" .. getFormattedNumber(ritualsRemaining)
    else
        remainingBox.string_value = "Remaining rituals: N/A"
    end
    if (ritualsRemaining > 0 and ritualsPerHour > 0) then
        etaBox.string_value = "ETA: ~" .. formatElapsedTime(calculateETA(ritualsRemaining, ritualsPerHour))
    else
        etaBox.string_value = "ETA: N/A"
    end
end

setupGUI()

local function idleCheck()
    local timeDiff = os.difftime(os.time(), afk)
    local randomTime = math.random(180, 280)
    if timeDiff > randomTime then
        API.PIdle2()
        afk = os.time()
    end
end


local function getAmountInInv(itemId, stackable)
    if (not API.OpenInventoryInterface2()) then
        API.DoAction_Interface(0xc2, 0xffffffff, 1, 1432, 5, 1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
        if (not API.OpenInventoryInterface2()) then
            API.DoAction_Interface(0xc2, 0xffffffff, 1, 1431, 0, 9, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(650, 650, 750)
        end
    end
    if (stackable) then
        return API.InvStackSize(itemId)
    else
        return API.InvItemcount_1(itemId)
    end
end

local function getActualNPCId(npcId)
    local state = -1
    local transformTo = nil
    if npcId == 30327 then
        transformTo = {-1, 30328, -1}
        state = API.VB_FindPSett(11096).state >> 28 & 0x1
    elseif npcId == 30329 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30330 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30331 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30332 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30333 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30334 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30335 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30336 then
        transformTo = {-1, 30337, -1}
        state = API.VB_FindPSett(11099).state >> 15 & 0x1
    elseif npcId == 30339 then
        transformTo = {-1, 30340, -1}
        state = API.VB_FindPSett(11096).state >> 3 & 0x1
    elseif npcId == 30341 then
        transformTo = {-1, 30342, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30343 then
        transformTo = {-1, 30344, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30345 then
        transformTo = {-1, 30346, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30347 then
        transformTo = {-1, 30348, -1}
        state = API.VB_FindPSett(11097).state >> 21 & 0x1
    elseif npcId == 30349 then
        transformTo = {-1, 30350, -1}
        state = API.VB_FindPSett(11097).state >> 22 & 0x1
    elseif npcId == 30351 then
        transformTo = {-1, 30352, -1}
        state = API.VB_FindPSett(11097).state >> 23 & 0x1
    elseif npcId == 30353 then
        transformTo = {-1, 30354, -1}
        state = API.VB_FindPSett(11097).state >> 24 & 0x1
    elseif npcId == 30355 then
        transformTo = {-1, 30356, -1}
        state = API.VB_FindPSett(11097).state >> 25 & 0x1
    elseif npcId == 30357 then
        transformTo = {-1, 30362, -1}
        state = API.VB_FindPSett(11099).state >> 8 & 0x1
    elseif npcId == 30358 then
        transformTo = {-1, 30363, -1}
        state = API.VB_FindPSett(11099).state >> 9 & 0x1
    elseif npcId == 30359 then
        transformTo = {-1, 30364, -1}
        state = API.VB_FindPSett(11099).state >> 10 & 0x1
    elseif npcId == 30360 then
        transformTo = {-1, 30365, -1}
        state = API.VB_FindPSett(11099).state >> 11 & 0x1
    elseif npcId == 30361 then
        transformTo = {-1, 30366, -1}
        state = API.VB_FindPSett(11099).state >> 12 & 0x1
    elseif npcId == 30367 then
        transformTo = {-1, 30371, -1}
        state = API.VB_FindPSett(11099).state >> 0 & 0x1
    elseif npcId == 30368 then
        transformTo = {-1, 30372, -1}
        state = API.VB_FindPSett(11099).state >> 1 & 0x1
    elseif npcId == 30369 then
        transformTo = {-1, 30373, -1}
        state = API.VB_FindPSett(11099).state >> 2 & 0x1
    elseif npcId == 30370 then
        transformTo = {-1, 30374, -1}
        state = API.VB_FindPSett(11099).state >> 3 & 0x1
    elseif npcId == 30375 then
        transformTo = {-1, 30379, -1}
        state = API.VB_FindPSett(11099).state >> 4 & 0x1
    elseif npcId == 30376 then
        transformTo = {-1, 30380, -1}
        state = API.VB_FindPSett(11099).state >> 5 & 0x1
    elseif npcId == 30377 then
        transformTo = {-1, 30381, -1}
        state = API.VB_FindPSett(11099).state >> 6 & 0x1
    elseif npcId == 30378 then
        transformTo = {-1, 30382, -1}
        state = API.VB_FindPSett(11099).state >> 7 & 0x1
    elseif npcId == 30383 then
        transformTo = {-1, 30384, -1}
        state = API.VB_FindPSett(11099).state >> 16 & 0x1
    elseif npcId == 30385 then
        transformTo = {-1, 30386, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30388 then
        transformTo = {-1, 30389, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30390 then
        transformTo = {-1, 30391, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30395 then
        transformTo = {-1, 30396, -1}
        state = API.VB_FindPSett(11096).state >> 7 & 0x1
    elseif npcId == 30397 then
        transformTo = {23780, 30398}
        state = API.VB_FindPSett(10971).state >> 0 & 0xff
    elseif npcId == 30399 then
        transformTo = {-1, 30400, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30401 then
        transformTo = {-1, 30402, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30403 then
        transformTo = {-1, 30404, -1}
        state = API.VB_FindPSett(11097).state >> 18 & 0x1
    elseif npcId == 30405 then
        transformTo = {-1, 30406, -1}
        state = API.VB_FindPSett(11096).state >> 31 & 0x1
    elseif npcId == 30407 then
        transformTo = {-1, 30408, -1}
        state = API.VB_FindPSett(11096).state >> 31 & 0x1
    elseif npcId == 30409 then
        transformTo = {-1, 30410, -1}
        state = API.VB_FindPSett(11099).state >> 13 & 0x1
    elseif npcId == 30411 then
        transformTo = {-1, 30412, -1}
        state = API.VB_FindPSett(11099).state >> 14 & 0x1
    elseif npcId == 30413 then
        transformTo = {-1, 30414, -1}
        state = API.VB_FindPSett(11096).state >> 8 & 0x1
    elseif npcId == 30415 then
        transformTo = {-1, 30416, -1}
        state = API.VB_FindPSett(11096).state >> 9 & 0x1
    elseif npcId == 30501 then
        transformTo = constants.GLYPHS_1
        state = API.VB_FindPSett(11189).state >> 8 & 0xff
    elseif npcId == 30502 then
        transformTo = constants.GLYPHS_1
        state = API.VB_FindPSett(11189).state >> 16 & 0xff
    elseif npcId == 30503 then
        transformTo = constants.GLYPHS_1
        state = API.VB_FindPSett(11189).state >> 24 & 0xff
    elseif npcId == 30504 then
        transformTo = constants.GLYPHS_1
        state = API.VB_FindPSett(11190).state >> 0 & 0xff
    elseif npcId == 30505 then
        transformTo = constants.GLYPHS_1
        state = API.VB_FindPSett(11190).state >> 8 & 0xff
    elseif npcId == 30506 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11190).state >> 16 & 0xff
    elseif npcId == 30507 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11190).state >> 24 & 0xff
    elseif npcId == 30508 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11191).state >> 0 & 0xff
    elseif npcId == 30509 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11191).state >> 8 & 0xff
    elseif npcId == 30510 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11191).state >> 16 & 0xff
    elseif npcId == 30511 then
        transformTo = constants.GLYPHS_2
        state = API.VB_FindPSett(11191).state >> 24 & 0xff
    elseif npcId == 30512 then
        transformTo = constants.GLYPHS_3
        state = API.VB_FindPSett(11192).state >> 0 & 0xff
    elseif npcId == 30513 then
        transformTo = constants.GLYPHS_3
        state = API.VB_FindPSett(11192).state >> 8 & 0xff
    elseif npcId == 30514 then
        transformTo = constants.GLYPHS_3
        state = API.VB_FindPSett(11192).state >> 16 & 0xff
    elseif npcId == 30515 then
        transformTo = constants.GLYPHS_3
        state = API.VB_FindPSett(11192).state >> 24 & 0xff
    elseif npcId == 30516 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11193).state >> 0 & 0xff
    elseif npcId == 30517 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11193).state >> 8 & 0xff
    elseif npcId == 30518 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11193).state >> 16 & 0xff
    elseif npcId == 30519 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11193).state >> 24 & 0xff
    elseif npcId == 30520 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11194).state >> 0 & 0xff
    elseif npcId == 30521 then
        transformTo = constants.GLYPHS_4
        state = API.VB_FindPSett(11194).state >> 8 & 0xff
    end
    if transformTo ~= nil and (state + 1) >= 1 and (state + 1) <= #transformTo and transformTo[state + 1] > 0 then
        return transformTo[state + 1]
    end
    return npcId
end

local function isLightSourceNPC(npcId)
    return npcId >= 30512 and npcId <= 30521
end

local function getWorkingDustId()
    for i = 30501, 30521 do
        if (getActualNPCId(i) == 30429 or getActualNPCId(i) == 30431) then
            return i
        end
    end
    return -1
end

local function getCurrentInputSlotId()
    return API.VB_FindPSett(11189).state >> 0 & 0xff
end

local function getPedestalId()
    local index = getCurrentInputSlotId()
    return constants.PEDESTAL_IDS[index + 1]
end

local function hasStartedRitual()
    return ((API.VB_FindPSett(11115).state >> 18) & 0x3) == 1
end

local function isFocusStorageOpen()
    return #API.ScanForInterfaceTest2Get(true,
        {{998, 0, -1, -1, 0} --[[ -1 --]] , {998, 2, -1, 0, 0} --[[ 0 --]] , {998, 3, -1, 2, 0} --[[ 2 --]] ,
         {998, 5, -1, 3, 0} --[[ 3 --]] , {998, 6, -1, 5, 0} --[[ 5 --]] , {998, 7, -1, 6, 0} --[[ 6 --]] ,
         {998, 9, -1, 7, 0} --[[ 7 --]] }) > 0
end

local function isBankPinOpen()
    return #API.ScanForInterfaceTest2Get(true, {{13, 0, -1, -1, 0} --[[ -1 --]] , {13, 2, -1, 0, 0} --[[ 0 --]] }) > 0
end

local function isConfirmationOpen(confirmation)
    if (#API.ScanForInterfaceTest2Get(true,
        {{847, 0, -1, -1, 0} --[[ -1 --]] , {847, 28, -1, 0, 0} --[[ 0 --]] , {847, 33, -1, 28, 0} --[[ 28 --]] ,
         {847, 6, -1, 33, 0} --[[ 33 --]] }) <= 0) then
        return false
    end
    local data = API.ScanForInterfaceTest2Get(false,
        {{847, 0, -1, -1, 0} --[[ -1 --]] , {847, 28, -1, 0, 0} --[[ 0 --]] , {847, 33, -1, 28, 0} --[[ 28 --]] ,
         {847, 6, -1, 33, 0} --[[ 33 --]] , {847, 8, -1, 6, 0} --[[ 6 --]] })
    if (#data ~= 1) then
        return false
    end
    if (confirmation == nil) then
        return true
    end
    local text = data[1].textids
    if (string.find(string.lower(text), string.lower(confirmation))) then
        return true
    end
    return false
end

local function isRitualSelectionOpen()
    return #API.ScanForInterfaceTest2Get(true,
        {{1224, 0, -1, -1, 0} --[[ -1 --]] , {1224, 2, -1, 0, 0} --[[ 0 --]] , {1224, 3, -1, 2, 0} --[[ 2 --]] ,
         {1224, 4, -1, 3, 0} --[[ 3 --]] , {1224, 33, -1, 4, 0} --[[ 4 --]] , {1224, 34, -1, 33, 0} --[[ 33 --]] }) > 0
end

local function isCraftingProgressOpen()
    return false
end

local function isMakeXOpen()
    return #API.ScanForInterfaceTest2Get(true,
        {InterfaceComp5.new(1371, 7, -1, -1, 0) --[[ -1 --]] , InterfaceComp5.new(1371, 0, -1, 7, 0) --[[ 7 --]] ,
         InterfaceComp5.new(1371, 15, -1, 0, 0) --[[ 0 --]] , InterfaceComp5.new(1371, 21, -1, 15, 0) --[[ 15 --]] ,
         InterfaceComp5.new(1371, 22, -1, 21, 0) --[[ 21 --]] }) > 0
end

local function getMakeXSlotId(itemId)
    local data = API.ScanForInterfaceTest2Get(true,
        {InterfaceComp5.new(1371, 7, -1, -1, 0) --[[ -1 --]] , InterfaceComp5.new(1371, 0, -1, 7, 0) --[[ 7 --]] ,
         InterfaceComp5.new(1371, 15, -1, 0, 0) --[[ 0 --]] , InterfaceComp5.new(1371, 21, -1, 15, 0) --[[ 15 --]] ,
         InterfaceComp5.new(1371, 22, -1, 21, 0) --[[ 21 --]] })
    local index = 0
    for i = 1, #data do
        if (data[i].itemid1 <= 0) then
            goto continue
        end
        if (data[i].itemid1 == itemId) then
            return ((index * 4) + 1)
        end
        index = index + 1
        ::continue::
    end
    return -1
end

local function getFocusStorageAmount(itemId)
    local data = API.ScanForInterfaceTest2Get(true,
        {{998, 0, -1, -1, 0} --[[ -1 --]] , {998, 2, -1, 0, 0} --[[ 0 --]] , {998, 3, -1, 2, 0} --[[ 2 --]] ,
         {998, 5, -1, 3, 0} --[[ 3 --]] , {998, 6, -1, 5, 0} --[[ 5 --]] , {998, 7, -1, 6, 0} --[[ 6 --]] ,
         {998, 9, -1, 7, 0} --[[ 7 --]] })
    for k, v in pairs(data) do
        if (v.itemid1 == itemId) then
            return v.itemid1_size
        end
    end
    return 0
end

local function getSiteId()
    return API.VB_FindPSett(11130).state
end

local function getRitualId()
    return API.VB_FindPSett(11131).state
end

local inputAmounts = nil
local depositedAll = false

local function findInputAmounts()
    if (inputAmounts == nil) then
        statusBox.string_value = "Status: checking focus storage"
        if (not API.OpenInventoryInterface2()) then
            API.DoAction_Interface(0xc2, 0xffffffff, 1, 1432, 5, 1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(650, 650, 750)
            if (not API.OpenInventoryInterface2()) then
                API.DoAction_Interface(0xc2, 0xffffffff, 1, 1431, 0, 9, API.OFF_ACT_GeneralInterface_route)
                API.RandomSleep2(650, 650, 750)
            end
        end
        if (not isFocusStorageOpen()) then
            API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route0, {127318}, 50)
            API.RandomSleep2(550, 550, 650)
            API.WaitUntilMovingEnds()
            API.RandomSleep2(600, 600, 600)
            return false
        end
        if (not depositedAll) then
            API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 998, 14, 0, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(800, 800, 800)
            depositedAll = true
            return false
        end
        inputAmounts = {}
        local currentSlotId = API.VB_FindPSett(11189).state >> 0 & 0xff
        if (currentSlotId > 0 and not hasStartedRitual()) then
            local pedestalRitual = constants.getRitualBySlotId(currentSlotId)
            if (pedestalRitual ~= nil) then
                for i = 1, #pedestalRitual.input do
                    if (pedestalRitual.input[i].slotId == currentSlotId) then
                        inputAmounts[constants.getInputItemIndexByItemId(pedestalRitual.input[i].itemId)] =
                            pedestalRitual.input[i].amount
                        print("" .. pedestalRitual.input[i].amount .. ", " .. pedestalRitual.input[i].itemName)
                    end
                end
            end
        end
        for i = 1, #constants.input_items do
            if (inputAmounts[i] == nil) then
                inputAmounts[i] = 0
            end
            inputAmounts[i] = inputAmounts[i] +
                                  getAmountInInv(constants.input_items[i].itemId, constants.input_items[i].stackable)
            inputAmounts[i] = inputAmounts[i] + getFocusStorageAmount(constants.input_items[i].itemId)
        end
        API.DoAction_Interface(0x24, 0xffffffff, 1, 998, 29, -1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
        for i = 1, #inputAmounts do
            if (inputAmounts[i] > 0) then
                print("currently has : " .. inputAmounts[i] .. ", itemId=" .. constants.input_items[i].itemId ..
                          ", itemName=" .. constants.input_items[i].itemName)
            end
        end
        return true
    else
        return true
    end
    return false
end

local function hasRequiredItemsForInput()
    if (inputAmounts[constants.getInputItemIndexByItemId(input.itemId)] >= input.amount) then
        return true
    end
    return false
end

local function hasItemsGlyph(glyph)
    local makeXData = constants.getMakeXData(glyph.itemId)
    for i = 1, #makeXData.requiredItems do
        local amountInInv = getAmountInInv(makeXData.requiredItems[i].itemId, makeXData.requiredItems[i].stackable)
        if (amountInInv < makeXData.requiredItems[i].amount) then
            print("You don't have the required items to repair/draw : " .. glyph.npcName .. ", You need " ..
                      makeXData.requiredItems[i].amount .. " x " .. makeXData.requiredItems[i].itemName)
            return false
        end
    end
    return true
end

local function hasItemsAlternation(alternation)
    for i = 1, #alternation.requiredItems do
        local amountInInv = getAmountInInv(alternation.requiredItems[i].itemId, alternation.requiredItems[i].stackable)
        if (amountInInv < alternation.requiredItems[i].amount) then
            print("You don't have the required items to repair/draw : " .. alternation.npcName .. ", You need " ..
                      alternation.requiredItems[i].amount .. " x " .. alternation.requiredItems[i].itemName)
            return false
        end
    end
    return true
end

local function replaceGlyph(npcId, actualNPCId, itemId)
    if (getActualNPCId(npcId) == actualNPCId) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    if (not isMakeXOpen()) then
        if (isConfirmationOpen(
            "Overriding the component will clear the original component. You will not get any materials back.")) then
            if (not isScriptActive()) then
                return true
            end
            API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 847, 22, -1, API.OFF_ACT_GeneralInterface_Choose_option)
            API.RandomSleep2(650, 650, 750)
            return false
        else
            if (not isScriptActive()) then
                return true
            end
            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {npcId}, 50)
            API.RandomSleep2(450, 450, 550)
            API.WaitUntilMovingEnds()
            API.RandomSleep2(650, 650, 750)
        end
    end
    if (not isScriptActive()) then
        return true
    end
    local selectedProduct = API.VB_FindPSett(1170).state
    if (selectedProduct ~= itemId) then
        local selectedMenu = API.VB_FindPSett(1169).state
        if (selectedMenu ~= 16948) then
            API.DoAction_Interface(0x2e, 0xffffffff, 1, 1371, 28, -1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(150, 150, 250)
            if (not isScriptActive()) then
                return true
            end
            API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1477, 885, 1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(750, 750, 850)
            if (not isScriptActive()) then
                return true
            end
        end
        local slotId = getMakeXSlotId(itemId)
        if (slotId <= 0) then
            return false
        end
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1371, 22, slotId, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
    end
    API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 1370, 30, -1, API.OFF_ACT_GeneralInterface_Choose_option)
    API.RandomSleep2(2800, 2800, 2900)
    if (not isScriptActive()) then
        return true
    end
    return getActualNPCId(npcId) == actualNPCId
end

local function placeLight(npcId, actualNPCId, itemId)
    if (getActualNPCId(npcId) == actualNPCId) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    print("is makeX open? ")
    if (not isMakeXOpen()) then
        if (not isScriptActive()) then
            return true
        end
        API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {npcId}, 50)
        API.RandomSleep2(350, 350, 450)
        API.WaitUntilMovingEnds()
        API.RandomSleep2(650, 650, 750)
    end
    if (not isScriptActive()) then
        return true
    end
    local selectedProduct = API.VB_FindPSett(1170).state
    if (selectedProduct ~= itemId) then
        local slotId = getMakeXSlotId(itemId)
        if (slotId <= 0) then
            return false
        end
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1371, 22, slotId, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
    end
    API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 1370, 30, -1, API.OFF_ACT_GeneralInterface_Choose_option)
    API.RandomSleep2(2600, 2600, 2700)
    if (not isScriptActive()) then
        return true
    end
    return getActualNPCId(npcId) == actualNPCId
end

local function placeAlternation(npcId, actualNPCId, itemId)
    if (getActualNPCId(npcId) == actualNPCId) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    if (not isMakeXOpen()) then
        if (isConfirmationOpen(
            "Overriding the component will clear the original component. You will not get any materials back.")) then
            if (not isScriptActive()) then
                return true
            end
            API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 847, 22, -1, API.OFF_ACT_GeneralInterface_Choose_option)
            API.RandomSleep2(650, 650, 750)
            return false
        else
            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {npcId}, 50)
            API.RandomSleep2(350, 350, 450)
            if (not isScriptActive()) then
                return true
            end
            API.WaitUntilMovingEnds()
            if (not isScriptActive()) then
                return true
            end
            API.RandomSleep2(650, 650, 750)
        end
    end
    if (not isScriptActive()) then
        return true
    end
    local selectedProduct = API.VB_FindPSett(1170).state
    if (selectedProduct ~= itemId) then
        local selectedMenu = API.VB_FindPSett(1169).state
        if (selectedMenu ~= 16949) then
            API.DoAction_Interface(0x2e, 0xffffffff, 1, 1371, 28, -1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(150, 150, 250)
            if (not isScriptActive()) then
                return true
            end
            API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1477, 885, 3, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(750, 750, 850)
            if (not isScriptActive()) then
                return true
            end
        end
        local slotId = getMakeXSlotId(itemId)
        if (slotId <= 0) then
            return false
        end
        API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1371, 22, slotId, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
        if (not isScriptActive()) then
            return true
        end
    end
    API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 1370, 30, -1, API.OFF_ACT_GeneralInterface_Choose_option)
    API.RandomSleep2(2800, 2800, 2900)
    if (not isScriptActive()) then
        return true
    end
    return getActualNPCId(npcId) == actualNPCId
end

local function isClear(npcId)
    local actualId = getActualNPCId(npcId)
    return actualId == 30432 or actualId == 30433 or (actualId >= 30428 and actualId <= 30431)
end

local function clearSpot(npcId)
    if (isClear(npcId)) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    if (isConfirmationOpen("You will not get any materials back.")) then
        API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 847, 22, -1, API.OFF_ACT_GeneralInterface_Choose_option)
        API.RandomSleep2(650, 650, 750)
        if (not isScriptActive()) then
            return true
        end
        return isClear(npcId)
    end
    if (not isScriptActive()) then
        return true
    end
    API.DoAction_NPC(0x29, 1888, {npcId}, 50) -- update 1888 to clear option
    API.RandomSleep2(600, 600, 600)
    API.WaitUntilMovingEnds()
    API.RandomSleep2(650, 650, 750)
    if (not isScriptActive()) then
        return true
    end
    return isClear(npcId)
end

local function clearAllSpots()
    for npcId = 30501, 30521 do
        local cleared = clearSpot(npcId)
        while isScriptActive() and (not cleared) do
            cleared = clearSpot(npcId)
            if (not isScriptActive()) then
                return true
            end
        end
    end
end

local function isDustFree(npcId)
    local npcId = getActualNPCId(npcId)
    return not (npcId == 30429 or npcId == 30431)
end

local function removeDust(npcId)
    if (isDustFree(npcId)) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {npcId}, 50)
    API.RandomSleep2(600, 600, 600)
    if (not isScriptActive()) then
        return true
    end
    API.WaitUntilMovingEnds()
    if (not isScriptActive()) then
        return true
    end
    API.RandomSleep2(1200, 1200, 1300)
    if (not isScriptActive()) then
        return true
    end
    return isDustFree(npcId)
end

local function checkSiteDustFree()
    for i = 30501, 30521 do
        local removed = removeDust(i)
        while isScriptActive() and (not removed) do
            statusBox.string_value = "Status: clearing dust"
            removed = removeDust(i)
            if (not isScriptActive()) then
                break
            end
        end
    end
    return true
end

local glyphNPCs = nil

local function checkRequiredGlyphs()
    if (glyphNPCs ~= nil) then
        statusBox.string_value = "Status: checking glyphs"
        local hasAll = true
        for i = 1, #glyphNPCs do
            if (glyphNPCs[i].glyph == nil or getActualNPCId(glyphNPCs[i].npcId) ~= glyphNPCs[i].glyph.npcId) then
                hasAll = false
            end
        end
        if (hasAll) then
            return true
        end
        statusBox.string_value = "Status: updating glyphs"
        local hasAllItems = true
        for i = 1, #glyphNPCs do
            local actualId = getActualNPCId(glyphNPCs[i].npcId)
            if (actualId ~= glyphNPCs[i].glyph.npcId and actualId ~= glyphNPCs[i].glyph.depletedId and
                not hasItemsGlyph(glyphNPCs[i].glyph)) then
                hasAllItems = false
                break
            end
        end
        if (not hasAllItems) then
            API.Write_LoopyLoop(false)
            return false
        end
        for i = 1, #glyphNPCs do
            local actualId = getActualNPCId(glyphNPCs[i].npcId)
            if (actualId ~= glyphNPCs[i].glyph.npcId and actualId ~= glyphNPCs[i].glyph.depletedId) then
                if (constants.isDepleted(actualId)) then
                    local cleared = clearSpot(glyphNPCs[i].npcId)
                    while isScriptActive() and not cleared do
                        cleared = clearSpot(glyphNPCs[i].npcId)
                        if (not isScriptActive()) then
                            return true
                        end
                    end
                end
                local replaced = replaceGlyph(glyphNPCs[i].npcId, glyphNPCs[i].glyph.npcId, glyphNPCs[i].glyph.itemId)
                while isScriptActive() and not replaced do
                    replaced = replaceGlyph(glyphNPCs[i].npcId, glyphNPCs[i].glyph.npcId, glyphNPCs[i].glyph.itemId)
                    if (not isScriptActive()) then
                        return true
                    end
                end
            end
        end
        return true
    end
    statusBox.string_value = "Status: selecting glyphs"
    local temp = {}
    for i = 1, #currentRitual.glyphs do
        for j = 1, currentRitual.glyphs[i].amount do
            table.insert(temp, {
                npcId = -1,
                glyph = currentRitual.glyphs[i]
            })
        end
    end
    for npcId = 30501, 30511 do
        local actualId = getActualNPCId(npcId)
        if (actualId == 30428 or actualId == 30430 or isLightSourceNPC(npcId)) then -- unclearable mound of dust
            goto continue
        end
        for i = 1, #temp do
            if (temp[i].npcId ~= -1) then
                goto continue1
            end
            if (temp[i].glyph.npcId == actualId or temp[i].glyph.depletedId == actualId) then
                temp[i].npcId = npcId
                break
            end
            ::continue1::
        end
        ::continue::
    end
    local done = true
    for i = 1, #temp do
        if (temp[i].npcId == -1) then
            done = false
            break
        end
    end
    if (not done) then
        for npcId = 30501, 30511 do
            local actualId = getActualNPCId(npcId)
            if (actualId == 30428 or actualId == 30430 or isLightSourceNPC(npcId) or
                (actualId >= 30458 and actualId <= 30481)) then -- unclearable mound of dust
                goto continue
            end
            local contains = false
            for i = 1, #temp do
                if (temp[i].npcId == npcId) then
                    contains = true
                    break
                end
            end
            if (not contains) then
                for i = 1, #temp do
                    if (temp[i].npcId == -1) then
                        temp[i].npcId = npcId
                        break
                    end
                end
            end
            ::continue::
        end
    end
    done = true
    for i = 1, #temp do
        if (temp[i].npcId == -1) then
            done = false
            break
        end
    end
    if (not done) then
        for npcId = 30501, 30511 do
            local actualId = getActualNPCId(npcId)
            if (actualId == 30428 or actualId == 30430 or isLightSourceNPC(npcId)) then -- unclearable mound of dust
                goto continue
            end
            local contains = false
            for i = 1, #temp do
                if (temp[i].npcId == npcId) then
                    contains = true
                    break
                end
            end
            if (not contains) then
                for i = 1, #temp do
                    if (temp[i].npcId == -1) then
                        temp[i].npcId = npcId
                        break
                    end
                end
            end
            ::continue::
        end
    end
    glyphNPCs = temp
    return false
end

local function getTotalAmountOfLightsInInv()
    local total = 0
    for i = 1, #constants.lights do
        if (total < 50) then
            total = total + getAmountInInv(constants.lights[i].requiredId, constants.lights[i].stackable)
        end
    end
    return total
end

local function containsValue(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

local lightNPCS = nil

local function getBestLightAvailable()
    for i = #constants.lights, 1, -1 do
        if (getAmountInInv(constants.lights[i].requiredId, constants.lights[i].stackable) > 0) then
            return constants.lights[i]
        end
    end
    return nil
end

local function checkRequiredLights()
    if (lightNPCS ~= nil) then
        statusBox.string_value = "Status: checking lights"
        local hasAll = true
        for i = 1, #lightNPCS do
            if (lightNPCS[i].light == nil or getActualNPCId(lightNPCS[i].npcId) ~= lightNPCS[i].light.npcId) then
                hasAll = false
            end
        end
        if (hasAll) then
            return true
        end
        statusBox.string_value = "Status: updating lights"
        local required = 0
        for i = 1, #lightNPCS do
            if (lightNPCS[i].light == nil or getActualNPCId(lightNPCS[i].npcId) == lightNPCS[i].light.depletedId) then
                required = required + 1
            end
        end
        if (getTotalAmountOfLightsInInv() < required) then
            print(
                "You don't have enough light sources in your inventory to repair/place a lightsource spot. You need " ..
                    required .. " light sources and this ritual requires " .. currentRitual.lightSourcesAmount ..
                    " light sources")
            API.Write_LoopyLoop(false)
            return false
        end
        local requiredLights = {}
        for i = 1, #constants.lights do
            requiredLights[i] = 0
        end
        for i = 1, #lightNPCS do
            if (lightNPCS[i].light ~= nil) then
                requiredLights[lightNPCS[i].light.slot] = requiredLights[lightNPCS[i].light.slot] + 1
            end
        end
        for i = 1, #requiredLights do
            if (requiredLights[i] > 0 and getAmountInInv(constants.lights[i].requiredId, constants.lights[i].stackable) <
                requiredLights[i]) then
                for j = 1, #lightNPCS do
                    if (lightNPCS[j].light ~= nil and lightNPCS[j].light.npcId == constants.lights[i].npcId) then
                        local cleared = clearSpot(lightNPCS[j].npcId)
                        while isScriptActive() and not cleared do
                            cleared = clearSpot(lightNPCS[j].npcId)
                            if (not isScriptActive()) then
                                return true
                            end
                        end
                        lightNPCS[j].light = nil
                    end
                end
            end
        end
        for i = 1, #lightNPCS do
            if (lightNPCS[i].light == nil) then
                lightNPCS[i].light = getBestLightAvailable()
                if (lightNPCS[i].light == nil) then
                    print(
                        "You don't have enough light sources in your inventory to repair/place a lightsource spot. You need " ..
                            required .. " light sources and this ritual requires " .. currentRitual.lightSourcesAmount ..
                            " light sources")
                    API.Write_LoopyLoop(false)
                    return false
                end
                local placedLight = placeLight(lightNPCS[i].npcId, lightNPCS[i].light.npcId, lightNPCS[i].light.itemId)
                while isScriptActive() and not placedLight do
                    placedLight = placeLight(lightNPCS[i].npcId, lightNPCS[i].light.npcId, lightNPCS[i].light.itemId)
                    if (not isScriptActive()) then
                        return true
                    end
                end
            end
        end
        return true
    end
    statusBox.string_value = "Status: selecting lights"
    local temp = {}
    for i = 1, currentRitual.lightSourcesAmount do
        table.insert(temp, {
            npcId = -1,
            light = nil
        })
    end
    for npcId = 30512, 30521 do
        local actualId = getActualNPCId(npcId)
        if (actualId == 30428 or actualId == 30430 or not isLightSourceNPC(npcId)) then -- unclearable mound of dust
            goto continue
        end
        for i = 1, #temp do
            if (temp[i].npcId ~= -1) then
                goto continue1
            end
            local light = constants.getLight(actualId)
            if (light ~= nil) then
                temp[i].npcId = npcId
                temp[i].light = light
                break
            end
            ::continue1::
        end
        ::continue::
    end
    local done = true
    for i = 1, #temp do
        if (temp[i].npcId == -1) then
            done = false
            break
        end
    end
    if (not done) then
        for npcId = 30512, 30521 do
            local actualId = getActualNPCId(npcId)
            if (actualId == 30428 or actualId == 30430 or not isLightSourceNPC(npcId)) then -- unclearable mound of dust
                goto continue
            end
            local contains = false
            for i = 1, #temp do
                if (temp[i].npcId == npcId) then
                    contains = true
                    break
                end
            end
            if (not contains) then
                for i = 1, #temp do
                    if (temp[i].npcId == -1) then
                        temp[i].npcId = npcId
                        break
                    end
                end
            end
            ::continue::
        end
    end
    lightNPCS = temp
    return false
end

local alternationNPCS = nil

local function initAlternations()
    if (alternationNPCS ~= nil) then
        if (selectedAlternation == nil) then
            return true
        end
        statusBox.string_value = "Status: checking alternations"
        local hasAll = true
        for i = 1, #alternationNPCS do
            local actualId = getActualNPCId(alternationNPCS[i].npcId)
            if (actualId ~= alternationNPCS[i].alternation.npcId and actualId ~=
                alternationNPCS[i].alternation.depletedId) then
                hasAll = false
                break
            end
        end
        if (hasAll) then
            return true
        end
        statusBox.string_value = "Status: updating alternations"
        if (not API.OpenInventoryInterface2()) then
            API.DoAction_Interface(0xc2, 0xffffffff, 1, 1432, 5, 1, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(650, 650, 750)
            if (not API.OpenInventoryInterface2()) then
                API.DoAction_Interface(0xc2, 0xffffffff, 1, 1431, 0, 9, API.OFF_ACT_GeneralInterface_route)
                API.RandomSleep2(650, 650, 750)
            end
        end
        local necromancyLevel = getNecromancyLevel()
        local boostedLevel = -1
        local isUsingOverload = false
        local regularBoost = getBuffBarValue(30125)
        if (regularBoost > 0) then
            boostedLevel = necromancyLevel + regularBoost - 1
        end
        if (boostedLevel == -1) then
            for i = 1, #constants.active_overloads do
                if (API.Buffbar_GetIDstatus(constants.active_overloads[i].statusId, false).id > 0) then
                    boostedLevel = necromancyLevel + math.floor(
                        constants.active_overloads[i].minBoost +
                            (constants.active_overloads[i].levelPercentage * necromancyLevel / 100.00))
                    isUsingOverload = true
                    break
                end
            end
        end
        for i = 1, #alternationNPCS do
            local actualId = getActualNPCId(alternationNPCS[i].npcId)
            if (actualId ~= alternationNPCS[i].alternation.npcId and actualId ~=
                alternationNPCS[i].alternation.depletedId) then
                if not hasItemsAlternation(alternationNPCS[i].alternation) then
                    break
                end
                if (necromancyLevel < alternationNPCS[i].alternation.requiredLevel) then
                    local potId = -1
                    if (boostedLevel == -1 or boostedLevel < alternationNPCS[i].alternation.requiredLevel) then
                        for j = 1, #constants.necromancyBoosts do
                            local checkLevel = necromancyLevel + math.floor(
                                constants.necromancyBoosts[j].minBoost +
                                    (constants.necromancyBoosts[j].levelPercentage * necromancyLevel / 100.00))
                            if (checkLevel >= alternationNPCS[i].alternation.requiredLevel) then
                                for k = 1, #constants.necromancyBoosts[j].itemIds do
                                    if (getAmountInInv(constants.necromancyBoosts[j].itemIds[k].itemId, false) > 0) then
                                        potId = constants.necromancyBoosts[j].itemIds[k].itemId
                                        break
                                    end
                                end
                            end
                            if (potId ~= -1) then
                                break
                            end
                        end
                    end
                    if (potId == -1) then
                        break
                    end
                    local potSlotId = getInventorySlotId(potId)
                    if (potSlotId ~= -1) then
                        API.DoAction_Interface(0x30, potId, 1, 1473, 5, potSlotId, API.OFF_ACT_GeneralInterface_route)
                        API.RandomSleep2(650, 650, 750)
                    end
                end
                if (constants.isDepleted(actualId)) then
                    local cleared = clearSpot(alternationNPCS[i].npcId)
                    while isScriptActive() and not cleared do
                        cleared = clearSpot(alternationNPCS[i].npcId)
                        if (not isScriptActive()) then
                            return true
                        end
                    end
                end
                local replaced = placeAlternation(alternationNPCS[i].npcId, alternationNPCS[i].alternation.npcId,
                    alternationNPCS[i].alternation.itemId)
                while isScriptActive() and not replaced do
                    replaced = placeAlternation(alternationNPCS[i].npcId, alternationNPCS[i].alternation.npcId,
                        alternationNPCS[i].alternation.itemId)
                    if (not isScriptActive()) then
                        return true
                    end
                end
            end
        end
        return true
    end
    statusBox.string_value = "Status: initing alternations"
    alternationNPCS = {}
    if (selectedAlternation == nil) then
        for i = 30501, 30511 do
            local actualId = getActualNPCId(i)
            if (actualId == 30428 or actualId == 30430 or isLightSourceNPC(i)) then -- unclearable mound of dust
                goto continue
            end
            local alter = constants.getAlternation(actualId)
            if (alter ~= nil) then
                table.insert(alternationNPCS, {
                    npcId = i,
                    alternation = alter
                })
            end
            ::continue::
        end
        return true
    end
    for i = 30501, 30511 do
        local actualId = getActualNPCId(i)
        if (actualId == 30428 or actualId == 30430 or isLightSourceNPC(i)) then -- unclearable mound of dust
            goto continue
        end
        for j = 1, #glyphNPCs do
            if (glyphNPCs[j].npcId == i) then
                goto continue
            end
        end
        table.insert(alternationNPCS, {
            npcId = i,
            alternation = selectedAlternation
        })
        ::continue::
    end
    return false
end

local function addRequiredItem(items, id, am, stack)
    for i = 1, #items do
        if (items[i].itemId == id) then
            items[i].amount = items[i].amount + am
            return
        end
    end
    table.insert(items, {
        itemId = id,
        amount = am,
        stackable = stack
    })
end

local function getInventorySlotId(itemId)
    local invArray = API.ReadInvArrays33()
    for k, v in pairs(invArray) do
        if v.itemid1 == itemId then
            return v.index
        end
    end
    return -1
end

local function getFreeSlot()
    local invArray = API.ReadInvArrays33()
    for k, v in pairs(invArray) do
        if v.itemid1 <= 0 then
            return v.index
        end
    end
    return -1
end

local function handleTomeOfExperiance()
    if (not API.OpenInventoryInterface2()) then
        API.DoAction_Interface(0xc2, 0xffffffff, 1, 1432, 5, 1, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
        if (not API.OpenInventoryInterface2()) then
            API.DoAction_Interface(0xc2, 0xffffffff, 1, 1431, 0, 9, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(650, 650, 750)
        end
    end
    local freeSlot = getFreeSlot()
    -- print("freeslot=" .. freeSlot)
    if (freeSlot ~= -1) then
        return true
    end
    local tomeSlotId = getInventorySlotId(55633)
    if (tomeSlotId ~= -1) then
        API.DoAction_Interface(0x30, 55633, 1, 1473, 5, tomeSlotId, API.OFF_ACT_GeneralInterface_route)
        API.RandomSleep2(650, 650, 750)
        return false
    end
    return true
end

local function checkNeedsRepair()
    statusBox.string_value = "Status: checking need repair"
    local requiredItems = {}
    if (glyphNPCs ~= nil) then
        for index = 1, #glyphNPCs do
            if (getActualNPCId(glyphNPCs[index].npcId) == glyphNPCs[index].glyph.depletedId) then
                local makeXData = constants.getMakeXData(glyphNPCs[index].glyph.itemId)
                for i = 1, #makeXData.requiredItems do
                    addRequiredItem(requiredItems, makeXData.requiredItems[i].itemId, makeXData.requiredItems[i].amount,
                        makeXData.requiredItems[i].stackable)
                end
            end
        end
    end
    if (lightNPCS ~= nil) then
        for index = 1, #lightNPCS do
            if (getActualNPCId(lightNPCS[index].npcId) == lightNPCS[index].light.depletedId) then
                addRequiredItem(requiredItems, lightNPCS[index].light.requiredId, 1, lightNPCS[index].light.stackable)
            end
        end
    end
    local necromancyLevel = getNecromancyLevel()
    local boostedLevel = -1
    local isUsingOverload = false
    local regularBoost = getBuffBarValue(30125)
    if (regularBoost > 0) then
        boostedLevel = necromancyLevel + regularBoost - 1
    end
    if (boostedLevel == -1) then
        for i = 1, #constants.active_overloads do
            if (API.Buffbar_GetIDstatus(constants.active_overloads[i].statusId, false).id > 0) then
                boostedLevel = necromancyLevel + math.floor(constants.active_overloads[i].minBoost +
                                                                (constants.active_overloads[i].levelPercentage *
                                                                    necromancyLevel / 100.00))
                isUsingOverload = true
                break
            end
        end
    end
    local canRepairAnyAlternation = false
    local potId = -1
    for i = 1, #alternationNPCS do
        if (getActualNPCId(alternationNPCS[i].npcId) == alternationNPCS[i].alternation.depletedId) then
            local hasAll = true
            for j = 1, #alternationNPCS[i].alternation.requiredItems do
                if (getAmountInInv(alternationNPCS[i].alternation.requiredItems[j].itemId,
                    alternationNPCS[i].alternation.requiredItems[j].stackable) <
                    alternationNPCS[i].alternation.requiredItems[j].amount) then
                    hasAll = false
                    break
                end
            end
            if (hasAll) then
                if (necromancyLevel >= alternationNPCS[i].alternation.requiredLevel or (boostedLevel ~= -1 and boostedLevel >= alternationNPCS[i].alternation.requiredLevel)) then
                    canRepairAnyAlternation = true
                    goto continue
                end
                if (necromancyLevel < alternationNPCS[i].alternation.requiredLevel and (boostedLevel == -1 or (boostedLevel < alternationNPCS[i].alternation.requiredLevel))) then
                    for j = 1, #constants.necromancyBoosts do
                        local checkLevel = necromancyLevel + math.floor(
                            constants.necromancyBoosts[j].minBoost +
                                (constants.necromancyBoosts[j].levelPercentage * necromancyLevel / 100.00))
                        if (checkLevel >= alternationNPCS[i].alternation.requiredLevel) then
                            for k = 1, #constants.necromancyBoosts[j].itemIds do
                                if (getAmountInInv(constants.necromancyBoosts[j].itemIds[k].itemId, false) > 0) then
                                    potId = constants.necromancyBoosts[j].itemIds[k].itemId
                                    break
                                end
                            end
                        end
                        if (potId ~= -1) then
                            break
                        end
                    end
                    if (potId == -1) then
                        goto continue
                    end
                end
                canRepairAnyAlternation = true
            end
            ::continue::
        end
    end
    if (#requiredItems == 0 and not canRepairAnyAlternation) then
        return true
    end
    statusBox.string_value = "Status: repairing"
    local hasAllItems = true
    if (#requiredItems > 0) then
        for i = 1, #requiredItems do
            if (getAmountInInv(requiredItems[i].itemId, requiredItems[i].stackable) < requiredItems[i].amount) then
                print(
                    "You don't have enough items to repair all spots. You need " .. requiredItems[i].amount .. " x " ..
                        requiredItems[i].itemId)
                hasAllItems = false
                break
            end
        end
    end
    if (not hasAllItems) then
        API.Write_LoopyLoop(false)
        return false
    end
    if (potId ~= -1) then
        local potSlotId = getInventorySlotId(potId)
        if (potSlotId ~= -1) then
            API.DoAction_Interface(0x30, potId, 1, 1473, 5, potSlotId, API.OFF_ACT_GeneralInterface_route)
            API.RandomSleep2(650, 650, 750)
        end
    end
    API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route2, {getPedestalId()}, 50)
    API.RandomSleep2(650, 650, 750)
    API.WaitUntilMovingEnds()
    API.RandomSleep2(350, 350, 450)
    if (isConfirmationOpen("Repairing all components will consume")) then
        API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 847, 22, -1, API.OFF_ACT_GeneralInterface_Choose_option)
        API.RandomSleep2(350, 350, 450)
        return false
    end
    return false
end

local startedRitual = hasStartedRitual()
local removedInput = startedRitual

local function removeInput()
    if (removedInput) then
        return true
    end
    local index = constants.getInputItemIndexByItemId(input.itemId)
    inputAmounts[index] = inputAmounts[index] - input.amount
    removedInput = true
end

local click_distractions = {30492, 30493, 30494, 30498, 30499, 30500}
local shamblingGlyph = nil

local function handleDistractions()
    if (not handleTomeOfExperiance()) then
        return false
    end
    local currentLevel = getNecromancyLevel()
    local objects = API.ReadAllObjectsArray(true, 1)
    local foundCorruptGlyph = false
    for k, v in pairs(objects) do
        if (v.Type == 1) then
            local actualId = getActualNPCId(v.Id)
            if (v.Id >= 30495 and v.Id <= 30497) then
                foundCorruptGlyph = true
                break
            end
            for i = 1, #click_distractions do
                if (actualId == click_distractions[i]) then
                    statusBox.string_value = "Status: doing distraction " .. actualId
                    if (v.Anim > 0) then
                        return true
                    end
                    if (click_distractions[i] == 30500) then -- defile
                        local isDoingAnimation = API.GetPlayerAnimation_(player) == 16596
                        while isScriptActive() do
                            if not isScriptActive() then
                                return true
                            end
                            local defile = nil
                            local npcs = API.ReadAllObjectsArray(true, 1)
                            for k1, v1 in pairs(npcs) do
                                if (getActualNPCId(v1.Id) == click_distractions[i]) then
                                    defile = v1
                                    break
                                end
                            end
                            if (defile == nil or defile.Anim > 0) then
                                return true
                            end
                            local spotanims = API.ReadAllObjectsArray(true, 4)
                            local gfx = nil
                            for k1, v1 in pairs(spotanims) do
                                if (v1.Type == 4 and v1.Id == 7930) then
                                    gfx = v1
                                    break
                                end
                            end
                            if not isScriptActive() then
                                return true
                            end
                            if (API.GetPlayerAnimation_(player) ~= 16596 or gfx ~= nil) then
                                API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {defile.Id}, 50)
                                if (API.GetPlayerAnimation_(player) ~= 16596) then
                                    API.RandomSleep2(550, 550, 650)
                                    API.WaitUntilMovingEnds()
                                    API.RandomSleep2(650, 650, 650)
                                else
                                    API.RandomSleep2(650, 650, 650)
                                end
                            end
                            if not isScriptActive() then
                                return true
                            end
                            API.RandomSleep2(150, 150, 150)
                        end
                        return true
                    end
                    if (click_distractions[i] == 30498 or click_distractions[i] == 30499) then -- Soul storm
                        local spotanims = API.ReadAllObjectsArray(true, 4)
                        local startGfx = -1
                        for k1, v1 in pairs(spotanims) do
                            if (v1.Type == 4 and (v1.Id == 7916 or v1.Id == 7917)) then
                                startGfx = v1.Id
                                break
                            end
                        end
                        API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {v.Id}, 50)
                        API.RandomSleep2(350, 350, 450)
                        API.WaitUntilMovingEnds()
                        if (startGfx == 7917) then
                            API.RandomSleep2(450, 450, 550)
                            return true
                        end
                        API.RandomSleep2(350, 350, 450)
                        local loop = 0
                        while isScriptActive() do
                            if not isScriptActive() then
                                return true
                            end
                            local storm = nil
                            local npcs = API.ReadAllObjectsArray(true, 1)
                            for k1, v1 in pairs(npcs) do
                                local id = getActualNPCId(v1.Id)
                                if (id == 30498 or id == 30499) then
                                    storm = v1
                                    break
                                end
                            end
                            if (storm == nil) then
                                return true
                            end
                            spotanims = API.ReadAllObjectsArray(true, 4)
                            local currentGFX = -1
                            for k1, v1 in pairs(spotanims) do
                                if (v1.Type == 4 and (v1.Id == 7916 or v1.Id == 7917)) then
                                    currentGFX = v1.Id
                                    break
                                end
                            end
                            if not isScriptActive() then
                                return true
                            end
                            if (currentGFX == startGfx) then
                                API.RandomSleep2(150, 150, 250)
                                if not isScriptActive() then
                                    return true
                                end
                                goto continue1
                            end
                            if not isScriptActive() then
                                return true
                            end
                            startGfx = currentGFX
                            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {v.Id}, 50)
                            API.RandomSleep2(350, 350, 450)
                            API.WaitUntilMovingEnds()
                            if (startGfx == 7917) then
                                API.RandomSleep2(450, 450, 550)
                                return true
                            end
                            if not isScriptActive() then
                                return true
                            end
                            API.RandomSleep2(150, 150, 150)
                            ::continue1::
                            if not isScriptActive() then
                                return true
                            end
                        end
                        return false
                    end
                    if (click_distractions[i] == 30494) then -- Shambling horror
                        if (shamblingGlyph == nil) then
                            local gfxId = 7977
                            local spotanims = API.ReadAllObjectsArray(true, 4)
                            local gfx = nil
                            for k1, v1 in pairs(spotanims) do
                                if (v1.Type == 4 and v1.Id == gfxId) then
                                    gfx = v1
                                    break
                                end
                            end
                            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {v.Id}, 50)
                            API.RandomSleep2(350, 350, 450)
                            API.WaitUntilMovingEnds()
                            if (gfx == nil) then
                                spotanims = API.ReadAllObjectsArray(true, 4)
                                for k1, v1 in pairs(spotanims) do
                                    if (v1.Type == 4 and v1.Id == gfxId) then
                                        gfx = v1
                                        break
                                    end
                                end
                            end
                            if (gfx == nil) then
                                API.RandomSleep2(200, 200, 250)
                                return false
                            end
                            local npcs = API.ReadAllObjectsArray(true, 1)
                            for k1, v1 in pairs(npcs) do
                                if (v1.Type == 1 and v1.Id >= 30501 and v1.Id <= 30521 and math.floor(v1.TileX / 512) ==
                                    math.floor(gfx.TileX / 512) and math.floor(v1.TileY / 512) ==
                                    math.floor(gfx.TileY / 512)) then
                                    shamblingGlyph = v1
                                    break
                                end
                            end
                            if (shamblingGlyph ~= nil) then
                                if (constants.isDepleted(getActualNPCId(shamblingGlyph.Id)) or
                                    string.find(string.lower(shamblingGlyph.Name), string.lower("depleted"))) then
                                    API.DoAction_NPC(0xae, 1696, {shamblingGlyph.Id}, 50)
                                else
                                    API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {shamblingGlyph.Id}, 50)
                                end
                                API.RandomSleep2(1200, 1200, 1200)
                                return false
                            end
                        else
                            API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {v.Id}, 50)
                            API.RandomSleep2(350, 350, 450)
                            API.WaitUntilMovingEnds()
                            if (constants.isDepleted(getActualNPCId(shamblingGlyph.Id)) or
                                string.find(string.lower(shamblingGlyph.Name), string.lower("depleted"))) then
                                API.DoAction_NPC(0xae, 1696, {shamblingGlyph.Id}, 50)
                            else
                                API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {shamblingGlyph.Id}, 50)
                            end
                            API.RandomSleep2(1200, 1200, 1200)
                            return false
                        end
                        API.RandomSleep2(250, 250, 350)
                        return false
                    end
                    API.DoAction_NPC(0x29, API.OFF_ACT_InteractNPC_route, {v.Id}, 50)
                    API.RandomSleep2(550, 550, 650)
                    API.WaitUntilMovingEnds()
                    API.RandomSleep2(650, 650, 750)
                    return false
                end
                ::continue::
            end
        end
        ::continueMain::
    end
    shamblingGlyph = nil
    if (foundCorruptGlyph) then
        objects = API.ReadAllObjectsArray(true, 1)
        for i = 30495, 30497 do
            for k, v in pairs(objects) do
                if (v.Type == 1 and v.Id == i) then
                    statusBox.string_value = "Status: doing distraction " .. v.Id
                    API.DoAction_NPC__Direct(0x29, API.OFF_ACT_InteractNPC_route, v)
                    API.RandomSleep2(450, 450, 550)
                    API.WaitUntilMovingEnds()
                    API.RandomSleep2(750, 750, 850)
                    return false
                end
            end
        end
    end
    return true
end

local function completedRitual()
    print("You have completed a ritual")
    ritualsCompleted = ritualsCompleted + 1
    if (#currentRitual.reward_items > 0) then
        for i = 1, #currentRitual.reward_items do
            local index = constants.getInputItemIndexByItemId(currentRitual.reward_items[i].itemId)
            if (index ~= -1) then
                inputAmounts[index] = inputAmounts[index] + currentRitual.reward_items[i].amount
            end
        end
    end
    if (#currentRitual.reward_input > 0) then
        for i = 1, #currentRitual.reward_input do
            if (currentRitual.reward_input[i].slotId == input.slotId) then
                local index = constants.getInputItemIndexByItemId(currentRitual.reward_input[i].itemId)
                if (index ~= -1) then
                    inputAmounts[index] = inputAmounts[index] + currentRitual.reward_input[i].amount
                end
            end
        end
    end
    ritualsRemaining = ritualsRemaining - 1
    if (ritualsRemaining < 0) then
        ritualsRemaining = 0
    end
    updateGUI()
end

local function startRitual()
    if (hasStartedRitual()) then
        return true
    end
    if (not isScriptActive()) then
        return true
    end
    API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route0, {127315}, 50)
    if (not isScriptActive()) then
        return true
    end
    API.RandomSleep2(650, 650, 700)
    if (not isScriptActive()) then
        return true
    end
    API.WaitUntilMovingEnds()
    if (not isScriptActive()) then
        return true
    end
    API.RandomSleep2(1000, 1000, 1000)
    if (not isScriptActive()) then
        return true
    end
    return hasStartedRitual()
end

local function checkStartRitual()
    statusBox.string_value = "Status: starting ritual"
    if (hasStartedRitual()) then
        return true
    end
    local started = startRitual()
    while isScriptActive() and not started do
        started = startRitual()
        if (not isScriptActive()) then
            break
        end
    end
    return true
end

local function getRitualsRemaining()
    local fromInput = 0
    local index = constants.getInputItemIndexByItemId(input.itemId)
    if (index ~= -1) then
        fromInput = math.floor(inputAmounts[index] / input.amount)
    end
    local fromGlyphs = -1
    for index = 1, #currentRitual.glyphs do
        local makeXData = constants.getMakeXData(currentRitual.glyphs[index].itemId)
        if (makeXData ~= nil) then
            local minItems = -1
            for i = 1, #makeXData.requiredItems do
                local amount = math.floor(getAmountInInv(makeXData.requiredItems[i].itemId,
                    makeXData.requiredItems[i].stackable) / makeXData.requiredItems[i].amount)
                if (minItems == -1 or amount < minItems) then
                    minItems = amount
                end
            end
            if (minItems > 0) then
                local multiplier = 6
                if (string.find(string.lower(currentRitual.glyphs[index].npcName), string.lower(" III"))) then
                    multiplier = 18
                elseif (string.find(string.lower(currentRitual.glyphs[index].npcName), string.lower(" II"))) then
                    multiplier = 12
                end
                local amount = minItems * multiplier
                if (fromGlyphs == -1 or amount < fromGlyphs) then
                    fromGlyphs = amount
                end
            end
        end
    end
    if (fromGlyphs < 0) then
        fromGlyphs = 0
    end
    return math.min(fromGlyphs, fromInput)
end

local function performRitual()
    if (not hasStartedRitual()) then
        return
    end
    removeInput()
    if (not handleDistractions()) then
        return
    end
    if (API.GetPlayerAnimation_(player) ~= 35520) then
        statusBox.string_value = "Status: continuing ritual"
        API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route0, {127316}, 50)
        API.RandomSleep2(550, 550, 650)
        if (not hasStartedRitual()) then
            return
        end
        API.WaitUntilMovingEnds()
        if (not hasStartedRitual()) then
            return
        end
        API.RandomSleep2(650, 650, 750)
        return
    end
    statusBox.string_value = "Status: doing ritual"
end

API.Write_LoopyLoop(true)
while (API.Read_LoopyLoop()) do -----------------------------------------------------------------------------------
    local isInArea = isInsideArea(API.PlayerCoord(), 1024, 1760, 1060, 1800)
    if (isBankPinOpen()) then
        print("Please enter bank pin before starting the script.")
        API.Write_LoopyLoop(false)
        goto continue
    end
    drawGUI()
    idleCheck()
    if (isInArea and currentRitual ~= nil) then
        if (not findInputAmounts()) then
            goto continue
        end
        if (ritualsRemaining == -1) then
            ritualsRemaining = getRitualsRemaining()
            updateGUI()
        end
        if (getRitualId() ~= currentRitual.dbrowId or getCurrentInputSlotId() ~= input.slotId) then
            if (getRitualId() ~= currentRitual.dbrowId) then
                statusBox.string_value = "Status: Changing ritual"
            else
                statusBox.string_value = "Status: Changing ritual input"
            end
            startedRitual = false
            if (not hasRequiredItemsForInput()) then
                print("You don't have the required items to do this ritual. You need " .. input.amount .. " x " ..
                          input.itemName)
                API.Write_LoopyLoop(false)
                goto continue
            end
            if (hasStartedRitual()) then
                -- if (isConfirmationOpen("Quitting the ritual will immediately end it")) then
                --     API.DoAction_Interface(0xffffffff, 0xffffffff, 0, 847, 22, -1, API.OFF_ACT_GeneralInterface_Choose_option)
                --     API.RandomSleep2(300, 250, 300)
                -- else
                --     API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route1, {127316}, 50)
                --     API.RandomSleep2(300, 300, 400)
                --     API.WaitUntilMovingEnds()
                --     API.RandomSleep2(600, 600, 600)
                -- end
                performRitual()
                goto continue
            end
            if (isRitualSelectionOpen()) then
                API.DoAction_Interface(0xffffffff, 0xffffffff, 1, 1224, 34, currentRitual.input[1].slotId, API.OFF_ACT_GeneralInterface_route)
                API.RandomSleep2(650, 650, 750)
                -- local selectedSlotId = API.VB_FindPSett(11181).state
                -- if (selectedSlotId ~= input.slotId) then
                --     API.DoAction_interface_radio(1224, 24, 0, selectedSlotId, false)
                --     API.RandomSleep2(350, 350, 450)
                --     API.DoAction_interface_radio(1224, 24, 0, input.slotId, true)
                --     API.RandomSleep2(650, 650, 750)
                -- end
                API.DoAction_Interface(0x24, 0xffffffff, 1, 1224, 44, -1, API.OFF_ACT_GeneralInterface_route)
                API.RandomSleep2(650, 650, 750)
            else
                API.DoAction_Object1(0x29, API.OFF_ACT_GeneralObject_route0, {getPedestalId()}, 50)
                API.RandomSleep2(550, 550, 650)
                API.WaitUntilMovingEnds()
                API.RandomSleep2(1000, 1000, 1100)
            end
        else
            if (startedRitual ~= hasStartedRitual()) then
                startedRitual = hasStartedRitual()
                if (startedRitual == false) then
                    removedInput = false
                    completedRitual()
                end
            end
            if (startedRitual) then
                performRitual()
                goto continue
            end
            if (not checkSiteDustFree()) then
                goto continue
            end
            if (not checkRequiredGlyphs()) then
                goto continue
            end
            if (not checkRequiredLights()) then
                goto continue
            end
            if (not initAlternations()) then
                goto continue
            end
            if (not checkNeedsRepair()) then
                goto continue
            end
            if (not checkStartRitual()) then
                goto continue
            end
        end
    else
        API.Write_LoopyLoop(false)
    end
    ::continue::
    updateGUI()
end ----------------------------------------------------------------------------------