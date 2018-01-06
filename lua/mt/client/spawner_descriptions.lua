MT_spawnerDescriptions = {
    ['Tier 2 tech'] = {
        ['Water pump'] = {
            class = 'mt_water_pump',
            description = [[Gets water from water sources and transmits it to connected pipes.

Water output volume: 6 L/s
HP: 200]]
        },

        ['Pipe'] = {
            class = 'mt_pipe',
            description = [[Transports liquids.

Maximal transmit volume: 6 L/s
HP: 100]]
        }
    }

}

function getNameOfClass(class)
    for _, category in pairs(MT_spawnerDescriptions) do
        for name, config in pairs(category) do
            if config.class == class then
                return name
            end
        end
    end
end
