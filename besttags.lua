script_name = "Best Tags "
script_description = "Aplica uma tag escolhida nas linhas"
script_author = "Sa1to Yuki"
script_version = "1.1"

function aplicar_tag_custom(subs, sel)
    local dialog_config = {
        {class="label", label="Digite a tag (ex: \\an8, \\i1):", x=0, y=0},
        {class="edit", name="tag", x=0, y=1, width=30}
    }

    local pressed, res = aegisub.dialog.display(dialog_config, {"OK", "Cancelar"})
    if pressed ~= "OK" then return end

    for _, i in ipairs(sel) do
        local linha = subs[i]
        linha.text = "{" .. res.tag .. "}" .. linha.text
        subs[i] = linha
    end
end

aegisub.register_macro("Aplicar Tag Custom", "Aplica qualquer tag nas linhas selecionadas", aplicar_tag_custom)