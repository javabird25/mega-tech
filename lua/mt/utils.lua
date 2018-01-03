function signal(message, target)
    if SERVER then
        net.Start(message)
        net.Send(target)
    else
        net.Start(message)
        net.SendToServer()
    end
end
