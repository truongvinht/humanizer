# Humanizer
A Claude Code skill that removes signs of AI-generated writing from text, making it sound more natural and human.

[![Version](https://img.shields.io/badge/version-2.1.1-blue.svg)](#-version-history)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](#-license)
[![GitHub](https://img.shields.io/badge/github-humanizer-black.svg)](https://github.com/truongvinht/humanizer)
[![Claude Code](https://img.shields.io/badge/Claude_Code-compatible-brightgreen.svg)](https://claude.ai/code)

---

## ✨ Features

- 🌍 **Multi-language support**: English, German (Deutsch), and Chinese Simplified (简体中文)
- 🎯 **24 core patterns**: Based on [Wikipedia's comprehensive AI writing guide](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)
- 🔧 **Language-specific patterns**: 27 patterns for German, 32 for Chinese
- 📝 **Before/after examples**: Clear demonstrations for all patterns
- 🚀 **Easy installation**: Automated cross-platform installer
- 🔄 **Independent versioning**: Each language evolves separately
- 💡 **Natural language mode**: Invoke with plain English/German/Chinese
- 🛠️ **Developer-friendly**: Symlink mode for live editing during development

---

## 🚀 Quick Start

### Natural Language Mode

Simply ask Claude to humanize your text:

**English:**
```
Please humanize this text: [your text]
```

**German:**
```
Bitte humanisiere diesen Text: [dein Text]
```

**Chinese Simplified:**
```
请帮我人性化这段文字：[你的文字]
```

### Traditional Command Mode

Use explicit slash commands for each language:

```
/humanizer        # English
/humanizer-de     # German
/humanizer-zh     # Chinese Simplified

[paste your text here]
```

---

## 🌍 Platform Compatibility

| Platform | Status | Notes |
|----------|--------|-------|
| **Claude Code** | ✅ Fully Supported | Primary platform |
| **OpenCode** | ⚠️ Partial | Skill format compatible, testing needed |
| **Windsurf** | ⚠️ Partial | Skill format compatible, testing needed |
| **GitHub Copilot** | ❌ Not Supported | Different skill architecture |

---

## 📦 Installation

### Automated Installation (Recommended)

The easiest way to install all three language skills at once:

**macOS/Linux:**
```bash
git clone https://github.com/truongvinht/humanizer.git
cd humanizer
./install.sh
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/truongvinht/humanizer.git
cd humanizer
.\install.ps1
```

**Windows (Command Prompt):**
```cmd
git clone https://github.com/truongvinht/humanizer.git
cd humanizer
install.bat
```

The installation script will:
- ✅ Detect your Claude Code skills directory automatically
- ✅ Install all three language variants (English, German, Chinese)
- ✅ Create backups of existing skills
- ✅ Verify the installation

### Installation Options

**Development mode** (symlinks for live editing):
```bash
./install.sh --symlink        # macOS/Linux
.\install.ps1 -Symlink        # Windows (requires admin)
```

**Custom directory:**
```bash
./install.sh --directory ~/custom/path     # macOS/Linux
.\install.ps1 -Directory "C:\Custom\Path"  # Windows
```

### Manual Installation

If you prefer manual installation:

**Git clone method:**
```bash
mkdir -p ~/.claude/skills
git clone https://github.com/truongvinht/humanizer.git ~/.claude/skills/humanizer
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

---

## 🎯 Usage Examples

### Scenario 1: Academic Writing Review

**Use case:** Remove AI patterns from research paper draft

```
/humanizer

[paste academic text with AI-generated sections]
```

The skill will identify and fix patterns like significance inflation, vague attributions, and promotional language.

### Scenario 2: German Business Communication

**Use case:** Humanize German email or report with excessive nominalization

```
/humanizer-de

[deutschen Geschäftstext einfügen]
```

The skill will detect German-specific patterns (#25-27) including nominalization, passive voice overuse, and formality mismatches.

### Scenario 3: Chinese Content Localization

**Use case:** Fix westernized syntax and bureaucratic phrases in Chinese text

```
/humanizer-zh

[粘贴中文内容]
```

The skill will identify Chinese-specific patterns (#25-32) including chengyu stacking, comma abuse, and translation traces.

### Scenario 4: Blog Post Editing

**Use case:** Remove chatbot artifacts and filler phrases

```
Please humanize this blog post: [text with "Great question!" and "I hope this helps!"]
```

The skill removes chatbot artifacts (#19), filler phrases (#22), and sycophantic tone (#21).

---

## 🧠 How It Works

### Pattern Detection

The skill analyzes text for **24 core patterns** documented in [Wikipedia's "Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing):

**Content Patterns (#1-6):** Significance inflation, notability name-dropping, superficial analysis, promotional language, vague attributions, formulaic challenges

**Language Patterns (#7-12):** AI vocabulary, copula avoidance, negative parallelisms, rule of three, synonym cycling, false ranges

**Style Patterns (#13-18):** Em dash overuse, boldface overuse, inline-header lists, title case headings, emojis, curly quotes

**Communication Patterns (#19-21):** Chatbot artifacts, cutoff disclaimers, sycophantic tone

**Filler/Hedging (#22-24):** Filler phrases, excessive hedging, generic conclusions

### Language-Specific Enhancements

**German (27 patterns):** Adds detection for excessive nominalization (#25), passive voice overuse (#26), and inappropriate formality (#27)

**Chinese Simplified (32 patterns):** Adds detection for chengyu stacking (#25), excessive written language (#26), westernized syntax (#27), redundant intensifiers (#28), bureaucratic phrases (#29), comma abuse (#30), excessive parallel structure (#31), and translation traces (#32)

### Key Insight from Wikipedia

> "LLMs use statistical algorithms to guess what should come next. The result tends toward the most statistically likely result that applies to the widest variety of cases."

This statistical tendency creates recognizable patterns that the skill detects and rewrites.

---

## 📖 Documentation

### Core Documentation
- [README.md](README.md) - This file (user guide)
- [CLAUDE.md](CLAUDE.md) - Developer documentation for contributors

### Platform-Specific Guides
- [WARP.md](WARP.md) - WARP IDE integration guide

### Language Skill Files
- [en/SKILL.md](en/SKILL.md) - English skill definition (24 patterns)
- [de/SKILL.md](de/SKILL.md) - German skill definition (27 patterns)
- [zh/SKILL.md](zh/SKILL.md) - Chinese Simplified skill definition (32 patterns)

---

## 📋 Pattern Reference

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
| 18 | **Curly quotes** | `said "the project"` | `said "the project"` |

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

### Language-Specific Patterns

**German (Patterns #25-27):**
- **#25: Excessive Nominalization** (Substantivierung) - Converting verbs to nouns unnecessarily
- **#26: Passive Voice Overuse** (Passiv-Übernutzung) - Unnecessary passive constructions
- **#27: Inappropriate Formality** (Übertriebene Formalität) - Wrong formality level (Sie/du) for context

**Chinese Simplified (Patterns #25-32):**
- **#25: Chengyu Stacking** (成语堆砌) - Overusing 4-character idioms
- **#26: Excessive Written Language** (书面语过度) - Using literary forms inappropriately
- **#27: Westernized Syntax** (西化句式) - Non-native sentence structures
- **#28: Redundant Intensifiers** (冗余强调) - Stacking emphatic words
- **#29: Empty Bureaucratic Phrases** (套话空话) - Party-government style without substance
- **#30: Comma Abuse** (逗号滥用) - Run-on sentences avoiding periods
- **#31: Excessive Parallel Structure** (排比过度) - Overusing rhetorical parallel clauses
- **#32: Mechanical Translation Traces** (机翻痕迹) - Word-for-word English idiom translations

---

## 💡 Full Example

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
> In conclusion, the future looks bright. Exciting times lie ahead as we continue this journey toward excellence. Let me know if you'd like me to expand on any section!

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

---

## 🗂️ Directory Structure

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

---

## 🤝 Contributing

Contributions are welcome! If you'd like to add new patterns, improve examples, or add support for additional languages:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/new-pattern`)
3. **Make your changes** following the guidelines in [CLAUDE.md](CLAUDE.md)
4. **Test your changes** by invoking the skill in Claude Code
5. **Commit your changes** (`git commit -m 'Add new pattern for X'`)
6. **Push to the branch** (`git push origin feature/new-pattern`)
7. **Open a Pull Request**

### Development Guidelines

- Read [CLAUDE.md](CLAUDE.md) for detailed contribution guidelines
- Test all changes by invoking the skill with real AI-generated text
- Maintain pattern number stability (don't renumber existing patterns)
- Add before/after examples for all new patterns
- Update version numbers in YAML frontmatter and README
- For new languages, follow the trilingual architecture pattern

---

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

This skill is based on the comprehensive research and documentation from:

- [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) - Primary source maintained by WikiProject AI Cleanup
- [WikiProject AI Cleanup](https://en.wikipedia.org/wiki/Wikipedia:WikiProject_AI_Cleanup) - Community maintaining AI writing detection guidelines

Special thanks to the Wikipedia community for their empirical observation-based approach to documenting AI writing patterns.

---

## 📬 Support

Need help or have questions?

- 📖 **Documentation**: Check [CLAUDE.md](CLAUDE.md) for detailed documentation
- 🐛 **Bug Reports**: [Open an issue](https://github.com/truongvinht/humanizer/issues)
- 💡 **Feature Requests**: [Start a discussion](https://github.com/truongvinht/humanizer/discussions)
- 🌍 **Community**: Join the Claude Code community

---

## 🗺️ Roadmap

### ✅ Completed

- **v1.0.0** - Initial English skill release (24 patterns)
- **v2.0.0** - Complete rewrite based on Wikipedia article content
- **v2.1.0** - Added before/after examples for all patterns
- **v2.1.1** - Fixed pattern #18 curly quotes example
- **German v1.0.0** - German language support with 27 patterns
- **Chinese v1.0.0** - Simplified Chinese support with 32 patterns
- **Cross-platform installers** - Automated installation for macOS/Linux/Windows

### 🚧 In Progress

- Platform compatibility testing (OpenCode, Windsurf)
- Additional language support exploration (French, Spanish, Japanese)
- Pattern effectiveness metrics collection

### 🔮 Planned

- **v2.2.0** - Additional patterns based on community feedback
- **v3.0.0** - Multi-language pattern synchronization system
- Traditional Chinese (繁體中文) language support
- French language support
- Spanish language support
- Japanese language support
- Pattern effectiveness dashboard
- Integration with additional AI coding platforms

---

## 📊 Version History

### English Skill (en/SKILL.md)
- **2.1.1** - Fixed pattern #18 example (curly quotes vs straight quotes)
- **2.1.0** - Added before/after examples for all 24 patterns
- **2.0.0** - Complete rewrite based on raw Wikipedia article content
- **1.0.0** - Initial release

### German Skill (de/SKILL.md)
- **1.0.0** - Initial German language release with 27 patterns (24 core + 3 German-specific)

### Chinese Simplified Skill (zh/SKILL.md)
- **1.0.0** - Initial Simplified Chinese release with 32 patterns (24 core + 8 Chinese-specific)

---

## ⭐ Show Your Support

If you find this skill useful:

- ⭐ **Star this repository** on GitHub
- 🐛 **Report issues** to help improve the skill
- 💡 **Share your feedback** in discussions
- 🌍 **Contribute translations** for additional languages
- 📢 **Spread the word** in the Claude Code community

---

Made with ❤️ for the Claude Code community
