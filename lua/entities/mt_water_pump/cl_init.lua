include('shared.lua')

function ENT:drawSetupFrame()
    local frame = vgui.Create('DFrame')
    frame:SetSize(500, 500)
    frame:SetTitle('Water pump')
    frame:SetPos(ScrW() * 0.3, ScrH() * 0.3)

    local powerButton = vgui.Create('DButton', frame)
    powerButton:SetPos(10, 30)
    powerButton:SetSize(80, 80)
    powerButton:SetText('Power')

    frame:MakePopup()
end
