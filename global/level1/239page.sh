# page 239

import subprocess

# Liste des bases de chaînes à vérifier et à créer si nécessaire
base_chains = [
    ("input", "filter"),
    ("forward", "filter"),
    ("output", "filter")
]

# Parcourir chaque base de chaîne
for base_chain in base_chains:
    # Exécuter la commande "nft list ruleset | grep 'hook <base chain>'"
    command = f"nft list ruleset | grep 'hook {base_chain[0]}'"
    try:
        subprocess.check_output(command, shell=True, text=True)
        print(f"La base de chaîne {base_chain[0]} existe déjà.")
    except subprocess.CalledProcessError:
        # Si la commande renvoie une erreur, la base de chaîne n'existe pas
        print(f"La base de chaîne {base_chain[0]} n'existe pas. Création en cours...")
        
        # Créer la base de chaîne avec la commande "nft create chain"
        create_command = f"nft create chain inet {base_chain[1]} {base_chain[0]} {{ type filter hook {base_chain[0]} priority 0 ; }}"
        subprocess.run(create_command, shell=True)
        print(f"Base de chaîne {base_chain[0]} créée avec succès.")


