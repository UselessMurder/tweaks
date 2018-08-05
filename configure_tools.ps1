function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}


