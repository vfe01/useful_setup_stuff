function clg() {
    if [ $# != 1 ]
    then
        echo Usage: $0 *search_query*
    fi

    gnome-terminal -- firefox www.google.com/search?q=$1 &
}