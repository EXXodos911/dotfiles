-- Force chromium-based browsers into a tile to deal with --app bug

hl.window_rule({
    match = {class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|Vivaldi-stable|helium)"},
    tile = true,
})
