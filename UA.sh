#!/bin/bash

# Vérifier si le script est exécuté directement ou sourcé
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Erreur : Ce script doit être sourcé, pas exécuté directement."
    exit 1
fi

# Trouver le répertoire du script, même en cas de sourcing depuis un autre dossier
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UAconf="${SCRIPT_DIR}./conf/UA.conf"

# Charger les User-Agents depuis le fichier UA.conf
# shellcheck source=../configurations/UA.conf
source "$UAconf"

# Fonction pour afficher l'aide
display_help() {
    echo "Utilisation : funny_curl [NOM_USER_AGENT] [OPTIONS_CURL]"
    echo "Si NOM_USER_AGENT est fourni, utilise le User-Agent correspondant, sinon utilise un User-Agent aléatoire."
    echo "Options disponibles :"
    echo "  -h, --help      Affiche cette aide."
    echo "Liste des noms d'User-Agents disponibles :"
    for ua_name in $(grep -E '^[a-zA-Z_][a-zA-Z0-9_]*=' "$UAconf" | cut -d'=' -f1); do
        echo "  $ua_name"
    done
}

function funny_curl() {
    # Déterminer le nom de la User-Agent et l'URL en analysant les arguments
    user_agent_name=""
    url=""
    options=()

    for arg in "$@"; do
        if [[ "${arg}" == "http"* ]]; then
            url="${arg}"
        elif [[ "${arg}" == "-"* ]]; then
            options+=("${arg}")
        else
            user_agent_name="${arg}"
        fi
    done

    # Vérifier si l'option d'aide est spécifiée
    if [[ "${options[*]}" =~ "-h" ]] || [[ "${options[*]}" =~ "--help" ]]; then
        display_help
        return
    fi

    # Vérifier si la User-Agent a été spécifiée, sinon en choisir une au hasard
    if [ -z "$user_agent_name" ]; then
        user_agent_name=$(grep -E '^[a-zA-Z_][a-zA-Z0-9_]*=' "$UAconf" | cut -d'=' -f1 | shuf -n 1)
    fi
    
    # Vérifier si l'URL a été spécifiée
    if [ -z "$url" ]; then
        echo "Erreur : Veuillez spécifier une URL."
        return
    fi
    
    # Vérification et attribution du User-Agent
    if [ -n "${!user_agent_name}" ]; then
        # Utiliser curl avec la User-Agent spécifiée et les options
        curl "${options[@]}" -A "${!user_agent_name}" "$url"
    else
        # Afficher l'aide si l'option d'aide est spécifiée, sinon afficher l'erreur
        [ "${options[*]}" != "-h" ] && [ "${options[*]}" != "--help" ] && echo "Erreur : Nom d'User-Agent non valide."
        display_help
        return 1
    fi
}

# Si le script est sourcé, ne liste pas automatiquement les User-Agents
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    return
fi

# Exemples d'utilisation :
# funny_curl -s https://exemple.com
# funny_curl https://exemple.com -sL
# funny_curl -L https://exemple.com -s
# funny_curl -sL https://exemple.com
# Vous pouvez spécifier la User-Agent, l'URL et les options dans n'importe quel ordre
# Utiliser un User-Agent spécifique
# funny_curl -sL TempleOS "https://www.whatsmyua.info/api/v1/ua"
# funny_curl TempleOS "https://www.whatsmyua.info/api/v1/ua" -sL
# funny_curl -sL "https://www.whatsmyua.info/api/v1/ua" TempleOS
# funny_curl "https://www.whatsmyua.info/api/v1/ua" TempleOS -sL
# funny_curl "https://www.whatsmyua.info/api/v1/ua" -sL TempleOS
