# Changelog

All notable changes to the Humanizer skill project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## English Skill (en/SKILL.md)

### [2.1.1] - 2026-01-28

#### Fixed
- Fixed pattern #18 example (curly quotes vs straight quotes)
- Corrected before/after demonstration to properly show the difference between curly and straight quotation marks

### [2.1.0] - 2026-01-28

#### Added
- Added before/after examples for all 24 patterns
- Each pattern now includes clear demonstration of AI-sounding text vs. human-sounding alternative
- Improved pattern clarity with concrete examples

### [2.0.0] - 2026-01-28

#### Changed
- Complete rewrite based on raw Wikipedia article content
- Restructured pattern organization for better clarity
- Enhanced pattern detection accuracy
- **BREAKING**: Significant changes to pattern definitions and examples

### [1.0.0] - 2025-12-15

#### Added
- Initial release of English humanizer skill
- 24 core patterns based on Wikipedia's "Signs of AI writing"
- Pattern categories: Content, Language, Style, Communication, Filler/Hedging
- Basic before/after examples
- Integration with Claude Code skill system

---

## German Skill (de/SKILL.md)

### [1.0.0] - 2026-01-28

#### Added
- Initial German language release
- All 24 core patterns adapted for German language
- 3 German-specific patterns:
  - **#25**: Excessive Nominalization (Substantivierung) - Converting verbs to nouns unnecessarily
  - **#26**: Passive Voice Overuse (Passiv-Übernutzung) - Unnecessary passive constructions
  - **#27**: Inappropriate Formality (Übertriebene Formalität) - Wrong formality level (Sie/du) for context
- German-specific examples and cultural adaptations
- Independent versioning system for German skill

---

## Chinese Simplified Skill (zh/SKILL.md)

### [1.0.0] - 2026-01-28

#### Added
- Initial Simplified Chinese language release
- All 24 core patterns adapted for Chinese language
- 8 Chinese-specific patterns:
  - **#25**: Chengyu Stacking (成语堆砌) - Overusing 4-character idioms
  - **#26**: Excessive Written Language (书面语过度) - Using literary forms inappropriately
  - **#27**: Westernized Syntax (西化句式) - Non-native sentence structures
  - **#28**: Redundant Intensifiers (冗余强调) - Stacking emphatic words
  - **#29**: Empty Bureaucratic Phrases (套话空话) - Party-government style without substance
  - **#30**: Comma Abuse (逗号滥用) - Run-on sentences avoiding periods
  - **#31**: Excessive Parallel Structure (排比过度) - Overusing rhetorical parallel clauses
  - **#32**: Mechanical Translation Traces (机翻痕迹) - Word-for-word English idiom translations
- Chinese typography and punctuation guidelines
- Cultural context adaptations for Chinese writing conventions
- Independent versioning system for Chinese skill

---

## Installation & Tooling

### [1.0.0] - 2026-01-28

#### Added
- Cross-platform installation scripts (macOS/Linux/Windows)
- Automated skill directory detection
- Symlink mode for development workflow
- Custom directory installation option
- Backup functionality for existing skills
- Post-installation verification
- All-in-one installer for all three language variants

---

## Documentation

### [1.0.0] - 2026-02-02

#### Added
- Professional README.md with badges and emoji-prefixed sections
- Comprehensive WARP.md covering all three language variants
- CLAUDE.md developer documentation
- Multilingual usage examples
- Platform compatibility matrix
- Contributing guidelines
- Roadmap section with completed and planned features

#### Changed
- Repository links updated from original (blader/humanizer) to fork (truongvinht/humanizer)
- Restructured documentation for better user journey
- Added Features, Quick Start, and Usage Examples sections
- Improved visual hierarchy with emoji prefixes and horizontal dividers

---

## [Unreleased]

### Planned
- Additional patterns based on community feedback (v2.2.0)
- Multi-language pattern synchronization system (v3.0.0)
- Traditional Chinese (繁體中文) language support
- French language support
- Spanish language support
- Japanese language support
- Pattern effectiveness dashboard
- Integration with additional AI coding platforms
- Platform compatibility testing (OpenCode, Windsurf)

---

## Notes

### Version Numbering
- Each language skill has **independent versioning**
- English skill: Currently at 2.1.1 (established lineage)
- German skill: Currently at 1.0.0 (initial release)
- Chinese skill: Currently at 1.0.0 (initial release)

### Semantic Versioning Guidelines
- **Major (x.0.0)**: Complete rewrites, fundamental changes to pattern detection
- **Minor (2.x.0)**: New patterns added, significant improvements
- **Patch (2.1.x)**: Bug fixes, example clarifications, documentation updates

### Pattern Synchronization
- Core patterns (#1-24) maintain conceptual alignment across all languages
- Language-specific patterns (#25+) are independent additions
- Cross-language improvements are documented in respective sections
