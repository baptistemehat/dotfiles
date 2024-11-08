#!/bin/bash

main() {
    #
    # if  ! command -v watson > /dev/null; then
    #     printf "⌛ "
    #     printf "watson not installed"
    #     return
    # fi
    #
    #
    # if [[ "$(watson status)" == "No project started." ]]; then
    #     printf "⌛ "
    #     return
    # fi
    #
    # project=$(watson status | awk '{ print $2 }')
    # project_today=$(watson report -p ${project} -d | tail -n1 | grep  -Po "(\d+d )?(\d+h )?\d+m")
    # total_today=$(watson report -d | tail -n1 | grep  -Po "(\d+d )?(\d+h )?\d+m")
    #
    #
    # printf "⏳ %s %s | 📅 %s" "${project}" "${project_today}" "${total_today}"
    #

}

main
