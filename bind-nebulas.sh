#!/bin/bash


main() {
    home=''

    while [ -n "$1" ]
    do
        case "$1" in
            --home) home="$2" ;;
        esac
        shift
    done



}

main $@