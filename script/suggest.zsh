function _barnabas_suggest {
    ((we_suggest_chance = 6))
    ((suggest = $RANDOM % $we_suggest_chance))

    [[ 0 -eq $suggest ]] && barnabas suggest

}


_barnabas_suggest
