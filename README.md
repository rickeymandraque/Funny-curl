# Funny Curl

Funny Curl est un script Bash simple qui vous permet d'effectuer des requêtes CURL avec des User-Agents amusants et variés. Vous avez la possibilité de choisir un User-Agent spécifique ou de laisser le script en choisir un au hasard parmi une liste prédéfinie.

## Installation

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/funny-curl.git
   cd funny-curl
   ```

2. Assurez-vous que le script est sourcé et non exécuté directement :
   ```bash
   . funny_curl.sh
   ```

## Utilisation

### Syntaxe de Base

```bash
funny_curl [NOM_USER_AGENT] [OPTIONS_CURL] URL
```

- Si `NOM_USER_AGENT` est fourni, le script utilisera le User-Agent correspondant. Sinon, il en choisira un au hasard.
- Vous pouvez spécifier des options CURL normales après le nom de l'URL.

### Exemples d'utilisation

- Utiliser un User-Agent spécifique :
  ```bash
  funny_curl TempleOS -sL http://example.com
  ```

- Utiliser un User-Agent au hasard :
  ```bash
  funny_curl -sL http://example.com
  ```

- Liste des User-Agents disponibles :
  ```bash
  funny_curl -h
  ```

### Fichier de Configuration UA.conf

Le fichier `UA.conf` contient la définition des User-Agents. Vous pouvez ajouter, modifier ou supprimer des User-Agents selon vos besoins.

## Contribuer

Si vous souhaitez contribuer, n'hésitez pas à ouvrir une issue ou à proposer une pull request.

---

**Note :** Assurez-vous de sourcer le script (`.` ou `source funny_curl.sh`) pour une utilisation correcte.

**Choix Aléatoire par Défaut :** Si aucun User-Agent n'est spécifié, le script en choisira un au hasard parmi la liste prédéfinie.

Happy CURLing! 🚀

