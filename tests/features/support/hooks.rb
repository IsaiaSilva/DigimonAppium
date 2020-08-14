Before do
    Appium::Driver.new(opts, true)
    Appium.promote_appium_methods Object
    @driver.start_driver
    @driver.set_wait(TWENTY_SECONDS)
  end
 
After do |scenario|   
  time = Time.new
	Dir.mkdir('reports') unless Dir.exist?('reports')

	sufix = ('fail' if scenario.failed?) || 'sucess'
	name = scenario.name.tr(' ','_').downcase

  screenshot("reports/#{sufix}_#{name}_#{time.day}-#{time.month}-#{time.year}.png")
  
#  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')

 #  if scenario.failed?
  #  tirar_foto(scenario_name.downcase!, 'falhou')
 #  else
 #   tirar_foto(scenario_name.downcase!, 'passou')
 # end

   @driver.quit_driver            
end
   