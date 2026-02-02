# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## What this repo is
This repository is a **Claude Code skill** implemented entirely as Markdown, with support for three languages: English, German (Deutsch), and Chinese Simplified (简体中文).

The "runtime" artifacts are language-specific `SKILL.md` files located in language directories. Claude Code reads the YAML frontmatter (metadata + allowed tools) and the prompt/instructions that follow.

`README.md` is for humans: installation, usage, and a compact overview of the patterns across all languages.

## Repository Structure

```
humanizer/
├── en/SKILL.md          # English skill (24 patterns)
├── de/SKILL.md          # German skill (27 patterns)
├── zh/SKILL.md          # Chinese Simplified skill (32 patterns)
├── install.sh           # Unix/macOS installation script
├── install.ps1          # Windows PowerShell installation script
├── install.bat          # Windows batch file wrapper
├── README.md            # User documentation (multilingual)
├── CLAUDE.md            # Developer documentation
└── WARP.md              # This file
```

## Key files (and how they relate)

### Language Skill Files
Each language has its own skill file with independent versioning:

- **`en/SKILL.md`** (English)
  - 24 core patterns based on Wikipedia's "Signs of AI writing"
  - Version: 2.1.1
  - Command: `/humanizer`
  - Patterns: Content, Language, Style, Communication, Filler/Hedging

