# IRW Data Editor Coding Assessment

## Overview

This is a short exercise for the **data editor** role at the Investigative
Reporting Workshop. It should take about **60–75 minutes**. Please don't spend
your whole weekend on it. 

A data editor here does two jobs. You do data work (clean, analyze, visualize,
write), and you edit other people's work (reporters, students, freelancers) and
decide what's solid enough to publish. This exercise tests both, plus whether
you can explain what the numbers do and don't say to people who don't code.

You may code in **Python** or **R**. You'll write in the language you pick
(Part 1) and read and edit the other one (Part 2), so we see how you work in
both.

> **On AI tools.** Use whatever you'd normally use, including AI (Claude,
> Copilot, ChatGPT). Just be honest about it: add a line to your README saying
> where you did and didn't use it.
>
> Part 2 is where we look at your own editorial
> judgment, especially whether you can catch what a confident draft (human or
> AI) gets wrong.

---

## What's in this repo

```
data/
  sample_311.csv          # fixed dataset for Part 2 (synthetic, DC-style 311 data)
review/
  flawed_analysis.py      # a flawed first-draft analysis, in Python
  flawed_analysis.R       # the SAME flawed analysis, in R
  claim.md                # the claim that draft is being used to support
```

---

## Part 1 — A quick analysis

Pick any dataset from [opendata.dc.gov](https://opendata.dc.gov) (311 requests,
building permits, crime, evictions, whatever grabs you) and produce **one
finding you can support**. 

We also want to see how you got there, how you poke at a dataset and decide
what's worth a reader's attention.

Deliver:

- **Your code** (`.py`, `.R`, `.Rmd`, or a notebook), runnable
- **One visualization** (PNG or PDF)
- **`finding.md`** (~150 words): what you found, a sentence or
  two on how you got there (what you looked at, why you stopped on this), limitations and anything else you want us to know. 

*(Don't use `data/sample_311.csv` here. That one's for Part 2.)*

---

## Part 2 — Edit the work

`review/flawed_analysis.py` and `review/flawed_analysis.R` are the **same**
flawed analysis in two languages. It was drafted with an AI assistant and
lightly edited. It runs, and the output looks clean. A reporter wants to use it
to support the claim in `review/claim.md` and file today.

**Read the version in the language you did *not* use in Part 1** (built in
Python? Review the R, and vice versa). Editors read code they didn't write, in
languages they don't always live in. Run it against `data/sample_311.csv` if
you want.

Write **`review/code_review.md`** covering:

1. **What's wrong**: the bugs and analytical mistakes that change the answer
   (correctness and methodology).
2. **The claim**: is the headline in `claim.md` actually supported? If not, why? what do you think?
3. **Your note to the reporter**: We're a teaching newsroom, so how you give
   feedback matters.

And show your thinking, not just conclusions. Tell us how you approached the
code, what you checked or ran to confirm a problem, and why you ranked the
issues the way you did. 

---

## Part 3 — Explain it

Write **`explainer.md`**: your Part 1 finding in **~100 words**, for a
co-reporter or publication partner. Then one sentence: if you had a student reporter with limited time and one more week, what
would you chase next?

---

## Submission

Put everything in a **GitHub repo** and email us the link. A private repo is
fine — just add **`aarushisahejpal`** as a collaborator so we can see it. We
want to see your **commit history**, so commit as you go rather than dumping
everything at the end. Include a short README with your name, how to run Part 1,
and the packages you used.

### Checklist

- [X] Part 1: code + one visualization + `finding.md`
- [X] Part 2: `review/code_review.md`
- [X] Part 3: `explainer.md`
- [X] GitHub repo (public, or private with `aarushisahejpal` added) + commit
      history (not one final commit)
- [X] Short README (+ one line on where you did and didn't use AI)

---

## How we'll evaluate

- how you explore a dataset and decide what's worth a reader's attention
  (Part 1)
- denominators, normalization, uncertainty, and knowing what a dataset can and
  can't support
- catching what's wrong in the flawed analysis (Part 2), the reasoning behind
  it, and leading with what matters
- explaining clearly to non-technical people, and giving feedback the way a good
  editor at a teaching newsroom would
- clean, runnable code in Part 1, and reading the other language competently in
  Part 2

Good luck.
