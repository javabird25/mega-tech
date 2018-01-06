ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'

ENT.PrintName = 'Basic Machine'
ENT.Author = 'Protocs'
ENT.Contact = 'Steam'

function ENT:machineSetupDataTables()
	self:NetworkVar('Bool', 0, 'Enabled')

    if SERVER then
        self:SetEnabled(false)
    end
end
