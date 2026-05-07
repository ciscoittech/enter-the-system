// From Prompts to Pipelines — Master Typst template
// Compiles all chapters + front/back matter into a single PDF
// with continuous page numbers, combined TOC, and running headers.

// ─── Pandoc compatibility ─────────────────────────────────────
// Pandoc generates these when converting markdown → typst
#let horizontalrule = {
  v(1em)
  align(center, rect(width: 30%, height: 0.5pt, fill: rgb("#D4C9B8"), stroke: none))
  v(1em)
}

// ─── Page setup ───────────────────────────────────────────────
#set page(
  width: 7.5in,
  height: 9.25in,
  margin: (
    inside: 1.25in,
    outside: 1in,
    top: 0.85in,
    bottom: 1in,
  ),
  binding: left,
  header: context {
    let page-num = counter(page).get().first()
    // No headers on chapter opening pages or frontmatter
    if counter(page).get().first() <= 1 { return }

    let chapter-title = {
      let headings = query(heading.where(level: 1))
      let before = headings.filter(h => h.location().page() <= here().page())
      if before.len() > 0 {
        before.last().body
      } else {
        none
      }
    }

    if chapter-title == none { return }

    set text(size: 8pt, font: "Source Sans 3", fill: rgb("#8B7D6B"))
    if calc.odd(page-num) {
      // Recto (right page): chapter title on right
      h(1fr) + emph(chapter-title)
    } else {
      // Verso (left page): book title on left
      emph[From Prompts to Pipelines] + h(1fr)
    }
  },
  footer: context {
    let page-num = counter(page).get().first()
    set text(size: 8pt, font: "Source Sans 3", fill: rgb("#8B7D6B"))
    set align(center)
    str(page-num)
  },
)

// ─── Typography ───────────────────────────────────────────────
#set text(
  font: "Source Serif 4",
  size: 11pt,
  fill: rgb("#1a1a1a"),
  lang: "en",
)

#set par(
  leading: 0.65em * 1.3,  // ~1.3 line height
  justify: true,
)

// Headings
#show heading.where(level: 1): it => {
  // Chapter headings: start on recto (right) page
  pagebreak(weak: true, to: "odd")
  v(2in)
  set text(font: "Source Sans 3", size: 24pt, weight: "bold", fill: rgb("#2B4C6F"))
  it
  v(0.5in)
}

#show heading.where(level: 2): it => {
  v(1.5em)
  set text(font: "Source Sans 3", size: 16pt, weight: "semibold", fill: rgb("#2B4C6F"))
  it
  v(0.75em)
}

#show heading.where(level: 3): it => {
  v(1em)
  set text(font: "Source Sans 3", size: 13pt, weight: "semibold", fill: rgb("#2B4C6F"))
  it
  v(0.5em)
}

// Code blocks
#show raw.where(block: true): it => {
  set text(font: "Source Code Pro", size: 9pt)
  block(
    width: 100%,
    fill: rgb("#F7F3ED"),
    stroke: 0.5pt + rgb("#D4C9B8"),
    radius: 4pt,
    inset: 12pt,
    it,
  )
}

// Inline code
#show raw.where(block: false): it => {
  set text(font: "Source Code Pro", size: 9.5pt)
  box(
    fill: rgb("#F7F3ED"),
    inset: (x: 3pt, y: 0pt),
    radius: 2pt,
    it,
  )
}

// Block quotes
#show quote.where(block: true): it => {
  block(
    width: 100%,
    inset: (left: 16pt, y: 8pt),
    stroke: (left: 2pt + rgb("#C8873D")),
    it,
  )
}

// Images — constrain to page width
#show image: it => {
  align(center, block(width: 100%, it))
}

// Links
#show link: it => {
  set text(fill: rgb("#2B4C6F"))
  underline(it)
}

// Note: horizontal rules handled by #horizontalrule from pandoc conversion

// Widow/orphan control
#set par(hanging-indent: 0pt)

// ─── Frontmatter ──────────────────────────────────────────────

