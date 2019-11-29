function title {
    echo -ne "\033]0;"$*"\007"
}

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

# added by travis gem
[ -f /Users/remillardj/.travis/travis.sh ] && source /Users/remillardj/.travis/travis.sh
