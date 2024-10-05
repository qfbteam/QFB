local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "QFB|Executor[Freemium]", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local EditorTab = Window:MakeTab({
	Name = "+Editor",
	Icon = "",
	PremiumOnly = false
})

local inputValue = ""

local inputValue = ""
local label

EditorTab:AddTextbox({
	Name = "Editor",
	Default = "--Script salvo na parte do label",
	TextDisappear = true,
	Callback = function(Value)
		-- Armazena o valor da textbox
		inputValue = Value
		-- Atualiza o texto do Label com o valor digitado
		label:Set(inputValue)
	end	  
})

-- Cria o Label inicialmente vazio, logo abaixo da Textbox
label = EditorTab:AddLabel("")

EditorTab:AddButton({
	Name = "Execute", 
	Callback = function()
		local success, err = pcall(function()
			-- Executa o código armazenado na variável inputValue
			local exec = loadstring(inputValue)
			if exec then
				exec()
			end
		end)

		-- Se houver erro na execução, exibe notificação
		if not success then
			OrionLib:MakeNotification({
				Name = "Erro!",
				Content = "Erro ao executar o comando: "..err,
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end    
})
