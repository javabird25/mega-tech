ENT.Category = 'MegaTech'
ENT.RenderGroup = RENDERGROUP_OPAQUE

include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end
