---
name: brainstorm
description: Brainstorm blog post ideas and develop them into outlines ready to write. Use when the user wants to explore topics for writing, flesh out a blog idea, find angles for a post, connect ideas from their vault, or think through what to write about. Trigger on phrases like "blog idea", "what should I write about", "brainstorm", "help me think about a post", "develop this idea".
---

# Brainstorm

Interactive brainstorming for blog posts. Helps the user go from vague idea to concrete outline that serves as a GUIDE for writing.

## The user's writing style

The user writes like a thoughtful senior engineer teaching peers. Know this before suggesting anything:

- Conversational tone. Confident enough to be casual, experienced enough to be clear
- "We" language in learning contexts. Creates partnership, not lecturing
- Problem-first teaching. Show the broken thing, then explain why, then fix it
- Code as primary source. Not snippets. Reproducible examples you can run
- English unless explicitly asked to be in portuguese.
- Short punchy sentences. No filler. No corporate speak
- Never use em dashes. Periods to separate ideas
- Ends with warmth, never cold conclusions
- No emoji usage anywhere
- Topics: systems programming, DevOps, Java, Elixir, Godot

The notes and outlines must match this voice. No formal academic tone. No AI-speak.

## The user's blog workflow

The vault notes are REFERENCE MATERIAL, not the final article. Never write a full article in the vault. Write outlines, angles, key points, code sketches.

```
Brainstorm (vault) -> Outline (vault) -> User Writes -> Export -> Deploy
```

## Steps

### 1. Gather context

Re-index and search the vault for existing material:

```bash
qmd update -c vault && qmd embed 2>/dev/null
qmd query -c vault "the topic being brainstormed"
```

**Always start with `qmd query`.** It returns snippets with context and relevance scores. Use those snippets directly. Only read full files when you need the complete outline (e.g. an existing draft you're building on). Only use `rg` if qmd misses something specific.

Also check the ideas backlog and existing drafts:

```bash
cat ~/vault/blog/ideas.md
ls ~/vault/blog/drafts/
```

### 2. Explore the idea

If the user has a topic in mind:

- What angle makes this interesting? What is the unique take?
- Who is the reader? Beginners? Experienced devs? Both?
- What is the one thing the reader takes away?
- Can we show a problem first, then solve it? (the user's signature pattern)
- What code examples would make this concrete and runnable?
- Does the vault have related notes?

If the user has no topic, suggest ideas based on:
- Recent TILs that could expand into posts
- Patterns across project notes
- Gaps in existing drafts
- Things the user has been working on lately

Push back on weak ideas. Ask "why would someone read this?" Challenge the user to find their unique angle.

### 3. Shape the outline

Once the idea has shape, propose:

- Title (2-3 options, in the right language)
- Hook (opening angle. problem-first when possible)
- Key sections with one-line descriptions
- Code examples or demos needed (specify language, what to show)
- Effort estimate (quick post vs deep dive)

The outline should be enough for the user to open Curupira and start writing. Not a full draft. A map.

### 4. Save

After brainstorming, offer two actions:

**Add to ideas backlog** (not ready yet):
Append a bullet to `~/vault/blog/ideas.md` under `## Backlog` with title, angle, and one-line summary.

**Create an outline** (ready to start writing):
Create `~/vault/blog/drafts/{slug}.md` with the outline, key points, code sketches, and references.

Always ask the user which one. Never create without confirmation.
