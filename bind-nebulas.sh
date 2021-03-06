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

    echo "home is $home"

    # ln -s "$home/nebulae/"

    # external context SYMLINKS are not supported by docker
    for file in $(ls ./nebulae)
    do
        # sudo ln -fs "$PWD/nebulae/$file" "$home/nebulae/$file"
        cp -f "$PWD/nebulae/$file" "$home/nebulae/$file"
    done


    if [ -z "/home/extractor-configs/" ]
    then
        mkdir -p "/home/extractor-configs"
    fi

    for file in $(ls ./extractors)
    do
        # sudo ln -fs "$PWD/extractors/$file" "/home/extractor-configs/$file"
        cp -f "$PWD/extractors/$file" "/home/extractor-configs/$file"
    done

    bash apply.sh 'up -d'
}

main $@