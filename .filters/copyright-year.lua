-- Adds correct copyright year to a post's meta, if it has a date.

function Meta(el)
    if not el.date then
        return el
    end

    local format = "(%d+)-(%d+)-(%d+)"
    local y, m, d = pandoc.utils.stringify(el.date):match(format)
    local date = os.time({year = y, month = m, day = d})
    local date_string = os.date("%Y", date)
    el.copyright_year = pandoc.MetaString(date_string)
    return el
end
