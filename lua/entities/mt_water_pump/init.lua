AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
DEFINE_BASECLASS('mt_machine_base')

ENT.health = 200

function ENT:Initialize()
    BaseClass.Initialize()
    self:SetModel('')   -- TODO
end
