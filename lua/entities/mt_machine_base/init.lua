AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')

include('shared.lua')

util.AddNetworkString('drawSetupFrame')

local function setupHealth(entity)
    entity:SetMaxHealth(self.health)
    entity:SetHealth(self.health)
end

function ENT:Initialize()
    self:SetMoveType(MOVETYPE_VPHYSICS)
    if SERVER then
        self:PhysicsInit(SOLID_VPHYSICS)
    end
    self:PhysWake()

    setupHealth(self)

    self:SetUseType(SIMPLE_USE)
end

function ENT:Use(_, caller)
    if IsValid(caller) and caller:IsPlayer() then
        net.Start('drawSetupFrame')
            net.WriteEntity(self)
        net.Send(caller)
    end
end

function ENT:SetupDataTables()
	self:NetworkVar('Bool', false, 'Enabled')
end
