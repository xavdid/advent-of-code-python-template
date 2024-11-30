# CHANGELOG

Though this repo doesn't have traditional "releases", I do periodically add features and make breaking changes to the way `advent`, and my `BaseSolution` work. I handle the updates to my existing solutions, but if you periodically copy my helpers back into your repo, it will be helpful to know how far behind your version of this repo is.

Below is a rough changelog of new features added, which largely follows [SemVer](https://semver.org/):

- Breaking changes will require you to update existing solutions to continue working
- Minor versions add new, backwards-compatible features you may want to start using
- Patch versions are internal functionality updates or changes to the template that won't affect compatibility with existing solutions

## 4.0.3

_released `2024-11-30`_

- Update default input parsing in new solutions from `TextSolution` to `StrSplitSolution` (so input is treated as a list of strings by default)

## 4.0.2

_released `2024-08-17`_

- ⚠️ add additional lints
- improve some typing in `base.py`
- add more `justfile` scripts

## 4.0.1

_released `2023-11-30`_

- improve error message when an `@answer` assertion fails

## 4.0.0

_released `2023-09-30`_

This repo is now [a GitHub template](https://github.com/xavdid/advent-of-code-python-template)! It's easier than ever to use it for your solutions. See [the README](https://github.com/xavdid/advent-of-code-python-template/#quickstart) for more info.

- add a placeholder for a utils folder
- add a [justfile](https://github.com/casey/just) to simplify running commands. It's sparse for now but might have more in the future!
- add `input.txt` to the `.gitignore`
- tweak `.vscode/settings` to show your inputs
- improve error messages for missing/empty files
- improve error messages for failed `@answer` assertions
- removed old migration file

The following changes are breaking updates from my [existing solutions](https://github.com/xavdid/advent-of-code/). If you're starting fresh, you can ignore them.

- :exclamation: remove `TSV` as an input type
- :exclamation: rename `BaseSolution.pp` to `BaseSolution.debug` and simplify what it prints. Notably, it no longer looks for `.pretty()` methods and just prints each of its arguments
- :exclamation: remove all my custom helpers; it's up to you now!
- :exclamation: rename `BaseSolution.debug` to `.is_debugging`
- :exclamation: remove the `BaseSolution.newline` function - it was undocumented and now exists as a `kwarg` on `BaseSolution.debug`
- :exclamation: require Python `3.12`. There were no code changes associated with change, but this serves as the official warning that `3.12`-specific additions may happen with no further breaking change notifications

---

Everything down here is historical. Unless you've been using my

## 3.1.3

_released `2023-03-17`_

- fixed: only trim leading and trailing newlines, not all whitespace

## 3.1.2

_released `2023-01-29`_

- fixed: `@answer` assertion ignores check when function result is `None`

## 3.1.1

_released `2022-12-21`_

- fixed: argument error when running the profiler

## 3.1.0

_released `2022-12-18`_

- added: the `--time` CLI flag, which will tell you how long your solutions took. More accurate than running at the shell level (see README).
- improved: the `@slow` decorator won't block running sample input

## 3.0.1

_released `2022-12-15`_

- fixed: mark some base class methods as `@final`; won't break runtime code, but will throw typing errors if you're overwriting methods you shouldn't be

## 3.0.0

_released `2022-12-13`_

- :exclamation: BREAKING: requires python@3.11.x to take advantage of some new typing features (see below)
- fixed: really nail the typing around the `@answer` decorator, which will require its arguments to match the return type of the wrapped function
- fixed: remove some `typing` imports and replaced with their generic containers (which is preferred since Py 3.9); adjusted template accordingly

## 2.2.0

_released `2022-12-12`_

- added: `max_x_size` and `max_y_size` to `base.neighbors`
- fixed: improved handling of non-tuple responses from `solve`

## 2.1.4

_released `2022-12-07`_

- fixed: further improved the typing around the `@answer` to support `tuple` responses from `solve`

## 2.1.3

_released `2022-12-06`_

- fixed: improved the typing around the `@answer` decorator to better support (rare) non-int answers

## 2.1.2

_released `2022-12-04`_

- fixed: simplified answer parsing code by _always_ calling `solution.solve()` and having it default to calling parts 1 & 2 itself.

## 2.1.1

_released `2022-12-01`_

- fixed: typing for the TSV input type
- fixed: simplify the input parsing internals

## 2.1.0

_released `2022-11-30`_

- added: the `--version` flag to `advent`
- added: the `--test-data` flag to `advent`; `start` now creates this by default
- fixed: the `start` command now treats November 30th as part of the current puzzle year

## 2.0.0

_released `2022-10-29`_

In the interest of not going too far back in time, this is the first version tracked in the changelog.

- BREAKING CHANGE: pad the folder names for days 1-9 with a leading 0 (e.g. `day_1/...` -> `day_01/...`. Run `python misc/pad_day_migration.py` from the repo root to update your local files. Only really tested on macOS, so proceed with a little caution. You'll also need to update any existing GitHub urls to use the padded day number.

## 1.x.x

All versions of this repo prior to `2022-10-28` are using what is henceforth known as the "1.0" version of this package. See [2.0](#200) for migration information.
