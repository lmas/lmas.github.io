-- Adds correct copyright year to a post's meta, if it has a date.

function Meta(meta)
    if not meta.date then
        return meta
    end

    local format = "(%d+)-(%d+)-(%d+)"
    local y, m, d = pandoc.utils.stringify(meta.date):match(format)
    local date = os.time({year = y, month = m, day = d})
    local date_string = os.date("%Y", date)
    meta.copyright_year = pandoc.MetaString(date_string)
    return meta
end
