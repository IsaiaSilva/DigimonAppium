pipeline {
    agent { label 'windows-isaias' }
    options {
        disableConcurrentBuilds()
        skipDefaultCheckout()
        buildDiscarder(logRotator(numToKeepStr: '40'))
        timeout(time: 8, unit: 'HOURS')
    }

    stages {
        stage("Checkout"){
	        parallel {
				stage("automacao") {
					steps {
	            		dir('digimon_appium'){
	            	    	git credentialsId: "isaiasilva", url: "https://github.com/IsaiaSilva/DigimonAppium.git"
	            	    }
					}
				}
	        }
        }



		stage("Tests"){
	        parallel {
                stage('ui') {
                    steps {
                    	dir('digimon_appium'){
							bat """
							    bundle exec cucumber"
							    """
                        }
                    }
                }
	        }
        }
    }

    post {
        always {
	    //    archiveArtifacts '**/target/site/serenity/*'
	    //    junit allowEmptyResults: true, testResults: '**/target/*.xml'
	    //    livingDocs featuresDir: 'smart-web-automated-tests/target', format: 'ALL'
	    //    cucumber fileIncludePattern: '**/run_smartweb.json', sortingMethod: 'ALPHABETICAL'
        }
    }
}