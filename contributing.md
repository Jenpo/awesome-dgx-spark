# Contribution Guidelines

Thanks for helping make **Awesome DGX Spark** better! Please follow these guidelines so the list stays high-quality and consistent.

## What belongs here

A project must meet **all** of the following to be included:

1. **DGX Spark relevance** — Directly addresses the GB10 Grace Blackwell platform (sm_121 / aarch64 / CUDA 13.x / 128 GB unified memory). Generic CUDA or LLM tooling without Spark-specific content does not qualify.
2. **Proof of function** — Contains verifiable evidence such as benchmark numbers, working commands, or a maintained Docker image. Vague claims ("fast", "optimized") without evidence are not sufficient.
3. **Maintained** — The repository has seen activity within the last 12 months. Archived, read-only, or abandoned projects are excluded.
4. **Non-duplicate** — If a substantially similar project already exists in the list, the new entry should offer a meaningfully different approach or be demonstrably better.

## Entry format

```markdown
- [owner/repo](https://github.com/owner/repo) - Short description ending with a period.
```

- Descriptions must start with an uppercase letter and end with a period.
- Descriptions must not start with "A", "An", or "The".
- Keep descriptions to one line and free of marketing language.
- Separate the link and description with ` - ` (space-hyphen-space), not an em dash.

## Pre-built binaries and wheels

Binary-only releases (wheels, Docker images) that cannot be reproduced from source pose a supply-chain risk. Prefer entries where the build is reproducible from source. If a binary-only entry is included, note it in the description. Never link to entries hosted on unknown third-party mirrors.

## Benchmark entries

Entries that present performance numbers must include the software version and driver version used, so results remain interpretable as the ecosystem evolves. Stale benchmarks without version context are declined.

## Self-submissions

Self-submissions are welcome and evaluated by the same criteria as any other entry. Please disclose the affiliation in your pull request description.

## Submitting a pull request

1. Fork the repo and add your entry in the most appropriate section, maintaining alphabetical order within that section.
2. Update the Contents table of contents if you add a new section.
3. Open a pull request with a brief explanation of why the entry belongs on the list.
4. One pull request per logical addition is preferred.

By contributing, you agree that your contribution is released under [CC0 1.0](LICENSE).
