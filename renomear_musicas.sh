#!/bin/zsh

# essa sulução não é a melhor, pois fica um espaço em branco no inicio do
# arquivo, o melhor a fazer no caso é usar o comando expr para localizar em que posição
# fica o caractere ] (no meu caso deu 24) e somar +1 a esse número, para incluir o
# espaço em branco, depois, renomear o arquivo para $variavel:numero_do_caractere

dest=$1
cd $dest


for nome in *
do
cabecalho=$(ls arquivo | awk -F] '{ print $1 }')

if [ $ex_arquivo == 'mp3' 
novo_nome=$(ls $nome | awk -F] '{ print $2 }')
mv $nome $novo_nome
done

