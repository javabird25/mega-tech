ENT.Type = 'anim'
ENT.Base = 'mt_machine_base'

ENT.PrintName = 'Water Pump'

function ENT:SetupDataTables()
	self:machineSetupDataTables()
    self:NetworkVar('Float', 0, 'PumpingRatio')
end

function ENT:isPumpingWater()
    return self:GetEnabled() and self:WaterLevel() ~= 0
end
