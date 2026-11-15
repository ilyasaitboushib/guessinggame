#!/bin/bash

function count_files {
    ls -1 | wc -l
}

correct=$(count_files)
guess=-1

echo "Combien de fichiers y a-t-il dans le dossier courant ?"

while [[ $guess -ne $correct ]]
do
    read -p "Entrez votre estimation : " guess
    if [[ ! $guess =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre."
        guess=-1
    elif [[ $guess -lt $correct ]]
    then
        echo "Trop bas, essayez encore."
    elif [[ $guess -gt $correct ]]
    then
        echo "Trop haut, essayez encore."
    fi
done

echo "Bravo ! Vous avez trouvé : $correct fichiers."
