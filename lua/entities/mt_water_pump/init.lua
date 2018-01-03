AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

ENT.health = 200

function ENT:Initialize()
    self:machineInitialize('models/props_wasteland/laundry_washer001a.mdl')
end
