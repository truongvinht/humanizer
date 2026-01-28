# Humanizer

A Claude Code skill that removes signs of AI-generated writing from text, making it sound more natural and human.

## Installation

### Automated Installation (Recommended)

The easiest way to install all three language skills at once:

**macOS/Linux:**
```bash
git clone https://github.com/blader/humanizer.git
cd humanizer
./install.sh
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/blader/humanizer.git
cd humanizer
.\install.ps1
```

**Windows (Command Prompt):**
```cmd
git clone https://github.com/blader/humanizer.git
cd humanizer
install.bat
```

The installation script will:
- Detect your Claude Code skills directory automatically
- Install all three language variants (English, German, Chinese)
- Create backups of existing skills
- Verify the installation

**Installation Options:**

Development mode (symlinks for live editing):
```bash
./install.sh --symlink        # macOS/Linux
.\install.ps1 -Symlink        # Windows (requires admin)
```

Custom directory:
```bash
./install.sh --directory ~/custom/path     # macOS/Linux
.\install.ps1 -Directory "C:\Custom\Path"  # Windows
```

### Manual Installation

If you prefer manual installation:

**Git clone method:**
```bash
mkdir -p ~/.claude/skills
git clone https://github.com/blader/humanizer.git ~/.claude/skills/humanizer
```

**Copy individual language skills:**

**English:**
```bash
mkdir -p ~/.claude/skills/humanizer-en
cp en/SKILL.md ~/.claude/skills/humanizer-en/
```

**German (Deutsch):**
```bash
mkdir -p ~/.claude/skills/humanizer-de
cp de/SKILL.md ~/.claude/skills/humanizer-de/
```

**Chinese Simplified (简体中文):**
```bash
mkdir -p ~/.claude/skills/humanizer-zh
cp zh/SKILL.md ~/.claude/skills/humanizer-zh/
```

## Directory Structure

The skill is organized by language, with each language in its own directory:

```
humanizer/
├── en/SKILL.md          # English skill (24 patterns)
├── de/SKILL.md          # German skill (27 patterns)
├── zh/SKILL.md          # Chinese Simplified skill (32 patterns)
├── install.sh           # Unix/macOS installation script
├── install.ps1          # Windows PowerShell installation script
├── install.bat          # Windows batch file wrapper
├── README.md            # This file
├── CLAUDE.md            # Developer documentation
└── WARP.md              # WARP IDE integration
```

Each language skill has independent versioning and can evolve separately while maintaining conceptual alignment on core patterns #1-24.

## Usage

### English

In Claude Code, invoke the skill:

```
/humanizer

[paste your text here]
```

Or ask Claude to humanize text directly:

```
Please humanize this text: [your text]
```

### German (Deutsch)

For German language text, use the German skill:

```
/humanizer-de

[deutschen Text hier einfügen]
```

Or ask in German:

```
Bitte humanisiere diesen Text: [dein Text]
```

The German skill includes all 24 core patterns plus 3 German-specific patterns:
- Pattern #25: Excessive nominalization (Substantivierung)
- Pattern #26: Passive voice overuse (Passiv-Übernutzung)
- Pattern #27: Inappropriate formality (Übertriebene Formalität)

### Chinese Simplified (简体中文)

For Simplified Chinese text, use the Chinese skill:

```
/humanizer-zh

[在此粘贴中文文本]
```

Or ask in Chinese:

```
请帮我人性化这段文字：[你的文字]
```

The Chinese skill includes all 24 core patterns plus 8 Chinese-specific patterns:
- Pattern #25: Chengyu stacking (成语堆砌)
- Pattern #26: Excessive written language (书面语过度)
- Pattern #27: Westernized sentence structure (西化句式)
- Pattern #28: Redundant intensifiers (冗余强调)
- Pattern #29: Empty bureaucratic phrases (套话空话)
- Pattern #30: Comma abuse (逗号滥用)
- Pattern #31: Excessive parallel structure (排比过度)
- Pattern #32: Mechanical translation traces (机翻痕迹)

## Overview

