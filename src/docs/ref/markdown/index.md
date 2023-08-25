---
title: Markdown reference
date: 2021-06-13
toc: true
banner: ./banner.jpg
banner-alt: Markdown code and shell script
---

A quick reference page for most of this blog's flavour of Markdown.

In the back it's all running on [Pandoc] with the [Github Formatted Markdown] extension enabled,
which in turn is based on the [Commonmark Specification].

[Pandoc]: https://pandoc.org/MANUAL.html
[Github Formatted Markdown]: https://github.github.com/gfm/
[Commonmark Specification]: https://commonmark.org/


# Inline formatting

| Code | Formatted text |
|------|----------------|
| `*Italic*` | *Italic* |
| `**Bold**` | **Bold** |
| `~~Strikethrough~~` | ~~Strikethrough~~ \* |
| \`Inline code\` | `Inline code` |
| `<sub>Sub</sub>script` | <sub>Sub</sub>script |
| `<sup>Super</sup>script` | <sup>Super</sup>script |

\* This is an extension to Commonmark.

# Paragraphs

A sequence of non-blank text lines, where the newlines will be replaced with spaces instead.

It's recommended to write a sentence per line for easier writing/editing and inserting blank lines between
the sentences to break them up into different paragraphs.

    First line.
    Second line.
    These 3 lines will form a paragraph.

    First line of second paragraph.

First line.
Second line.
These 3 lines will form a paragraph.

First line of second paragraph.

# Backslash escapes

Any punctuation character can be escapade with a backslash:

    \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

While backslashes before any other characters will be treated as a literal backslash:

    \→\A\a\ \3\«

\→\A\a\ \3\«

This can be used to cancel Markdown formatting:

    \# This will not be formatted as a heading

\# This will not be formatted as a heading



# Blockquotes

    > Hello
    > World
    >
    > and blockquotes.

> Hello
> World
>
> and blockquotes.

# Code blocks

## Indented code block

    <four or more spaces>Indented line of text
    <four or more spaces>**where no further styling is performed

*(line break to break up the code blocks)*

    Indented line of text
    **where no further styling is performed

## Fenced code block

    ```
    package main

    import "fmt"

    func main(){
        fmt.Println("hello world")
    }
    ```

```
package main

import "fmt"

func main(){
    fmt.Println("hello world")
}
```

# Footnotes

This is an extension to Commonmark.

    Simple footnote[^1]

    [^1]: First note

Simple footnote[^1]

[^1]: First note

# Headings

    # Heading 1

*See above heading.*

    ## Heading 2

## Heading 2

    ### Heading 3

### Heading 3

    #### Heading 4

#### Heading 4

    ##### Heading 5

##### Heading 5

    Normal text

# Horizontal ruler

    ---

---

# Links

## Autolink

    <https://www.example.com>

<https://www.example.com>

## Inline link

    [link](http://www.example.com "title")

[link](http://www.example.com "title")

## Internal link

    See the [Headings](#headings).

See the [Headings](#headings).

## Link reference

The link title is optional.

    Some text with a [link].
    Some more.

    [link]: http://www.example.com "title"


Some text with a [link].
Some more.

[link]: http://www.example.com "title"

# Images

    ![image](/style/larus.png "title for the img")

![image](/style/larus.png "title for the img")

# Lists

## Unordered list

    - List
    - List
    - List

- List
- List
- List

## Ordered list

    1. One
    2. Two
    3. Three

1. One
2. Two
3. Three

## Task list

This is an extension to Commonmark.

    - [x] foo
    - [ ] bar
    - [x] baz

- [x] foo
- [ ] bar
- [x] baz

# Math

This is an extension to Commonmark.

Full syntax for LaTeX can be found at [Wikibooks].

    $\sqrt{3x-1} + (1+x)^2 \times \alpha$

$\sqrt{3x-1} + (1+x)^2 \times \alpha$

[Wikibooks]: https://en.wikibooks.org/wiki/LaTeX/Mathematics



# Raw HTML

Lines can begin with a standard HTML tag to produce corresponding raw HTML in the output.
Whitelisted HTML tags:

```
address, article, aside, base, basefont, blockquote, body, caption, center, col, colgroup, dd, details, dialog, dir,
div, dl, dt, fieldset, figcaption, figure, footer, form, frame, frameset, h1, h2, h3, h4, h5, h6, head, header, hr,
html, iframe, legend, li, link, main, menu, menuitem, nav, noframes, ol, optgroup, option, p, param, pre, section,
source, script, style, summary, table, tbody, td, tfoot, th, thead, title, tr, track, ul,
```

Example:

    <div class="row">
        <img src="img.png">
        <p>Hello</p>
    </div>

# Tables

This is an extension to Commonmark.

    | # | Column1 | Column2 |
    | - | --- | --- |
    | 1 | foo | bar |
    | 2 | baz | bim |
    | 3 | abc | def |

| # | Column1 | Column2 |
| - | --- | --- |
| 1 | foo | bar |
| 2 | baz | bim |
| 3 | abc | def |

That's all for now!
