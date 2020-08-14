Dado("que a aplicacao esta aberta") do

    digimon.aplicacao_aberta()

    id('digimon_list').displayed?
    id('action_insert_digimon').displayed?
end
  
 Quando("iniciar o cadastro do digimon") do
    digimon.botaoMais_cadastrar
 end
  
 Quando("preecho as informaçãoes") do
    digimon.primeiro_digimon('CharmanderMon')
 end

 Quando('insiro o digimon') do
    digimon.botaoInsert_Digimon
  end
  
 Então("verifico que o digimon foi cadastrado") do
 #   digimon.validar_cadastro

    result = id('com.example.leonardomenezes.digimonrealmsample:id/name').displayed?
    # result = @driver.find_element(:id, "com.example.leonardomenezes.digimonrealmsample:id/name")
     
      if (!result.nil?) && (result.text.eql? "CharmanderMon")
         puts "Test Passed"
       else
         puts "Test Failed"
       end
 end