Based on [Wikipedia's "Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) guide, maintained by WikiProject AI Cleanup. This comprehensive guide comes from observations of thousands of instances of AI-generated text.

### Key Insight from Wikipedia

> "LLMs use statistical algorithms to guess what should come next. The result tends toward the most statistically likely result that applies to the widest variety of cases."

## 24 Patterns Detected (with Before/After Examples)

### Content Patterns

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 1 | **Significance inflation** | "marking a pivotal moment in the evolution of..." | "was established in 1989 to collect regional statistics" |
| 2 | **Notability name-dropping** | "cited in NYT, BBC, FT, and The Hindu" | "In a 2024 NYT interview, she argued..." |
| 3 | **Superficial -ing analyses** | "symbolizing... reflecting... showcasing..." | Remove or expand with actual sources |
| 4 | **Promotional language** | "nestled within the breathtaking region" | "is a town in the Gonder region" |
| 5 | **Vague attributions** | "Experts believe it plays a crucial role" | "according to a 2019 survey by..." |
| 6 | **Formulaic challenges** | "Despite challenges... continues to thrive" | Specific facts about actual challenges |

### Language Patterns

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 7 | **AI vocabulary** | "Additionally... testament... landscape... showcasing" | "also... remain common" |
| 8 | **Copula avoidance** | "serves as... features... boasts" | "is... has" |
| 9 | **Negative parallelisms** | "It's not just X, it's Y" | State the point directly |
| 10 | **Rule of three** | "innovation, inspiration, and insights" | Use natural number of items |
| 11 | **Synonym cycling** | "protagonist... main character... central figure... hero" | "protagonist" (repeat when clearest) |
| 12 | **False ranges** | "from the Big Bang to dark matter" | List topics directly |

### Style Patterns

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 13 | **Em dash overuse** | "institutions—not the people—yet this continues—" | Use commas or periods |
| 14 | **Boldface overuse** | "**OKRs**, **KPIs**, **BMC**" | "OKRs, KPIs, BMC" |
| 15 | **Inline-header lists** | "**Performance:** Performance improved" | Convert to prose |
| 16 | **Title Case Headings** | "Strategic Negotiations And Partnerships" | "Strategic negotiations and partnerships" |
| 17 | **Emojis** | "🚀 Launch Phase: 💡 Key Insight:" | Remove emojis |
| 18 | **Curly quotes** | `said “the project”` | `said "the project"` |

### Communication Patterns

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 19 | **Chatbot artifacts** | "I hope this helps! Let me know if..." | Remove entirely |
| 20 | **Cutoff disclaimers** | "While details are limited in available sources..." | Find sources or remove |
| 21 | **Sycophantic tone** | "Great question! You're absolutely right!" | Respond directly |

### Filler and Hedging

| # | Pattern | Before | After |
|---|---------|--------|-------|
| 22 | **Filler phrases** | "In order to", "Due to the fact that" | "To", "Because" |
| 23 | **Excessive hedging** | "could potentially possibly" | "may" |
| 24 | **Generic conclusions** | "The future looks bright" | Specific plans or facts |

## Full Example

**Before (AI-sounding):**
> Great question! Here is an essay on this topic. I hope this helps!
>
> AI-assisted coding serves as an enduring testament to the transformative potential of large language models, marking a pivotal moment in the evolution of software development. In today's rapidly evolving technological landscape, these groundbreaking tools—nestled at the intersection of research and practice—are reshaping how engineers ideate, iterate, and deliver, underscoring their vital role in modern workflows.
>
> At its core, the value proposition is clear: streamlining processes, enhancing collaboration, and fostering alignment. It's not just about autocomplete; it's about unlocking creativity at scale, ensuring that organizations can remain agile while delivering seamless, intuitive, and powerful experiences to users. The tool serves as a catalyst. The assistant functions as a partner. The system stands as a foundation for innovation.
>
> Industry observers have noted that adoption has accelerated from hobbyist experiments to enterprise-wide rollouts, from solo developers to cross-functional teams. The technology has been featured in The New York Times, Wired, and The Verge. Additionally, the ability to generate documentation, tests, and refactors showcases how AI can contribute to better outcomes, highlighting the intricate interplay between automation and human judgment.
>
> - 💡 **Speed:** Code generation is significantly faster, reducing friction and empowering developers.
> - 🚀 **Quality:** Output quality has been enhanced through improved training, contributing to higher standards.
> - ✅ **Adoption:** Usage continues to grow, reflecting broader industry trends.
>
> While specific details are limited based on available information, it could potentially be argued that these tools might have some positive effect. Despite challenges typical of emerging technologies—including hallucinations, bias, and accountability—the ecosystem continues to thrive. In order to fully realize this potential, teams must align with best practices.
>
> In conclusion, the future looks bright. Exciting times lie ahead as we continue this journey toward excellence. Let me know if you’d like me to expand on any section!

**After (Humanized):**
> AI coding assistants speed up some tasks. In a 2024 study by Google, developers using Codex completed simple functions 55% faster than a control group, but showed no improvement on debugging or architectural decisions.
>
> The tools are good at boilerplate: config files, test scaffolding, repetitive refactors. They are bad at knowing when they are wrong. I have mass-accepted suggestions that compiled, passed lint, and still did the wrong thing because I stopped paying attention.
>
> Mira, an engineer at a fintech startup I interviewed, said she uses Copilot "like autocomplete for boring code" but reviews every line before committing. Jake, a senior dev at a larger company, disabled it after it kept suggesting patterns from a deprecated internal library.
>
> The productivity claims are hard to verify. GitHub says Copilot users "accept 30% of suggestions," but acceptance is not correctness, and correctness is not value. The 2024 Uplevel study found no statistically significant difference in pull-request throughput between teams with and without AI assistants.
>
> None of this means the tools are useless. It means they are tools. They do not replace judgment, and they do not eliminate the need for tests. If you do not have tests, you cannot tell whether the suggestion is right.

## References

- [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) - Primary source
- [WikiProject AI Cleanup](https://en.wikipedia.org/wiki/Wikipedia:WikiProject_AI_Cleanup) - Maintaining organization

## Version History

### English Skill (en/SKILL.md)
- **2.1.1** - Fixed pattern #18 example (curly quotes vs straight quotes)
- **2.1.0** - Added before/after examples for all 24 patterns
- **2.0.0** - Complete rewrite based on raw Wikipedia article content
- **1.0.0** - Initial release

### German Skill (de/SKILL.md)
- **1.0.0** - Initial German language release with 27 patterns (24 core + 3 German-specific)

### Chinese Simplified Skill (zh/SKILL.md)
- **1.0.0** - Initial Simplified Chinese release with 32 patterns (24 core + 8 Chinese-specific)

## License

MIT
