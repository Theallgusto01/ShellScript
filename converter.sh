#!/bin/zsh

cd ~/Documentos/imagens-livros/

if [ ! -d png ]
then
    mkdir png
fi

for imagens in *
do
   nome=$(ls $imagens | awk -F. '{ print $1}')
   convert $imagens png/$nome.png
done
