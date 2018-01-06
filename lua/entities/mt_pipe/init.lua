AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

-- Entities to which pipes will connect.
local liguidOperationEntityClasses = {
    'mt_pipe',
    'mt_water_pump'
}

ENT.health = 100

function ENT:connectToEntity(entity)
    -- TODO
end

function ENT:Initialize()
    self:machineInitialize('')  -- TODO
end

function ENT:PhysicsCollide(collisionData)
    local hitEntity = collisionData.HitEntity
    local hitEntityClass = hitEntity:GetClass()
    if table.HasValue(liguidOperationEntityClases, hitEntityClass) then
        self:connectToEntity(hitEntity)
    end
end
