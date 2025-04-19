RegisterCommand('me', function(source, args)
    local msg = table.concat(args, " ")
    if msg == "" then return end
    TriggerClientEvent('3dme:shareDisplay', -1, source, msg)
end)