// Half-title page
#page(header: none, footer: none)[
  #v(3in)
  #align(center)[
    #set text(font: "Source Serif 4", size: 18pt, style: "italic", fill: rgb("#2B4C6F"))
    From Prompts to Pipelines
  ]
]

// Blank verso
#page(header: none, footer: none)[]

// Title page
#page(header: none, footer: none)[
  #v(1.5in)
  #set text(font: "Source Sans 3")

  #text(size: 32pt, weight: "bold", fill: rgb("#2B4C6F"))[From Prompts\ to Pipelines]

  #v(0.3in)

  #text(size: 13pt, fill: rgb("#C8873D"))[A Systems-Based Approach to\ Prompt Engineering and Agentic Workflows]

  #v(1fr)

  #line(length: 100%, stroke: 0.75pt + rgb("#C8873D"))
  #v(0.15in)
  #grid(
    columns: (1fr, auto),
    text(size: 11pt, weight: "medium", tracking: 2pt, fill: rgb("#2B4C6F"))[TERRENCE HUNT],
    text(size: 9pt, weight: "light", tracking: 1pt, fill: rgb("#8B7D6B"))[FIRST EDITION],
  )
]

// Blank verso
#page(header: none, footer: none)[]

// Copyright page
#page(header: none, footer: none)[
  #v(1fr)
  #set text(size: 9pt, fill: rgb("#444"))

  *From Prompts to Pipelines*\
  _A Systems-Based Approach to Prompt Engineering and Agentic Workflows_

  #v(0.5em)
  First Edition, 2026

  #v(1em)
  Copyright © 2026 Terrence Hunt. All rights reserved.

  #v(0.5em)
  No part of this publication may be reproduced, distributed, or transmitted in any form or by any means without the prior written permission of the author, except for brief quotations in reviews and certain noncommercial uses permitted by copyright law.

  #v(1em)
  While every effort has been made to ensure accuracy, the author assumes no responsibility for errors, omissions, or damages resulting from the use of information contained herein. AI tools and their capabilities change rapidly; verify current behavior against official documentation.

  #v(1em)
  Cover design by the author.\
  Typeset in Source Serif 4, Source Sans 3, and Source Code Pro.

  #v(1em)
  Published by Frontier Engineering\
  frontierengineering.dev

  #v(1em)
  Printed and distributed worldwide.
]

// Blank verso
#page(header: none, footer: none)[]

// Dedication
#page(header: none, footer: none)[
  #v(3in)
  #align(center)[
    #set text(style: "italic")
    For my daughter.\
    #v(0.5em)
    Build things that matter.
  ]
]

// Blank verso
#page(header: none, footer: none)[]

// ─── Table of Contents ────────────────────────────────────────
#page(header: none)[
  #set text(font: "Source Sans 3")
  #heading(level: 1, outlined: false)[Contents]
  #v(0.5in)
  #outline(
    title: none,
    indent: 1.5em,
    depth: 2,
  )
]

// Ensure body starts on recto
#pagebreak(to: "odd")

// ─── Preface ──────────────────────────────────────────────────
#include "chapters/preface.typ"

// ─── Act 1: Universal Concepts (Chapters 1–3) ────────────────
#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"

// ─── Act 2: Building Systems (Chapters 4–15) ─────────────────
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"
#include "chapters/ch07.typ"
#include "chapters/ch08.typ"
#include "chapters/ch09.typ"
#include "chapters/ch10.typ"
#include "chapters/ch11.typ"
#include "chapters/ch12.typ"
#include "chapters/ch13.typ"
#include "chapters/ch14.typ"
#include "chapters/ch15.typ"

// ─── Back matter ──────────────────────────────────────────────
#include "chapters/acknowledgments.typ"
#include "chapters/about-author.typ"

// ─── Appendices ───────────────────────────────────────────────
#include "chapters/appendix-a.typ"
#include "chapters/appendix-b.typ"
#include "chapters/appendix-c.typ"
#include "chapters/appendix-d.typ"
#include "chapters/appendix-e.typ"
#include "chapters/appendix-f.typ"
