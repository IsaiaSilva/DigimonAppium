Dado("que a aplicacao esta aberta") do

    digimon.tela_principal_aberta?

    id('digimon_list').displayed?
    id('action_insert_digimon').displayed?
end
  
 Quando("iniciar o cadastro do digimon") do
    digimon.tocar_icone_botao_mais
 end
  
 Quando("preecho as informaçãoes") do
    digimon.primeiro_digimon('CharmanderMon')
 end

 Quando('insiro o digimon') do
    digimon.insert_digimon
  end
  
 Então("verifico que o digimon foi cadastrado") do
    digimon.validar_cadastro
 end