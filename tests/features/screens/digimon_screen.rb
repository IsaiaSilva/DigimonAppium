require 'rspec/expectations'

class DigimonScreen < Appium::Driver
    include RSpec::Matchers

    # ================================= SCREEN ======================================    
    def initialize
        @textHeader = 'DigimonRealmSample'
        @nome = 'com.example.leonardomenezes.digimonrealmsample:id/name'
        @combo_level = 'com.example.leonardomenezes.digimonrealmsample:id/level'
        @combo_typePower = 'com.example.leonardomenezes.digimonrealmsample:id/type'
        @nivel_champion = '/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[3]'
        @poder_vacine = 'Vacine'
        @botaoMais = 'action_insert_digimon'
        @botaoInsertDigimon = 'com.example.leonardomenezes.digimonrealmsample:id/action_insert'

    end

    def tela_principal_aberta?
        elemento =  find_element(class: 'android.widget.TextView').text
        expect(elemento).to eq('DigimonRealmSample')
    end

    def tocar_icone_botao_mais
        find_element(id: 'action_insert_digimon').click
    end
    
    def primeiro_digimon(nome)
        
        find_element(id: 'com.example.leonardomenezes.digimonrealmsample:id/name').send_keys(nome)

       #Combobox Level 
       find_element(id: 'com.example.leonardomenezes.digimonrealmsample:id/level').click
       #Rookie 
       find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]').click
        sleep 2

        #Combobox Type power 
       find_element(id: 'com.example.leonardomenezes.digimonrealmsample:id/type').click
       #Virus 
       find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[4]').click
  
    end

    def insert_digimon
        find_element(id: 'com.example.leonardomenezes.digimonrealmsample:id/action_insert').click
    end

    def validar_cadastro
        sleep 2
        result = find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.TextView[1]').text
        expect(result).to eq('CharmanderMon')
        sleep 2
    end
end