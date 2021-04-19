function jekyll() {
    docker run --rm -it --volume="$(pwd):/srv/jekyll" --network host \
        jekyll/minimal jekyll $*
}
