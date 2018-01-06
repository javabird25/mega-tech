ENT.Category = 'MegaTech'
ENT.RenderGroup = RENDERGROUP_OPAQUE

include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end

local function addPowerButtonToFrame(frame, machine)
    local powerButton = vgui.Create('DButton', frame)
    powerButton:SetPos(10, 30)
    powerButton:SetSize(80, 80)
    powerButton:SetText('Power')
    powerButton.DoClick = function()
        machine:SetEnabled(not machine:GetEnabled())
    end

    local enabledIndicator = vgui.Create('DShape', frame)
    enabledIndicator:SetType('Rect')
    enabledIndicator:SetPos(5, 25)
    local indicatorColor
    if self:GetEnabled() then
        indicatorColor = Color(0, 255, 0, 255)  -- Green
    else
        indicatorColor = Color(255, 0, 0, 255)  -- Red
    end
    enabledIndicator:SetColor(indicatorColor)
    enabledIndicator:SetSize(85, 85)
end

local function addHealthLabelToFrame(frame, machine)
    local label = vgui.Create('DLabel', frame)
    label:SetText('Health: ' .. machine:Health() .. ' / ' .. machine:MaxHealth())
    label:SetPos(5, 120)
end

function ENT:createSetupFrame()
    local frame = vgui.Create('DFrame')
    frame:SetTitle(getNameOfClass(self:GetClass()))
    frame:SetPos(ScrW() * 0.3, ScrH() * 0.3)
    frame:SetSize(500, 500)

    addPowerButtonToFrame(frame, self)
    addHealthLabelToFrame(frame, self)

    return frame
end
