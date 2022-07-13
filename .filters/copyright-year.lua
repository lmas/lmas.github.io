function Meta(meta)
        if meta.date then
                local format = "(%d+)-(%d+)-(%d+)"
                local y, m, d = pandoc.utils.stringify(meta.date):match(format)
                local date = os.time({
                        year = y,
                        month = m,
                        day = d,
                })
                local date_string = os.date("%Y", date)
                meta.copyright_year = pandoc.MetaString(date_string)
                return meta
        end
end
