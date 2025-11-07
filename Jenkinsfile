pipeline {
	agent any
	
	stages {
		stage('Pull Code') {
			steps {
				git branch: 'main', url: 'https://github.com/Ujwalss/My-portfolio.git'
			}
		}
		
		stage('Build Docker Image') {
			steps {
				sh 'docker build -t my-portfolio:latest .'
			}
		}

		stage('Deploy Container') {
			steps {
				sh '''
				echo "Stopping old container if exit...."
				docker rm -f my-portfolio || true

				echo "Running new container..."
				docker run -d -p 8001:8001 --name my-portfolio my-portfolio:latest '''
			}
		}
	}
	
	post{
		success {
			echo '✅ Deployment successful! Visit http://localhost:8001'
		}
		failure {
			echo '❌ Deployment failed!'
		}
	}
}
