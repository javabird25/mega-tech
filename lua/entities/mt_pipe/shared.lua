ENT.Type = 'anim'
ENT.Base = 'mt_machine_base'

ENT.PrintName = 'Pipe'

function ENT:SetupDataTables()
	self:machineSetupDataTables()
    self:NetworkVar('Float', 0, 'LiquidTransmitVolume')
    self:NetworkVar('Float', 1, 'MaximalLiquidTransmitVolume')

    if SERVER then
        self:SetLiquidTransmitVolume(0)
        self:SetMaximalLiquidTransmitVolume(6)
    end
end
