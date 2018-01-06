include('shared.lua')

function ENT:drawSetupFrame()
    local frame = self:createSetupFrame()

    local waterOutputLabel = vgui.Create('DLabel')
    waterOutputLabel:SetText(self:GetLiquidTransmitRatio() .. ' L/s')

    frame:MakePopup()
end
