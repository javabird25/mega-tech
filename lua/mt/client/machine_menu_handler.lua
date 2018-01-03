net.Receive('drawSetupFrame', function()
    local machine = net.ReadEntity()
    machine:drawSetupFrame(LocalPlayer())
end)
