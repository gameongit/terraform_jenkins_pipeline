pipeline{
    agent any
    stages{
        stage('download_modules'){
            steps {
                dir (''){
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false,
                        submoduleCfg: [],
                        userRemoteConfigs: [[
                            credentialsId: '',
                            url: 'https://github.com/gameongit/terraform_jenkins_pipeline.git'
                        ]]
                    ])
                }
            }
        }
        stage('init') { // for terraform initilization
            steps {
                dir (''){
                    sh label: 'Initialize Terraform', script: "/usr/bin/terraform init"
                }
            }
        }

        stage('plan') {
            steps {
                dir (''){
                    sh label: 'Plan Terraform', script: "/usr/bin/terraform plan -out=tfplan -input=false -var image_name=${image_name} -var ghost_ext_port=${ghost_ext_port}"
                    script {
                        timeout(time: 10, unit: 'MINUTES') {
                            input(id: "Deploy Gate", message: "Deploy environment?", ok: 'Deploy')
                        }
                    }
                }
            }
        }
    
        stage('apply') {
            steps {
                dir ('') {
                    sh label: 'Deploy Infrastructure', script: "/usr/bin/terraform apply -lock=false -input=false tfplan"
                }
            }    
        }

    }
}
