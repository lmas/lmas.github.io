-- Adds anchor links to headings with ids.

function Header(el)
    if not el.identifier then
        return el
    end

    local content = ''
    local target = '#' .. el.identifier
    local title = ''
    local attr = {class = 'anchor'}
    el.content:insert(pandoc.Link(content, target, title, attr))
    return el
end
