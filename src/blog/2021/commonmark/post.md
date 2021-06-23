---
title: Commonmark reference
published: 2021-06-12
short: Reference for all the formatting options from commonmark
tags:
- commonmark
- documentation
---

This is a reference page for a small part of the formatting options from the [Commonmark specification ![Markdown](markdown-mark.png)](https://commonmark.org/)
A couple of extra extensions has been enabled:

- [Github flavoured: Autolinks](https://github.github.com/gfm/#autolinks-extension-)
- [Github flavoured: Strikethrough](https://github.github.com/gfm/#strikethrough-extension-)
- [Github flavoured: Tables](https://github.github.com/gfm/#tables-extension-)
- [Github flavoured: Task lists](https://github.github.com/gfm/#task-list-items-extension-)
- [PHP flavoured: Definition lists](https://michelf.ca/projects/php-markdown/extra/#def-list).

The underlying implementation is done by the [Goldmark package](https://github.com/yuin/goldmark) for Go.

## Common formatting

        # Heading 1
# Heading 1

        ## Heading 2
## Heading 2

        ### Heading 3
### Heading 3

        Normal text
Normal text

        *Italic*
*Italic*

        **Bold**
**Bold**

        ~~Strikethrough~~
~~Strikethrough~~

        Example autolink www.example.com
Example autolink www.example.com

        [Example link](http://www.example.com)
[Example link](http://www.example.com)

        ![Example Image](markdown-mark.png)
![Example image](markdown-mark.png)

        `Inline code`
`Inline code`

        > Blockquote
> Blockquote

## Horizontal ruler
        ---
---

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

        - [x] foo
        - [ ] bar
        - [x] baz

- [x] foo
- [ ] bar
- [x] baz

## Definition list

        Apple
        : Pomaceous fruit of plants of the genus Malus in
          the family Rosaceae.

        Orange
        : The fruit of an evergreen tree of the genus Citrus.

Apple
: Pomaceous fruit of plants of the genus Malus in
  the family Rosaceae.

Orange
: The fruit of an evergreen tree of the genus Citrus.

## Indented code block
    <tab or 4 spaces> # Indented code block
    <tab or 4 spaces> print 'indent 4 spaces'

*break*

    # Indented code block
    print 'indent 4 spaces'

## Code fence

        ```
        # Code fence
        print '3 backticks'
        ```

```
# Code fence
print '3 backticks'
```

## Syntax highlighting

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

## Table

        | Column1 | Column2 |
        | --- | --- |
        | foo | bar |
        | baz | bim |

| Column1 | Column2 |
| --- | --- |
| foo | bar |
| baz | bim |

