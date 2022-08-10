SRC := "src"
DST := "docs"
BUILDBRANCH := "gh-pages"

# Show available recipes by default
default:
    @just --list

# Rebuild the site from source
buildblog: clean
    ./.scripts/buildblog "{{SRC}}" "{{DST}}"

# Rebuild the site and serve it with a local webserver for debugging
serve: buildblog
    python -m http.server --directory "{{DST}}"

# Run shell linter for all files in .scripts/
checkscripts:
    shellcheck .scripts/*

# Remove the built site
clean:
    rm -rf "{{DST}}"

########################################################################################################################

# Sets up a build output branch
setupbranch: clean
    git switch --orphan "{{BUILDBRANCH}}"
    mkdir -p "{{DST}}/news"
    touch "{{DST}}/news/.gitkeep"
    git add "{{DST}}"
    git commit -m "Initializes build branch"
    @echo ""
    @echo "Done, don't forget to manually push the branch to your remote!"

