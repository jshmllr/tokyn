## Research prompts (Grok/X, ChatGPT, Perplexity)

These are **research-only** prompts for finding *more creators like the current contributors*. They intentionally **do not extract techniques**. Output should be **people + why they’re relevant + evidence links**.

### Table of contents

- [Output formats (A/B/C)](#output-formats-abc)
- [Grok/X](#grokx)
  - [A (Shortlist)](#grokx-a)
  - [B (Ranked)](#grokx-b)
  - [C (Seed-and-expand)](#grokx-c)
- [ChatGPT](#chatgpt)
  - [A (Shortlist)](#chatgpt-a)
  - [B (Ranked)](#chatgpt-b)
  - [C (Seed-and-expand)](#chatgpt-c)
- [Perplexity](#perplexity)
  - [A (Shortlist)](#perplexity-a)
  - [B (Ranked)](#perplexity-b)
  - [C (Seed-and-expand)](#perplexity-c)

### Output formats (A/B/C)

- **A (Shortlist)**: 20–30 creators (handle + 1-line rationale + evidence links)
- **B (Ranked)**: Top 10 + 10 backups, with a simple scoring rationale
- **C (Seed-and-expand)**: 10 seed creators + an expansion plan (who to check next and why)

You can reuse these across runs; swap in new “seed” accounts as your credits list grows.

---

<a id="grokx"></a>
### Grok/X prompt — A (Shortlist: 20–30 creators)

<a id="grokx-a"></a>
```text
You are my UI Finesse Playbook editor and researcher. Your job is to discover NEW creators on X who regularly share production-relevant product UI polish techniques.

Repo context:
- Playbook: https://github.com/jshmllr/ui-finesse-playbook
- Attribution matters: preserve author credit and link to primary sources.

Hard rule (no technique extraction):
- Do NOT list, summarize, paraphrase, or teach any techniques.
- Do NOT rewrite their posts.
- Only identify creators and provide evidence that they post about UI polish.

Seeds (style to match; do not repeat these in the final list unless needed for comparison):
- @Designer (Designer Name)
- @Designer (Designer Name)

Optional extra seeds I’m already watching:
- [your url here]
- [your url here]


Tool actions (use these as you work; explicitly report which you used):
- X Search (keywords)
- X Search (semantic / “find similar accounts/posts”)
- X User lookup (profile vetting)
- X Thread fetch (open thread + replies)
- Browse external link (open CodePen/blog/etc)

Query strategy:
- Use keyword clusters like: “shadow border”, “elevation tokens”, “surface”, “stroke opacity”, “micro contrast”, “focus ring”, “table ui”, “design system”, “component”, “tailwind”, “figma”, “css”.
- Also use semantic similarity to the seeds’ typical topics (UI polish, surfaces, depth, tables/forms, typography systems, pragmatic heuristics).
- Prefer creators who show before/after, component breakdowns, or linked demos (CodePen/Figma/blog).

Quality filters:
- Prefer production-minded content (systems, components, accessibility/contrast, density).
- Avoid accounts that are mostly growth/marketing, generic inspiration dumps, or repost-only.
- Require evidence: at least 2–3 links per creator to specific posts/threads/demos.

Deliverable (A: shortlist 20–30):
Return a table with columns:
1) Handle
2) Display name
3) Why they’re relevant (1 sentence; no techniques)
4) Evidence links (2–3 X links; can include CodePen/blog if present)
5) Notes (code-first/design-first, topics they often cover, frequency)

Stop after 30 creators.
```

---

<a id="grokx-b"></a>
### Grok/X prompt — B (Ranked: top 10 + backups)

```text
sl
```

---

<a id="grokx-c"></a>
### Grok/X prompt — C (Seed-and-expand)

```text
You are my UI Finesse Playbook editor and researcher. Build a discovery graph of NEW X creators who post about product UI polish and implementation-adjacent design.

Hard rule (no technique extraction):
- Do NOT summarize or teach techniques.
- Only identify creators + evidence links.

Seeds:
@Username, @Username, etc

Use:
- X Search (keywords), X Search (semantic), X User lookup, X Thread fetch, Browse external link

Deliverable (C):
1) 10 “Seed candidates” (NEW creators): Handle | Why relevant (1 sentence) | Evidence links (2–3)
2) Expansion plan (graph-style):
   - For each seed candidate, list 5–8 “Next nodes” (other accounts to check) based on:
     - frequent replies, quote-tweets, collabs
     - lists/bookmarks references
     - repeated co-mentions of design systems/components/CSS/Figma
3) Search recipe:
   - 10 keyword queries
   - 5 semantic queries (describe what to search for, not techniques)
Stop when the graph has at most ~60 total accounts mentioned (10 seeds + next nodes).
```

---

<a id="chatgpt"></a>
### ChatGPT prompt — A (Shortlist: 20–30 creators)

<a id="chatgpt-a"></a>
```text
You are my UI Finesse Playbook editor and researcher. I want a shortlist of NEW creators who share production-relevant product UI polish content.

Repo context:
- https://github.com/jshmllr/ui-finesse-playbook
- Attribution matters.

Hard rule (no technique extraction):
- Do NOT list, summarize, paraphrase, or teach techniques.
- Do NOT rewrite anyone’s posts.
- Only identify creators and provide evidence links to their primary sources.

Seeds to match (do not include these in the final shortlist):
@Username, @Username, etc

If you have browsing/search:
- Use it to find candidates and cite sources.
If you do NOT have browsing/search:
- Provide the exact search queries I should run on X/Google to find candidates, and explain the criteria you’d use to vet them.

Deliverable (A):
Return a table of 20–30 creators with:
Handle | Display name | Why relevant (1 sentence; no techniques) | Evidence links (2–3) | Notes (code-first/design-first, topic areas)
```

---

<a id="chatgpt-b"></a>
### ChatGPT prompt — B (Ranked: top 10 + backups)

```text
You are my UI Finesse Playbook editor and researcher. Rank NEW creators who post about production-relevant product UI polish.

Hard rule (no technique extraction):
- Do NOT list, summarize, paraphrase, or teach techniques.
- Only list creators + evidence links.

Seeds for similarity (exclude from final list):
@Username, @Username, etc

Deliverable (B):
Top 10 + Backups 10, each with:
Handle | Why relevant (1 sentence) | Evidence links (3) | Score (0–10) for: production relevance, consistency, evidence density, implementation adjacency

Also provide:
- 10 search queries I can rerun later (X + web)
```

---

<a id="chatgpt-c"></a>
### ChatGPT prompt — C (Seed-and-expand)

```text
You are my UI Finesse Playbook editor and researcher. Build a discovery graph of NEW creators related to production UI polish (design systems, components, UI refinement, CSS/Tailwind/Figma-adjacent).

Hard rule (no technique extraction):
- Do NOT summarize or teach techniques.
- Only identify creators + evidence links.

Seeds (exclude from candidates list):
@Username, @Username, etc

Deliverable (C):
1) 10 seed candidates (NEW): Handle | Why relevant (1 sentence) | Evidence links (2–3)
2) For each seed candidate: 5–8 “next accounts to check” with a short reason (network proximity: replies/quotes/collabs; not techniques)
3) A repeatable search recipe (keywords + semantic query descriptions)
Keep the total graph to ~60 accounts max.
```

---

<a id="perplexity"></a>
### Perplexity prompt — A (Shortlist: 20–30 creators)

<a id="perplexity-a"></a>
```text
Find NEW creators (designers/developers) who share production-relevant product UI polish content similar to: First Name Last Name (@Username), First Name Last Name (@Username).

Hard rule (no technique extraction):
- Do NOT list, summarize, or teach techniques.
- Only identify creators and cite primary sources.

Deliverable (A):
Return 20–30 creators with:
- Handle + name
- 1-sentence rationale (no techniques)
- 2–3 citations (X threads/posts, CodePen, blogs, talks)
- Notes (code-first/design-first, what they commonly post about at a high level)

Quality filters:
- Prefer repeatable, production-minded content (systems/components/accessibility/density).
- Avoid generic inspiration aggregators or repost-only accounts.
```

---

<a id="perplexity-b"></a>
### Perplexity prompt — B (Ranked: top 10 + backups)

```text
Rank NEW creators who regularly post about production-relevant product UI polish, similar to @Username / @Username / @Username.

Hard rule (no technique extraction):
- Do NOT summarize or teach techniques.
- Only list creators + citations.

Deliverable (B):
1) Top 10 creators with:
   - Handle + name
   - Why relevant (1 sentence)
   - 3 citations
   - Score breakdown (0–10): production relevance, evidence density, consistency, implementation adjacency
2) Backups (10) with same fields
3) “Best queries used” so I can rerun later
```

---

<a id="perplexity-c"></a>
### Perplexity prompt — C (Seed-and-expand)

```text
Build a discovery graph of NEW creators related to production UI polish (design systems/components/UI refinement/CSS-Tailwind-Figma adjacency), starting from these seeds:
@Username, @Username, etc.

Hard rule (no technique extraction):
- Do NOT summarize or teach techniques.
- Only identify creators + citations to their work.

Deliverable (C):
1) 10 NEW seed candidates with citations (2–3 each)
2) For each seed candidate, list 5–8 “next nodes” (other accounts/resources to check) with a brief network-based reason (replies/quotes/collabs/co-mentions)
3) Repeatable search recipe: keyword queries + semantic query descriptions
Keep total graph size to ~60 accounts.
```

---

## Improving these prompts (iteration loop)

Use this section after a research run to tighten results. The goal is to increase **signal** (production UI polish creators) and reduce **noise** (inspo dumps, repost-only, growth/marketing).

### Quick diagnosis → prompt edits

- **If results are too generic / “inspo” heavy**
  - Add to Quality filters: “Exclude repost-only/inspo aggregator accounts; require original threads or original demos.”
  - Add to Evidence requirement: “At least 2 links must be authored posts (not retweets).”
  - Add an Output constraint: “Include one example link that contains a UI breakdown (thread) or implementation-adjacent artifact (demo, snippet, doc).”

- **If results lack evidence links**
  - Make citations mandatory: “No evidence links → do not include the creator.”
  - Specify link types: “Prefer thread links; include at least one external artifact link if available (CodePen/blog/Figma/community).”

- **If results skew to ‘motion/creative coding’ (but you want product UI)**
  - Add a topical bias line: “Prefer enterprise/SaaS/product UI, forms, tables, density, accessibility, design systems.”
  - Add an exclusion: “Exclude purely generative art / experimental-only UI unless they also ship product components.”

- **If results skew too code-heavy or too design-only**
  - Add balancing rule: “Include a mix: ~50/50 design-first and code-first accounts, as long as they are implementation-adjacent.”

- **If results are good but too narrow**
  - Add explicit expansion vectors:
    - “Also search replies/quote-tweets of seed threads for frequent high-signal responders.”
    - “Look for ‘list’ curators and follow their lists.”
    - “Include creators from adjacent niches: design systems, accessibility, data-heavy UI, content design.”

### Add a “ban list” line (optional)

If you keep seeing the same noise accounts, add:

- “Exclude these handles/domains: @Username, @Username, … (repost/inspo/growth).”

### Standard tightening clause (copy/paste)

Drop this into any prompt when quality slips:

```text
Strict quality gates:
- Only include creators with 2–3 direct evidence links to authored posts/threads/demos.
- Exclude repost-only/inspo aggregator/growth-only accounts.
- If evidence is missing, omit the creator entirely.
```

---

## Future platforms (Threads, Mastodon, etc.)

The same A/B/C outputs work on other networks; change the discovery mechanics and the “evidence” format.

### Threads (future adaptation)

Replace the X tool list with:

- Threads Search (keywords)
- Threads Search (semantic / similar posts)
- Threads User lookup (profile vetting)
- Threads Thread fetch (post + replies)
- Browse external link (CodePen/blog/etc)

Evidence requirements for Threads:
- 2–3 links to specific posts or threads (not just profile links)
- Prefer posts with component breakdowns, before/after, or links to external artifacts

### Mastodon (future adaptation; e.g. `mastodon.social/@username`)

Mastodon is instance-based, so discovery is more “web + profile vetting” than a single global search.

Discovery actions (future):
- Web Search (keywords + “site:mastodon.social” or “inurl:/@” patterns)
- Browse profile page (verify it’s a real creator and scan recent posts)
- Browse external links from profile (personal site, repos, demos)

Evidence requirements for Mastodon:
- Link the profile
- Link 2–3 specific toot URLs (or other instance URLs)
- Link at least one external artifact if present (blog, CodePen, repo, case study)

Suggested web queries:
- `"design system" site:mastodon.social`
- `"UI" "design system" mastodon @`
- `"CSS" "component" site:mastodon.social inurl:/@`
- `"table UI" site:mastodon.social inurl:/@`

If you later want a dedicated Mastodon prompt variant, copy any A/B/C prompt and replace:
- “X creators” → “Mastodon accounts”
- “X links” → “profile + toot links”
- “X search tools” → “Web Search + Browse profile + Browse external links”
