#!/bin/bash


CoffeeLover='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 CoffeeBot/1.0'
LostDev='Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko Firefox/99.0 (LOST-IE)'
CaptainObvious='TotallyNotACurlScript/1.0 (definitely not pretending to be Chrome/99.0.9999.99)'
CryptoNinja='BitcoinMiner/9000.0 (X11; Linux x86_64) Brave/42.0.0.0 Safari/1337.7'
NotAPinguin='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/99.0.0.0 (Not Linux Penguin)'
TempleOS='TempleOSExplorer/1.0 (TempleBot/16.0; HolyCScript) DivineEngine/20231220' # The OS of God !
DavidBowie='ZiggyStardust/2.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko Firefox/99.0 (SingingSpider)'
ImNotABot='Mozilla/5.0 (Imnotabot Windows OSX 10.0; Linux_64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/99.0.0.0 (I promise)'
PS2W11='Mozilla/5.0 (PlayStation; PlayStation 2/8.00; Windows NT 10.0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15'
JamesCurl='Mozilla/5.0 (Licence To LOL; Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 StealthBot/007'
QuakeALot='DuckDuckGoose/42.0 (Quackintosh; DuckOS 11.2; like Gecko) Chrome/123.0.0.0 Safari/789.0'


funny_curl() {
    local user_agents=(
        ${CoffeeLover}
        ${LostDev}
        ${CaptainObvious}
        ${CryptoNinja}
        ${NotAPinguin}
        ${TempleOS}
        ${DavidBowie}
        ${ImNotABot}
        ${PS2W11}
        ${JamesCurl}
        ${QuakeALot}
    )




    local user_agent_arg=$1
    local options=("${@:2}")

    local user_agent=""
    
    if [ -n "${user_agent_arg}" ] && [[ "${user_agent_arg}" =~ CoffeeLover|LostDev|CaptainObvious|CryptoNinja|NotAPinguin|TempleOS|DavidBowie|ImNotABot|PS2W11|JamesCurl|QuakeALot ]]; then
        # If a valid User-Agent is provided, use it
        user_agent="${!user_agent_arg}"
        shift
    else
        # Otherwise, choose a random User-Agent
        user_agent="${user_agents[RANDOM % ${#user_agents[@]}]}"
    fi
    
    curl -A "${user_agent}" "${options[@]}"
}

# Exemple d'utilisation :
# Utiliser un User-Agent spécifique
# funny_curl CoffeeLover -sL http://example.com

# Utiliser un User-Agent aléatoire
# funny_curl -sL http://example.com CoffeeLover
