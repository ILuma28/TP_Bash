# VANHAUWAERT Julien TP Bash

# On crée le fichier stats.txt
echo '' > result.txt

# -z envoie True si la longueur du paramètre est de zéro, on vérifie donc si le paramètre existe bien. -e vérifie lui si le fichier existe.
if [ -z $1 ] || [ ! -e $1 ]
then
    echo "Veuillez entrer un fichier .txt existant en paramètre"
    exit 1

fi

#Si il n'y a pas de deuxième paramètre
if [ -z $2 ]
then
    echo "1 paramètre :"
    echo "Classement des lettres les plus utilisées dans le fichier donné"
    echo ""

    # Pour chaque lettre de A à Z
    for lettre in {A..Z}
    do
        # l'option -c permet de compter le nombre d'occurences de la lettre dans le fichier en paramètre 1 puis >> result.txt envoie le résultat dans le fichier result.txt
        echo "$lettre : `grep -c $lettre $1`" >> result.txt
    # -k3,3 spécifie que nous trions le fichier en utilisant la troisième chaîne de caractères de chaque ligne (Ici, celle qui correspond au nombre d'occurences).Ensuite, on trie avec nr qui a pour effet de trier numériquement dans l'ordre croissant puis d'inverser le fichier. Ainsi, le fichier affichera du plus grand au plus petit nombre d'occurences.
    done && echo "`sort -k3,3nr result.txt`"

# Si il existe un deuxième paramètre
elif [ ! -z $2 ]
then
    echo "2 paramètres :"
    echo "Si vous souhaiter trier les voyelles les plus utilisées, écrivez 'voyelle' en second paramètre"
    echo "Si vous souhaiter trier les consonnes les plus utilisées, écrivez 'consonne' en second paramètre"
    # Si le paramètre entré est voyelle
    if [ $2 = "voyelle" ]
    then
    	# Pour chaque voyelle
	for lettre in {A,E,I,O,U,Y}
	do
	    # On compte le nombre d'occurences de chaque lettre
	    echo "$lettre : `grep -c $lettre $1` - $lettre" >> result.txt
	# On trie en fonction de la 3eme chaîne de caractères numériquement et on inverse (ordre décroissant)
	done && echo "`sort -k3,3nr result.txt`"
    elif [ $2 = "consonne" ]
    then
    	# Pour chaque consonne
	for lettre in {B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,W,X,Z}
	do
	    # On compte le nombre d'occurences de chaque lettre
	    echo "$lettre : `grep -c $lettre $1`" >> result.txt
	# On trie en fonction de la 3eme chaîne de caractères numériquement et on inverse (ordre décroissant)
	done && echo "`sort -k3,3nr result.txt`"
    else
    	echo "Deuxième paramètre incorrect, veuillez réessayer"
    fi
fi

# Suppression du fichier de résultats
echo "`rm result.txt`"

# Fin du script
exit 