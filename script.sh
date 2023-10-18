#!/bin/bash
echo "Verificando existencia de java e sua versao"


    
    sudo apt update && sudo apt upgrade -y



  
    java -version
    if [ $? = 0 ]; then
        echo “java já instalado?”
    else
        echo "Gostaria de instalar o Java? [s/n]"
        read get
        if [ \“$get\” == \“s\” ]; then
            sudo apt install openjdk-17-jre -y
        else
            echo "O Java não foi instalado"
            exit 1
        fi
    fi



    ls | grep "prototipo-inovacao.jar"

    if [ $? = 0 ]; then
        echo "Iniciando o Infoguard."
        java -jar prototipo-inovacao.jar
    else
        echo "Instalando o Infoguard..."
        curl -o prototipo-inovacao.jar -LJO https://github.com/winycios/desafioSO/raw/main/prototipo-inovacao.jar
        if [ $? -eq 0 ]; then
            echo "Instalação concluída!"
            echo "Iniciando o Infoguard."
            java -jar prototipo-inovacao.jar
        else
            echo "O curl encontrou um erro."
        fi
    fi
