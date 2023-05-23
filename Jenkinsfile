pipeline {
  agent {label "ec2-server"}

  tools {
    // Especifica la herramienta de Git recomendada
    git 'Default'
    dockerTool 'docker'
  }

  stages {
    stage('Checkout') {
      steps {
        // Clonar el repositorio del proyecto utilizando la credencial de Git
        git credentialsId: 'GH-credentials', url: 'https://github.com/Adriangln11/fullstack-app-CI-CD'
      }
    }




    stage('Build Docker Image') {
      steps {
        // Construir la imagen Docker
        sh 'docker build -t fullstack-app-docker-image:tag .'
      }
    }


    stage('Deploy to EC2') {
      steps {
        // Conectar a la instancia EC2 y ejecutar la imagen Docker
        sh 'ssh user@ec2-instance "docker pull fullstack-app-docker-image:tag && docker run -d -p 80:3000 fullstack-app-docker-image:tag"'
      }
    }
  }
}
