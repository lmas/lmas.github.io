-- Tries to read a local file and add it's contents as a code block.

function CodeBlock(el)
    if not el.classes:includes "include" then
        return
    end

    local file = el.text:match("^(.-)\n")
    local dir = pandoc.path.directory(PANDOC_STATE.input_files[1])
    if not file or dir == "" then
        return
    end
    local path = pandoc.path.join({dir, pandoc.path.normalize(file)})

    -- HACK: by using the zip module we can get contents AND modtime
    local entry = pandoc.zip.read_entry(path)
    local time = os.date('!%Y-%m-%d %H:%M UTC', entry.modtime)
    return {
        pandoc.Div(file .. ", " .. time, pandoc.Attr("", {"includeheader"})),
        pandoc.CodeBlock(entry.contents(entry), pandoc.Attr("", {"includefile"})),
    }
end

