Before do
    Appium::Driver.new(opts, true)
    Appium.promote_appium_methods Object
    @driver.start_driver
    @driver.set_wait(TWENTY_SECONDS)
  end
 
After do |scenario|   
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')

 #  if scenario.failed?
  #  tirar_foto(scenario_name.downcase!, 'falhou')
 #  else
 #   tirar_foto(scenario_name.downcase!, 'passou')
 # end

   @driver.quit_driver            
end
   