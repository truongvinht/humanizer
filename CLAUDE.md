# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **Claude Code skill** that removes AI-generated writing patterns from text. The skill is implemented entirely as Markdown - there is no build step, no dependencies, and no runtime beyond Claude Code reading and executing the instructions.

## File Architecture

### Core Files
- **en/SKILL.md** - English language skill definition
  - YAML frontmatter: metadata (`name: humanizer`, `version`, `description`, `allowed-tools`)
  - Prompt body: canonical pattern detection guide with 24 patterns
  - Source of truth for English language behavior
- **de/SKILL.md** - German language skill definition
  - YAML frontmatter: metadata (`name: humanizer-de`, `version`, `description`, `allowed-tools`)
  - Prompt body: German pattern detection guide with 27 patterns (24 core + 3 German-specific)
  - Source of truth for German language behavior
- **zh/SKILL.md** - Simplified Chinese language skill definition
  - YAML frontmatter: metadata (`name: humanizer-zh`, `version`, `description`, `allowed-tools`)
  - Prompt body: Chinese pattern detection guide with 32 patterns (24 core + 8 Chinese-specific)
  - Source of truth for Simplified Chinese language behavior
- **README.md** - User-facing documentation (multilingual)
  - Installation instructions for all three skills
  - Pattern summary table
  - Before/after examples
  - Version history for all skills
- **WARP.md** - WARP IDE integration guide

### Critical Constraints

#### Trilingual Architecture
The skill now supports three languages with independent skill files organized in language directories:
- English: `/humanizer` → en/SKILL.md (24 patterns)
- German: `/humanizer-de` → de/SKILL.md (27 patterns)
- Simplified Chinese: `/humanizer-zh` → zh/SKILL.md (32 patterns)

Each skill has **independent versioning** and can evolve separately.

