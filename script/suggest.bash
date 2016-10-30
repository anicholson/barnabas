function _barnabas_suggest {
  wesuggestchance=6
  suggest=$((RANDOM % wesuggestchance))

  [[ 0 -eq $suggest ]] && barnabas suggest
}

_barnabas_suggest
