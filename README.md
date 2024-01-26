# Funny Curl

Funny Curl est un script Bash/fonction simple qui vous permet d'effectuer des requêtes CURL avec des User-Agents amusants et variés. Vous avez la possibilité de choisir un User-Agent spécifique ou de laisser le script en choisir un au hasard parmi une liste prédéfinie.

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


# Intégration avec le Terminal (Linux/macOS)

Vous pouvez simplifier l'utilisation quotidienne de Funny Curl en l'intégrant comme une commande de terminal dans votre environnement. Voici comment vous pouvez le faire en utilisant le fichier de configuration de votre shell, comme `.bashrc` ou `.bash_aliases` :

1. **Ouvrez votre fichier de configuration :**

   ```bash
   nano ~/.bashrc
   ```

   ou

   ```bash
   nano ~/.bash_aliases
   ```

   Vous pouvez utiliser l'éditeur de texte de votre choix (`nano`, `vim`, etc.).

2. **Ajoutez une alias pour Funny Curl :**

   Ajoutez la ligne suivante à la fin de votre fichier :

   ```bash
   alias funny_curl='. /chemin/vers/funny_curl.sh'
   ```

   Assurez-vous de remplacer `/chemin/vers/` par le chemin réel où se trouve le fichier `funny_curl.sh`.

3. **Sauvegardez et quittez l'éditeur :**

   - Pour `nano`, appuyez sur `Ctrl + X`, puis suivez les instructions pour sauvegarder et quitter.

4. **Rechargez le fichier de configuration :**

   ```bash
   source ~/.bashrc
   ```

   ou

   ```bash
   source ~/.bash_aliases
   ```

   Assurez-vous de recharger le fichier approprié selon celui que vous avez édité.

5. **Utilisez Funny Curl comme une commande :**

   Désormais, vous pouvez utiliser Funny Curl directement dans votre terminal comme une commande. Voici quelques exemples :

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

Maintenant, vous pouvez profiter de Funny Curl comme une commande pratique dans votre terminal au quotidien.

## Contribuer

Si vous souhaitez contribuer, n'hésitez pas à ouvrir une issue ou à proposer une pull request.

---

**Note :** Assurez-vous de sourcer le script (`.` ou `source funny_curl.sh`) pour une utilisation correcte.

**Choix Aléatoire par Défaut :** Si aucun User-Agent n'est spécifié, le script en choisira un au hasard parmi la liste prédéfinie.

Happy CURLing! 🚀

