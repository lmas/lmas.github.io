-- Adds lazy loading to images.

function Image(el)
    el.attributes.loading = "lazy"
    return el
end