#### Synchronization Requirements
All three skill files should maintain conceptual alignment:
- Core patterns 1-24 should address the same AI writing issues across all languages
- Pattern numbers should be stable across all languages
- Language-specific patterns (#25+) are additions, not replacements
  - German: #25-27 (nominalization, passive voice, formality)
  - Chinese: #25-32 (chengyu stacking, written language overuse, westernized syntax, redundant intensifiers, bureaucratic phrases, comma abuse, parallel structure, translation traces)
- Examples should demonstrate equivalent patterns in each language with cultural appropriateness

## Version Management

Version numbering follows semantic versioning in YAML frontmatter. **Each language skill has independent versioning.**

### English Skill (en/SKILL.md)
```yaml
---
name: humanizer
version: 2.1.1  # ← Update this AND README.md version history
---
```

### German Skill (de/SKILL.md)
```yaml
---
name: humanizer-de
version: 1.0.0  # ← Independent version, update README.md separately
---
```

### Chinese Simplified Skill (zh/SKILL.md)
```yaml
---
name: humanizer-zh
version: 1.0.0  # ← Independent version, update README.md separately
---
```

### Version Increment Guidelines

When incrementing **either** skill:
- **Major (x.0.0)**: Complete rewrites, fundamental changes to pattern detection
- **Minor (2.x.0)**: New patterns added, significant improvements
- **Patch (2.1.x)**: Bug fixes, example clarifications, documentation updates

### Cross-Language Version Strategy

- All three language skills evolve **independently**
- English skill: currently at 2.1.1 (24 patterns, established lineage)
- German skill: starts at 1.0.0 (27 patterns)
- Chinese skill: starts at 1.0.0 (32 patterns)
- Core pattern improvements should be ported across languages when applicable
- Language-specific improvements only affect that skill's version

## Pattern Organization

### English Skill (en/SKILL.md) - 24 Patterns

The English skill detects 24 distinct AI writing patterns organized into 6 categories:

1. **Content Patterns** (#1-6): Significance inflation, notability claims, superficial analysis
2. **Language Patterns** (#7-12): AI vocabulary, copula avoidance, synonym cycling
3. **Style Patterns** (#13-18): Em dashes, boldface, emojis, curly quotes
4. **Communication Patterns** (#19-21): Chatbot artifacts, disclaimers, sycophantic tone
5. **Filler/Hedging** (#22-24): Filler phrases, excessive hedging, generic conclusions
6. **Personality/Soul**: Voice, rhythm, opinions, first-person perspective

### German Skill (de/SKILL.md) - 27 Patterns

The German skill includes all 24 core patterns plus 3 German-specific patterns:

1. **Content Patterns** (#1-6): Same as English
2. **Language Patterns** (#7-12): Same as English, with German vocabulary
3. **Style Patterns** (#13-18): Same as English
4. **Communication Patterns** (#19-21): Same as English
5. **Filler/Hedging** (#22-24): Same as English
6. **German-Specific Patterns**:
   - **#25: Excessive Nominalization (Substantivierung)** - Converting verbs to nouns more than native writers
   - **#26: Passive Voice Overuse (Passiv-Übernutzung)** - Unnecessary passive constructions
   - **#27: Inappropriate Formality (Sie/du)** - Wrong formality level for context
7. **Personality/Soul**: Same approach as English

### Chinese Simplified Skill (zh/SKILL.md) - 32 Patterns

The Chinese skill includes all 24 core patterns plus 8 Chinese-specific patterns:

1. **Content Patterns** (#1-6): Same as English, with Chinese examples
2. **Language Patterns** (#7-12): Same as English, with Chinese AI buzzwords (赋能, 生态, 闭环, etc.)
3. **Style Patterns** (#13-18): Adapted for Chinese typography and punctuation
4. **Communication Patterns** (#19-21): Same as English, with Chinese chatbot artifacts
5. **Filler/Hedging** (#22-24): Chinese-specific filler phrases
6. **Chinese-Specific Patterns**:
   - **#25: Chengyu Stacking (成语堆砌)** - Overusing 4-character idioms to sound educated
   - **#26: Excessive Written Language (书面语过度)** - Using literary forms inappropriately
   - **#27: Westernized Syntax (西化句式)** - Non-native sentence structures from English influence
   - **#28: Redundant Intensifiers (冗余强调)** - Stacking emphatic words meaninglessly
   - **#29: Empty Bureaucratic Phrases (套话空话)** - Party-government style without substance
   - **#30: Comma Abuse (逗号滥用)** - Run-on sentences avoiding periods
   - **#31: Excessive Parallel Structure (排比过度)** - Overusing rhetorical parallel clauses
   - **#32: Mechanical Translation Traces (机翻痕迹)** - Word-for-word English idiom translations
7. **Personality/Soul**: Adapted for Chinese writing conventions (concrete details, natural register mixing)

### Pattern Stability

Pattern numbers are referenced externally (README, documentation). When modifying:

**For Core Patterns (#1-24):**
- Keep numbers stable across both languages
- Changes to core patterns should be considered for both skills
- Only renumber during major versions

**For Language-Specific Patterns (#25+):**
- German patterns: #25-27 (nominalization, passive voice, formality)
- Chinese patterns: #25-32 (chengyu, written language, syntax, intensifiers, bureaucratic, comma, parallel, translation)
- Future languages can add their own patterns starting at #25
- Document language-specific patterns clearly in README with both English and native names

## YAML Frontmatter Rules

The frontmatter MUST be valid YAML with proper indentation:

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
---
```

**Critical**: Invalid YAML will break skill loading. Test changes by invoking `/humanizer` in Claude Code.

## Making Safe Edits

### Before/After Example Format
Each pattern should have a clear before/after pair:

```markdown
**Before (Vorher):**
> [AI-sounding text with the pattern]

**After (Nachher):**
> [Natural human-sounding alternative]
```

### Pattern Detection Keywords
Each pattern lists "Words to watch" - these are the triggers. When adding patterns:
- List specific phrases, not general concepts
- Include variations (e.g., "serves as/stands as/marks" or "dient als/steht als/stellt dar")
- Test that keywords appear in real AI-generated text
- For German: consider compound words and grammatical variations

### Testing Changes

**English Skill:**
1. Edit en/SKILL.md
2. Save the file
3. In Claude Code: `/humanizer` + paste English test text
4. Verify pattern detection and rewrites
5. Update README.md to match
6. Commit both files together

**German Skill:**
1. Edit de/SKILL.md
2. Save the file
3. In Claude Code: `/humanizer-de` + paste German test text
4. Verify pattern detection and rewrites
5. Update README.md German section
6. Commit both files together

**Chinese Skill:**
1. Edit zh/SKILL.md
2. Save the file
3. In Claude Code: `/humanizer-zh` + paste Simplified Chinese test text
4. Verify pattern detection and rewrites
5. Update README.md Chinese section
6. Commit both files together

### Cross-Language Pattern Porting

When improving a core pattern (#1-24) in one language, consider porting it to the other:
1. Identify the equivalent pattern in the target language
2. Adapt the example to be culturally and linguistically appropriate
3. Test with native language AI-generated text
4. Update both skills and document changes in README

## Source Attribution

All patterns are based on [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup.

When adding patterns:
- Check if Wikipedia has documented similar patterns
- Cite Wikipedia in pattern descriptions where applicable
- Preserve the "empirical observation" approach (not prescriptive rules)

## Common Pitfalls

### Don't Over-Sterilize
The "Personality and Soul" section in each skill file addresses a key failure mode: removing AI patterns but leaving soulless writing. Good human writing has:
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
Bad: "Detect any use of 'the'"
Good: "Detect 'serves as/stands as' constructions replacing simple 'is'"

Patterns should be specific, observable, and grounded in real AI text patterns.

## Skill Invocation

### English Skill
Users can invoke the English skill in Claude Code via:
- `/humanizer` (explicit command)
- Natural language: "Please humanize this text: [text]"
- Auto-activation when editing/reviewing English text (if configured)

### German Skill
Users can invoke the German skill in Claude Code via:
- `/humanizer-de` (explicit command)
- Natural language: "Bitte humanisiere diesen Text: [text]"
- Auto-activation when editing/reviewing German text (if configured)

### Chinese Simplified Skill
Users can invoke the Chinese skill in Claude Code via:
- `/humanizer-zh` (explicit command)
- Natural language: "请帮我人性化这段文字：[text]"
- Auto-activation when editing/reviewing Simplified Chinese text (if configured)

### Available Tools
Both skills have access to the same tools (defined in `allowed-tools`):
- Read, Write, Edit: File operations
- Grep, Glob: Search operations
- AskUserQuestion: Clarification when needed

## Language-Specific Considerations

### German Language Patterns

The German skill adds 3 language-specific patterns that are uniquely problematic in German AI text:

**#25: Nominalization (Substantivierung)**
- German AI over-uses noun forms of verbs
- Example: "die Durchführung der Analyse" → "wir analysieren"
- This creates dense, bureaucratic-sounding text

**#26: Passive Voice Overuse**
- German allows extensive passive constructions
- AI overuses them, creating impersonal text
- Example: "Es wurde festgestellt" → "Wir stellten fest"

**#27: Formality Mismatch**
- German has formal (Sie) and informal (du) address
- AI often chooses the wrong register for context
- Requires cultural understanding of appropriate usage

### Chinese Language Patterns

The Chinese skill adds 8 language-specific patterns that are uniquely problematic in Chinese AI text:

**#25: Chengyu Stacking (成语堆砌)**
- Chinese AI overuses 4-character idioms to sound educated
- Example: 众所周知、显而易见、理所当然 in one paragraph
- Creates artificial literary tone

**#26: Excessive Written Language (书面语过度)**
- AI uses literary forms (因此、故、然而) instead of natural spoken forms (所以、但是)
- Context mismatch: formal language in casual contexts
- Requires understanding of register appropriateness

**#27: Westernized Syntax (西化句式)**
- Long sentences with stacked 的 modifiers
- Subject-object-verb patterns from English influence
- Example: 由AI生成的这些文本的特点的分析 (multiple 的)

**#28: Redundant Intensifiers (冗余强调)**
- Stacking: 非常十分极其相当
- AI doesn't understand semantic redundancy
- Creates unnatural emphasis

**#29: Empty Bureaucratic Phrases (套话空话)**
- Party-government style formulas: 深入贯彻落实、高度重视
- Sounds official but says nothing specific
- Common in Chinese AI trained on official documents

**#30: Comma Abuse (逗号滥用)**
- Run-on sentences with 10+ commas
- Should use periods (句号) but AI avoids them
- Creates breathless, unnatural reading experience

**#31: Excessive Parallel Structure (排比过度)**
- Three or more parallel clauses for rhetorical effect
- AI overuses this traditional rhetorical device
- Example: 我们要...、我们要...、我们要... (repeated structure)

**#32: Mechanical Translation Traces (机翻痕迹)**
- Word-for-word English idiom translations
- Example: 在...的结尾 (at the end of) instead of ...的最后
- Reveals non-native expression patterns

### Chinese Typography and Punctuation

Chinese has specific punctuation conventions that AI often violates:

**Correct Chinese Punctuation:**
- Period: 。 (full-width)
- Comma: ，(full-width)
- Quotation marks: "" or 「」 (not straight quotes "")
- Em dash: —— (double, not single —)
- Ellipsis: …… (six dots, not three ...)

**AI Typography Errors:**
- Using half-width punctuation (,.) instead of full-width (，。)
- Straight quotes instead of Chinese quotes
- Single em dash instead of double
- Inconsistent spacing around Chinese/English/numbers

### Testing with Real AI Text

When testing pattern detection:
- Use actual AI-generated text in the target language
- Test with different AI models (ChatGPT, Claude, Wenxin Yiyan, etc.)
- Verify cultural and linguistic appropriateness
- Check that rewrites sound natural to native speakers
- For Chinese: verify proper Simplified Chinese characters and punctuation

### Future Language Support

The framework now supports three languages (English, German, Simplified Chinese) and is extensible to more:

To add support for additional languages:
1. Create a new language directory using ISO 639-1 code (e.g., `fr/`, `es/`, `ja/`)
2. Create `SKILL.md` inside that directory with appropriate YAML frontmatter
3. Translate core patterns #1-24 with culturally appropriate examples
4. Add language-specific patterns starting at #25
   - Study AI writing patterns unique to that language
   - Consider linguistic features (grammar, syntax, writing systems)
   - Identify cultural factors (formality, idioms, rhetoric)
5. Update README.md with new language section
6. Update this CLAUDE.md file with language-specific documentation
7. Test thoroughly with native speakers and real AI-generated text

**Example Pattern Counts:**
- English: 24 patterns (baseline)
- German: 27 patterns (+3 for nominalization, passive voice, formality)
- Chinese: 32 patterns (+8 for chengyu, written language, westernized syntax, bureaucratic phrases, etc.)
- Future languages: estimate 24-35 patterns depending on linguistic complexity
