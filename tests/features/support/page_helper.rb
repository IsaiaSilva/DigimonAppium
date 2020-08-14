#Módulo para instanciar as classes

Dir[File.join(File.dirname(__FILE__),'../screens/*_screen.rb')].each { |file| require file }

module Screens
    
    #O método serve para que toda vez que chamar esse método ele vai verificar se a classe base foi instanciada,se sim ela não irá fazer nada ,se não ela irá instanciar a classe.
    def base
        @base ||= BaseScreen.new
    end
    
    #O método serve para que toda vez que chamar esse método ele vai verificar se a classe DigimonScreen foi instanciada,se sim ela não irá fazer nada, se não ela irá instanciar a classe.
    def digimon
        @digimon ||= DigimonScreen.new
    end


end