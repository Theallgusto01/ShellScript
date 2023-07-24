#Autor: Thiago Augusto
#Data:21/07/2023
#Organizador de Pasta Cabulosa

# .pdf, .docx, .txt   -> ~/Documentos/Docs
# .epub               -> ~/Livros
# .zip, .tar, .gz     -> ~/Documentos/Compactados
# .png, .jpg, .gif... -> ~/Imagens
# .mp4...	            -> ~/Videos
# .mp3...	            -> ~/Músicas
# .iso...             -> ~/Documentos/ISOs
# .jar, .sh, .deb,    -> ~/Documentos/Executaveis

# No nome do arquivo...
#'_ifce'	            -> ~/Documentos/Estudos/IFCE
#'_est'		            -> ~/Documentos/Estudos/

# O Script deve executar diáriamente para organizar a pasta de Dowloads, e, caso não exista, criar o diretório#

#!/bin/bash

organizar=$1

function mostrar_extensao(){
 arquivo=$1
 ext="${arquivo##*.}"
 echo $ext
}

remover_espacos(){

  
  echo $(echo $1 | tr -d ' ')


}

preparar(){

  #Cria arquivo com todos os diretórios a serem criados pelo script

  #Diretorios a serem criados

  
  #separadores=("ifce" "est") 
  diretorios=("$HOME/Documentos/Docs" "$HOME/Documentos/Compactados" "$HOME/Imagens" "$HOME/Vídeos" "$HOME/Músicas" "$HOME/Documentos/Estudos" "$HOME/Documentos/Estudos/IFCE" "$HOME/Documentos/ISOs" "$HOME/Documentos/Executaveis")


  #Cria todos os diretórios caso não existam
  for dir in ${diretorios[@]}; do
      if [ ! -d $dir ]; then
        mkdir -p $dir
        echo "O Diretório $dir foi criado"
      else
        echo "O Diretório $dir já existe"
      fi
  done
}

organizar(){

  #Percorer o local a ser organizado e transferir cada arquivo para o respectivo diretório

  cd $organizar

   for arquivo in * ; do

     if [ ! -d "$arquivo" ]
     then

      nome_arquivo_sem_espacos=$(remover_espacos "$arquivo")
     
      case $(mostrar_extensao $nome_arquivo_sem_espacos) in
        'pdf' | 'docx' | 'epub' | 'txt') mv "$arquivo" ${diretorios[0]};;
        'zip' |  'tar' | 'gz')           mv "$arquivo" ${diretorios[1]};;
        'png' | 'jpg' | 'jpeg' | 'gif')  mv "$arquivo" ${diretorios[2]};;
        'mp4')                           mv "$arquivo" ${diretorios[3]};;
        'mp3')                           mv "$arquivo" ${diretorios[4]};;
        'iso')                           mv "$arquivo" ${diretorios[7]};;
        'jar' | 'sh' | 'deb' | 'py' | 'run' | 'apk' | 'c')  mv "$arquivo" ${diretorios[8]};;
        *)  echo "Sem lugar para o arquivo $arquivo -> Extensão: $(mostrar_extensao $arquivo) :(";;
        esac
     
     fi    
  done
 }
   
 
 preparar  
 organizar
 

 if [ $? -eq 0 ]; then
     echo "Script executado com sucesso :)"
   else 
     echo "Erro ao executar o script :("
 fi
