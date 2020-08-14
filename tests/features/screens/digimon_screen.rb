
#Criei a classe homescreen e herdei todos os métodos da classe basecreen
require 'rspec/expectations'

class DigimonScreen < BaseScreen 
    include RSpec::Matchers

    def aplicacao_aberta
        {        
            textHeader: 'DigimonRealmSample',
            botaoMais: 'com.example.leonardomenezes.digimonrealmsample:id/action_insert_digimon',
        }
    end


    def dados_do_digimon
        {
            nome: 'com.example.leonardomenezes.digimonrealmsample:id/name',

            nivel_spiner: 'com.example.leonardomenezes.digimonrealmsample:id/level',
            nivel_training: 'In Training',
            nivel_rookie: 'Rookie',
            nivel_champion: 'hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[3]',
            nivel_ultimate: 'Ultimate',
            nivel_extreme: 'Extreme',
            nivel_antibody: 'X - Antibody',
            nivel_burst: 'Burst Mode',

            poder_typo: 'com.example.leonardomenezes.digimonrealmsample:id/type',
            poder_unknown: 'Unknowm',
            poder_vacine: 'Vacine',
            poder_data: 'Data',
            poder_variable: 'Variable',
            poder_virus: 'hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.widget.Spinner[2]/android.widget.CheckedTextView',

            botao_insert: 'com.example.leonardomenezes.digimonrealmsample:id/action_insert',
        }
        
    end


    #Métodos de açcoes nos elementos mapeados
    def botaoMais_cadastrar
        click_id aplicacao_aberta[:botaoMais]
    end

    def botaoInsert_Digimon
        click_id dados_do_digimon[:botao_insert]
    end
    
    def primeiro_digimon(nome)
        
        send_keys_id dados_do_digimon[:nome], nome
        click_id dados_do_digimon[:nivel_spiner]                                #  outra forma ->  find_element(class: 'android.widget.Spinner').click

        # #Clica no Combobox e escolhe o valor de index2
         ele_index('android.widget.CheckedTextView', 2).click() 
         sleep 2

          click_id dados_do_digimon[:poder_typo]          
          sleep 1    
          ele_index('android.widget.CheckedTextView', 4).click 
          sleep 2
    end

    def validar_cadastro

        result = click_id dados_do_digimon[:nome]

        #result = find_element(:id, "com.example.leonardomenezes.digimonrealmsample:id/name")

        if (!result.nil?) && (result.text.eql? "CharmanderMon")
            puts "Test Passed"
          else
            puts "Test Failed"
          end


    end
end