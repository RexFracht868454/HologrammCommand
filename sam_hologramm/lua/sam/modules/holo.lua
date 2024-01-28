sam.command.new("holo")
    :SetPermission("holo")
    :Help("Set or remove a hologramm material for a player.")
    :AddArg("player", {
        optional = true,
        single_target = true,
        cant_target_self = false,
        allow_higher_target = false,
    })
    :OnExecute(function(calling_ply, targets, text)
        local materialToSet = "ace/sw/holoproj"

        for i = 1, #targets do
            local target = targets[i]

            if target:GetMaterial() == materialToSet then
                target:SetMaterial("")
                sam.player.send_message(nil, "{A} has disabled hologramm material for {T}.", {
                    A = calling_ply, T = targets, V = amount, V_2 = name, V_3 = length
                })
            else
                target:SetMaterial(materialToSet)
                sam.player.send_message(nil, "{A} has enabled hologramm material for {T}.", {
                    A = calling_ply, T = targets, V = amount, V_2 = name, V_3 = length
                })
            end
        end
    end)
:End()