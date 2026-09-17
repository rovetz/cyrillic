# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Reverse transliteration (detransliteration) via `Cyrillic.detransliterate` (and aliases `.det`, `.reverse_transliterate`) with reverse mapping tables and longest-token-first greedy matching.
- CLI flag `-r, --reverse` for reversing transliterated text back to Cyrillic.
- Serbian transliteration scheme (`:serbian`) translating Vuk's Cyrillic to Gaj's Latin (`Lj`, `Nj`, `Dž`, `Đ`, `Ć`).
- GOST 7.79-2000 System B transliteration scheme (`:gost779b`) with standard ASCII digraphs.
- BGN/PCGN 1947 geographic romanization scheme (`:bgn_pcgn`).
- Bulgarian official Streamlined System transliteration scheme (`:bulgarian`).
- Belarusian national / UN 2012 Łacinka transliteration scheme (`:belarusian`).
- CLI executable support and unit test coverage for all 5 new schemes.

## [0.3.0] - 2026-09-17

### Added
- CLI executable `exe/cyrillic` supporting direct arguments, files, piped STDIN, and scheme flag (`-s`).
- Integration tests for CLI arguments, flags, files, and STDIN input.
- GitHub Actions CI workflow for modern Ruby versions (`3.3`, `3.4`, `head`) on `main` branch.
- Automated GitHub Actions release workflow for building and publishing gem on git tag push.
- Dependabot configuration for automated Bundler and GitHub Actions dependency updates.
- Precompiled and cached regular expressions for character tables for improved performance.
- Case-insensitive scheme resolution (e.g. `:iso9`, `"ISO9"`, `:de`, `"UA_PASSPORT"`).
- Informative `ArgumentError` when an unknown transliteration scheme is specified.
- Standard gem metadata URIs (`source_code_uri`, `changelog_uri`, `bug_tracker_uri`, `rubygems_mfa_required`).
- Comprehensive YARD documentation with examples for `Cyrillic.transliterate` and `Cyrillic.t`.
- SimpleCov test coverage tracking achieving 100% line coverage.
- Unit tests for edge cases (nil, empty strings, scheme normalization, error handling).

### Changed
- Namespaced scheme modules under `Cyrillic` (`Cyrillic::Iso9`, `Cyrillic::Mongolian`, `Cyrillic::Ukrainian`, `Cyrillic::UaPassport`, `Cyrillic::De`) with backwards-compatible top-level aliases.
- Set minimum required Ruby version to `>= 3.3.0` in gemspec.
- Update development dependencies (rubocop, rake, rdoc, irb, minitest, simplecov).
- Untrack `Gemfile.lock` and add to `.gitignore` following gem development best practices.
- Add `.gitattributes` for consistent LF line endings and diff drivers.
- Integrate RuboCop code style checks into default `rake` task.
- Update copyright year to 2018-2026 in `LICENSE.txt`.

### Fixed
- Eliminate mutable string literal warnings under Ruby 3.4+ in Ukrainian Passport transliteration.
- Fix character mappings and duplicate key warnings in ISO 9 table (`ӵ` and `ҿ`).

### Removed
- Legacy `.travis.yml` configuration.
- Empty 0-byte placeholder files from `lib/cyrillic/`.

## [0.2.0] - 2025-11-09

### Added
- ISO 9 transliteration support (`:iso9`).
- Mongolian transliteration support (`:mongolian`).
- Ukrainian transliteration support (`:ukrainian`).
- Ukrainian passport transliteration standard support (`:ua_passport`).
- German transliteration standard support (`:de`).

## [0.1.0] - 2018-04-05

### Added
- Initial release.
- Core Cyrillic transliteration to Roman (Latin) script.
