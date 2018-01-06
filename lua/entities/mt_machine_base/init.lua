AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')

include('shared.lua')

util.AddNetworkString('drawSetupFrame')

function ENT:explodeAndRemove()
    local explosionRadius = self:MaxHealth() / 50

    local explosionEffect = EffectData()
    explosionEffect:SetOrigin(self:GetPos())
    explosionEffect:SetRadius(explosionRadius)

    util.Effect('Explosion', explosionEffect, false)
    -- This crap crashes the game:
    -- util.BlastDamage(self, nil, self:GetPos(), explosionRadius, self.health / 10)
    self:Remove()
end

function ENT:setupHealth()
    self:SetMaxHealth(self.health)
    self:SetHealth(self.health)
end

function ENT:machineInitialize(model)
    self:SetModel(model)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    if SERVER then
        self:PhysicsInit(SOLID_VPHYSICS)
    end
    self:PhysWake()
    self:setupHealth()
    self:SetUseType(SIMPLE_USE)
end

function ENT:Use(_, caller)
    if IsValid(caller) and caller:IsPlayer() then
        self:EmitSound('buttons/combine_button1.wav')
        net.Start('drawSetupFrame')
            net.WriteEntity(self)
        net.Send(caller)
    end
end

function ENT:SetupDataTables()
	self:NetworkVar('Bool', false, 'Enabled')
end

function ENT:OnTakeDamage(damageInfo)
    self:TakeDamageInfo(damageInfo)

    if self:Health() < 0 then
        self:explodeAndRemove()
    end
end