- **`de/SKILL.md`** (German/Deutsch)
  - 24 core patterns + 3 German-specific patterns
  - Version: 1.0.0
  - Command: `/humanizer-de`
  - German-specific: Nominalization (#25), Passive Voice (#26), Formality (#27)

- **`zh/SKILL.md`** (Chinese Simplified/简体中文)
  - 24 core patterns + 8 Chinese-specific patterns
  - Version: 1.0.0
  - Command: `/humanizer-zh`
  - Chinese-specific: Chengyu stacking (#25), Written language (#26), Westernized syntax (#27), Intensifiers (#28), Bureaucratic phrases (#29), Comma abuse (#30), Parallel structure (#31), Translation traces (#32)

### Skill File Structure
Each SKILL.md file starts with YAML frontmatter containing:
- `name`: Skill identifier (humanizer, humanizer-de, humanizer-zh)
- `version`: Independent semantic versioning per language
- `description`: Multilingual description
- `allowed-tools`: Tools available to the skill (Read, Write, Edit, Grep, Glob, AskUserQuestion)

After the frontmatter is the editor prompt: the canonical, detailed pattern list with before/after examples in the target language.

### Documentation Files
- **`README.md`**
  - Installation instructions (automated + manual)
  - Usage examples for all three languages
  - Pattern reference tables
  - Full before/after example
  - Version history for all languages

- **`CLAUDE.md`**
  - Developer documentation
  - Contribution guidelines
  - Pattern organization details
  - YAML frontmatter rules
  - Cross-language synchronization guidelines

### Installation Scripts
- **`install.sh`** - Unix/macOS installation with auto-detection
- **`install.ps1`** - Windows PowerShell installation
- **`install.bat`** - Windows batch wrapper

All scripts install **all three language variants** simultaneously.

## Common commands

### Install all language skills into Claude Code

**Automated Installation (Recommended):**
```bash
# macOS/Linux
git clone https://github.com/blader/humanizer.git
cd humanizer
./install.sh
```

```powershell
# Windows PowerShell
git clone https://github.com/blader/humanizer.git
cd humanizer
.\install.ps1
```

**Development Mode (symlinks for live editing):**
```bash
./install.sh --symlink        # macOS/Linux
.\install.ps1 -Symlink        # Windows (requires admin)
```

**Manual Installation:**

For all languages at once:
```bash
mkdir -p ~/.claude/skills
git clone https://github.com/blader/humanizer.git ~/.claude/skills/humanizer
```

For individual language skills:
```bash
# English
mkdir -p ~/.claude/skills/humanizer-en
cp en/SKILL.md ~/.claude/skills/humanizer-en/

# German
mkdir -p ~/.claude/skills/humanizer-de
cp de/SKILL.md ~/.claude/skills/humanizer-de/

# Chinese Simplified
mkdir -p ~/.claude/skills/humanizer-zh
cp zh/SKILL.md ~/.claude/skills/humanizer-zh/
```

## How to "run" it (Claude Code)

### English
```
/humanizer

[paste your English text here]
```

Or natural language:
```
Please humanize this text: [your text]
```

### German (Deutsch)
```
/humanizer-de

[deutschen Text hier einfügen]
```

Or natural language:
```
Bitte humanisiere diesen Text: [dein Text]
```

### Chinese Simplified (简体中文)
```
/humanizer-zh

[在此粘贴中文文本]
```

Or natural language:
```
请帮我人性化这段文字：[你的文字]
```

## Making changes safely

### Versioning (independent per language)

Each language skill has independent versioning:

- **English (`en/SKILL.md`)**: Currently 2.1.1
  - Update `version:` field in YAML frontmatter
  - Update README.md "Version History" under "English Skill (en/SKILL.md)"

- **German (`de/SKILL.md`)**: Currently 1.0.0
  - Update `version:` field in YAML frontmatter
  - Update README.md "Version History" under "German Skill (de/SKILL.md)"

- **Chinese (`zh/SKILL.md`)**: Currently 1.0.0
  - Update `version:` field in YAML frontmatter
  - Update README.md "Version History" under "Chinese Simplified Skill (zh/SKILL.md)"

### Semantic Versioning Guidelines

- **Major (x.0.0)**: Complete rewrites, fundamental changes to pattern detection
- **Minor (2.x.0)**: New patterns added, significant improvements
- **Patch (2.1.x)**: Bug fixes, example clarifications, documentation updates

### Editing Language-Specific SKILL.md Files

**For All Languages:**
- Preserve valid YAML frontmatter formatting and indentation
- Keep pattern numbering stable (patterns #1-24 are synchronized across languages)
- Test changes by invoking the skill in Claude Code with native language text

**Core Patterns (#1-24):**
- Maintain conceptual alignment across all languages
- Examples should be culturally and linguistically appropriate
- Changes to core patterns should be considered for all language skills

**Language-Specific Patterns (#25+):**
- German: #25-27 (Nominalization, Passive Voice, Formality)
- Chinese: #25-32 (Chengyu, Written Language, Westernized Syntax, Intensifiers, Bureaucratic, Comma, Parallel, Translation)
- Only affect that language's version number

### Cross-Language Pattern Porting

When improving a core pattern (#1-24) in one language:

1. Identify the equivalent pattern in other languages
2. Adapt the example to be culturally and linguistically appropriate
3. Test with native language AI-generated text
4. Update all affected skills and document changes in README.md

### YAML Frontmatter Rules

**Valid YAML structure:**
```yaml
---
name: humanizer                    # Snake case, no spaces
version: 2.1.1                     # Semantic versioning
description: |                     # Pipe for multiline
  First line
  Second line
  Indent consistently (2 spaces)
allowed-tools:                     # Array of tool names
  - Read
  - Write
  - Edit
  - Grep
  - Glob
  - AskUserQuestion
---
```

**Critical**: Invalid YAML will break skill loading. Test changes by invoking the skill.

### Before/After Example Format

Each pattern should have a clear before/after pair in the target language:

**English:**
```markdown
**Before:**
> [AI-sounding text with the pattern]

**After:**
> [Natural human-sounding alternative]
```

**German:**
```markdown
**Vorher:**
> [KI-klingender Text mit dem Muster]

**Nachher:**
> [Natürlich klingende Alternative]
```

**Chinese:**
```markdown
**修改前：**
> [带有AI痕迹的文本]

**修改后：**
> [自然的人工书写文本]
```

### Testing Changes

**English Skill:**
1. Edit `en/SKILL.md`
2. Save the file
3. In Claude Code: `/humanizer` + paste English test text
4. Verify pattern detection and rewrites
5. Update README.md English section to match
6. Commit both files together

**German Skill:**
1. Edit `de/SKILL.md`
2. Save the file
3. In Claude Code: `/humanizer-de` + paste German test text
4. Verify pattern detection and rewrites
5. Update README.md German section to match
6. Commit both files together

**Chinese Skill:**
1. Edit `zh/SKILL.md`
2. Save the file
3. In Claude Code: `/humanizer-zh` + paste Simplified Chinese test text
4. Verify pattern detection and rewrites
5. Update README.md Chinese section to match
6. Commit both files together

### Documenting Changes

**For Core Pattern Changes (affects all languages):**
- Document the change in the relevant language section's version history
- Note if the change was ported from another language
- Explain what was fixed and why

**For Language-Specific Pattern Changes:**
- Document only in that language's version history
- Explain the linguistic or cultural reason for the change

**Example Version History Entry:**
```markdown
### English Skill (en/SKILL.md)
- **2.1.2** - Improved pattern #7 AI vocabulary detection to catch more synonyms
  - Added examples for "delve", "intricate", "multifaceted"
  - Ported improvements to German and Chinese skills
```

## Pattern Organization

### English (24 Patterns)
1. **Content Patterns (#1-6)**: Significance inflation, notability, superficial analysis
2. **Language Patterns (#7-12)**: AI vocabulary, copula avoidance, synonym cycling
3. **Style Patterns (#13-18)**: Em dashes, boldface, emojis, curly quotes
4. **Communication Patterns (#19-21)**: Chatbot artifacts, disclaimers, sycophantic tone
5. **Filler/Hedging (#22-24)**: Filler phrases, excessive hedging, generic conclusions

### German (27 Patterns)
- All 24 core patterns (adapted for German language)
- **#25**: Excessive Nominalization (Substantivierung)
- **#26**: Passive Voice Overuse (Passiv-Übernutzung)
- **#27**: Inappropriate Formality (Übertriebene Formalität)

### Chinese Simplified (32 Patterns)
- All 24 core patterns (adapted for Chinese language)
- **#25**: Chengyu Stacking (成语堆砌)
- **#26**: Excessive Written Language (书面语过度)
- **#27**: Westernized Syntax (西化句式)
- **#28**: Redundant Intensifiers (冗余强调)
- **#29**: Empty Bureaucratic Phrases (套话空话)
- **#30**: Comma Abuse (逗号滥用)
- **#31**: Excessive Parallel Structure (排比过度)
- **#32**: Mechanical Translation Traces (机翻痕迹)

## Source Attribution

All patterns are based on [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup.

When adding patterns:
- Check if Wikipedia has documented similar patterns
- Cite Wikipedia in pattern descriptions where applicable
- Preserve the "empirical observation" approach (not prescriptive rules)
- Adapt examples for cultural and linguistic appropriateness

## Common Pitfalls

### Don't Over-Sterilize
The "Personality and Soul" section in each skill addresses removing AI patterns while preserving human voice:
- Varied sentence rhythm
- First-person perspective when appropriate
- Opinions and mixed feelings
- Specific emotional language

### Don't Break the YAML
Common YAML errors:
- Missing closing `---`
- Inconsistent indentation (mix of tabs/spaces)
- Unquoted strings with colons
- Multiline strings without `|` or `>`

### Don't Make Patterns Too Broad
**Bad**: "Detect any use of 'the'"
**Good**: "Detect 'serves as/stands as' constructions replacing simple 'is'"

Patterns should be specific, observable, and grounded in real AI text patterns.

### Don't Assume One Language Fits All
- German AI text has unique nominalization and passive voice issues
- Chinese AI text has specific punctuation and syntax problems
- English patterns don't directly translate to other languages

## Adding New Languages

To add support for additional languages:

1. Create language directory using ISO 639-1 code (e.g., `fr/`, `es/`, `ja/`)
2. Create `SKILL.md` with appropriate YAML frontmatter
3. Translate core patterns #1-24 with culturally appropriate examples
4. Add language-specific patterns starting at #25
5. Update README.md with new language section
6. Update this WARP.md with new language documentation
7. Update installation scripts to include new language
8. Test thoroughly with native speakers and real AI-generated text

**Expected Pattern Counts:**
- Baseline: 24 patterns (English model)
- Germanic languages: ~24-30 patterns
- East Asian languages: ~28-35 patterns (more writing system issues)
