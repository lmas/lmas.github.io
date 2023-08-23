-- Adds anchor links to headings with ids.

function Header(head)
    if not head.identifier then
        return head
    end

    local content = ''
    local target = '#' .. head.identifier
    local title = ''
    local attr = {class = 'anchor'}
    head.content:insert(pandoc.Link(content, target, title, attr))
    return head
end
