# Contribution Guidelines

Thanks for helping make **Awesome DGX Spark** better. This list aims for one thing: a DGX Spark owner should be able to trust every line. The five principles below are how we keep it that way. Read them before opening a pull request.

## The five principles

### 1. Explicitly about the DGX Spark

The project must explicitly target the GB10 / sm_121(a) platform in its own README or code — aarch64 builds, sm_121 kernels or patches, NVFP4 on Blackwell, unified-memory handling, multi-Spark fabric — or publish results measured on a real DGX Spark. Generic CUDA or LLM tooling that merely runs on a Spark like any other GPU does not qualify. Rule of thumb: if the repository's own body never mentions DGX Spark, GB10, or sm_121, it is out.

### 2. Honest, evidence-backed descriptions

One line, in your own words, starting with what the thing *is*. Opening with a classifying modifier is fine, because it states a fact — "One-command installer…", "Prebuilt wheel…", "Read-only diagnostic CLI…". Opening with a judgment is not: "Optimized…", "Powerful…", "Complete…". The test is whether dropping the word removes a fact or only removes praise. No marketing language: any quality claim ("fast", "optimized", "comprehensive") must be backed on the spot by a number, a named technique, or a concrete capability, otherwise drop it. When you cite a number, cite the one that proves the contribution, not the most impressive-looking one. The bar: the line should survive Hacker News without being called either hype or "so what does it actually do?".

### 3. Proof of function

Include verifiable evidence: benchmark numbers (with the software and driver versions used, so results stay interpretable as the stack moves), working commands, or a build reproducible from source. Prefer source-reproducible projects; if an entry is binary-only (a wheel or image that cannot be rebuilt from source), say so in the description, and never link to entries hosted on unknown third-party mirrors.

### 4. Maintained

The repository must have been active within the last 12 months. Archived, read-only, or abandoned projects are declined. The platform moves fast — a project pinned to a stale CUDA, driver, or vLLM version that no longer builds is not useful to a Spark owner today.

### 5. Canonical and non-duplicate

Link to the canonical repository, not a redirect or mirror — if a project was transferred to an organization, link the new home. One entry per project; a near-duplicate is accepted only if it offers a meaningfully different and demonstrably better approach. Keep entries in alphabetical order within their section.

## Entry format

```markdown
- [owner/repo](https://github.com/owner/repo) - Short description ending with a period.
```

- Start the description with an uppercase letter and end it with a period.
- Do not start with "A", "An", or "The".
- Keep it to one line, free of marketing language (principle 2).
- Separate the link and the description with ` - ` (space-hyphen-space), not an em dash.
- Aim for about 16 words. Longer is fine when every added clause carries a number or a named technique; 30 words is the ceiling. Padding a line with prose is not.
- Spell the platform the way the rest of the list does: `DGX Spark`, `GB10`, `sm_121`, `NVFP4`, `aarch64`, `NVIDIA`. Use `arm64` only when naming an artifact whose own tag is `arm64` (a Docker platform, for instance).
- No semicolons or em/en dashes inside the description, and at most one colon, used to introduce a list.

A pre-push hook and CI run `.github/scripts/style-check.sh`, which enforces the mechanical parts of the above. You can run it yourself with `bash .github/scripts/style-check.sh README.md`.

## Self-submissions

Self-submissions are welcome and evaluated by the same five principles as any other entry. Please disclose the affiliation in your pull request description.

## Submitting a pull request

1. Fork the repo and add your entry to the most appropriate section, in alphabetical order.
2. Update the Contents table of contents if you add a new section.
3. Open a pull request that names the project and points to the evidence behind principles 1, 3, and 4 (the Spark-specific content, the proof of function, and recent activity).
4. One pull request per logical addition is preferred.

By contributing, you agree that your contribution is released under [CC0 1.0](LICENSE).
