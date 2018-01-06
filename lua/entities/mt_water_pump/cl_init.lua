include('shared.lua')

function ENT:drawSetupFrame()
    local frame = self:createSetupFrame()

    local waterOutputLabel = vgui.Create('DLabel')
    local outputLevel
    if self:isPumpingWater() then
        outputLevel = self:GetPumpingRatio()
    else
        outputLevel = 0.0
    end
    waterOutputLabel:SetText(outputLevel .. ' L/s')

    frame:MakePopup()
end
