TOOL.Category = 'MegaTech'
TOOL.Name = '#tool.mt_spawner.name'
TOOL.Information = {
		{ name = 'left' }
}

TOOL.BuildCPanel = function(form)
	local tree = vgui.Create('DTree', form)
	local description

	hook.Add('MTDescriptionChanged', function(newDescription)
		description:SetText(newDescription)
	end)

	for groupName, groupContents in pairs(MT_spawnerDescriptions) do
		local folder = tree:AddNode(groupName)
		for machineName, machineConfig in pairs(groupContents) do
			local node = folder:AddNode(machineName)
			node.DoClick = CompileString(
'local groupName = "' .. groupName .. '"\n' ..
'local machineName = "' .. machineName .. '"\n' ..
[[local entityConVar = GetConVar('mt_spawner_entity')
local machineConfig = MT_spawnerDescriptions[groupName][machineName]
local entityClass = machineConfig.class
local description = machineConfig.description

entityConVar:SetString(entityClass)
hook.Run('MTDescriptionChanged', description)]],
				'MegaTech Spawner tree node click handler'
			)
		end
	end

	local treeWidth = tree:GetSize()
	tree:SetSize(treeWidth, 500)

	form:AddItem(tree)

	description = vgui.Create('DLabel', form)
	description:SetText(MT_spawnerDescriptions['Tier 2 tech']['Water pump'].description)
	form:AddItem(description)
end

function TOOL:LeftClick(traceResult)
	local entityClass = GetConVar('mt_spawner_entity'):GetString()

	local ent = ents.Create(entityClass)
	ent:SetPos(traceResult.HitPos)
	ent:Spawn()

	undo.Create(entityClass)
 		undo.AddEntity(ent)
 		undo.SetPlayer(Entity(1))
	undo.Finish()
end
