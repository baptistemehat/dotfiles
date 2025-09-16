#!/bin/bash

main() {

    if  ! command -v forest > /dev/null; then
        # printf "⌛ "
        # printf "forest not installed"
        return
    fi


    if [[ "$(forest status | awk 'NR==2')" == "No recording started." ]]; then
        printf "⌛ "
        return
    fi

    project=$(forest status | sed $'s/\033\[[0-9;]*m//g' | awk 'NR==2{ print $5 }')
    # project_today=$(watson report -p ${project} -d | tail -n1 | grep  -Po "(\d+d )?(\d+h )?\d+m")
    # total_today=$(watson report -d | tail -n1 | grep  -Po "(\d+d )?(\d+h )?\d+m")
    total_today=$(forest report -d | tail -n1 | sed $'s/\033\[[0-9;]*m//g' | awk '{$1=$2=""; print $0}')


    # printf "⏳ %s %s | 📅 %s" "${project}" "${project_today}" "${total_today}"
    printf "⏳ %s %s | 📅 %s" "${project}" "${project_today}" "${total_today}"


}

main
