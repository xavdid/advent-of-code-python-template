# @xavdid's Python Advent of Code Project Template

This is my tried-and-true Python utility package for the phenomenal [Advent of Code](https://adventofcode.com/) puzzles. It handles creating stub solutions, input parsing, and printing your answer, letting you focus on the actual solve. I've been [using it since 2017](https://github.com/xavdid/advent-of-code). It doesn't do _too_ much though- it doesn't pull or submit your input automatically, so no auth is required.

Additionally, Over in the main repo, I include a step-by-step [explanation of each puzzle](https://advent-of-code.xavd.id/) if you're in the learning mood!

## Quickstart

To use this base class for your own solutions:

1. Ensure you have Python `3.12` or higher. You can use [mise](https://mise.jdx.dev/) or [pyenv](https://github.com/pyenv/pyenv) to manage your Python versions. It may work on older versions, but `3.12`-specific features will be added without further breaking changes
2. Create a new repo using this template ([docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template)) and clone it locally
3. Start a new solution using `./start`
4. Edit the newly created file at `solutions/YEAR/day_01/solution.py`
5. Run your code answers using `./advent`
6. Repeat and enjoy!

## Commands

This repo has two main commands: `start` and `advent`.

### `./start`

#### Usage

> `./start [-h] [--year YEAR] [day]`

Scaffold files to start a new Advent of Code solution

**positional arguments**:

- `day` (optional): Which puzzle day to start, between `[1,25]`. Defaults to the next day _without_ a folder (matching `day_NN`) in the specified year.

**optional arguments**:

- `-h, --help` (optional): show this help message and exit
- `--year YEAR` (optional): Puzzle year. Defaults to current year if December has begun, otherwise previous year.

#### Examples

- `./start`
- `./start 2`
- `./start 3 --year 2019`

### `./advent`

#### Usage

> `./advent [--year year] [--test-data] [--debug] [--profile] [--slow] [--time] [day]`

Run a specific day of Advent of Code

**informational flags**

- `-h, --help`: Show this help message and exit
- `--version`: Print version info and exit

**positional arguments**:

- `day` (optional): Which puzzle day to start, between `[1,25]`. Defaults to the latest day _with_ a folder (matching `day_NN`) in the specified year.

**optional flags**:

- `--year YEAR`: puzzle year. Defaults to current year if December has begun, otherwise previous year
- `-t, --test-data`: read puzzle input from `input.test.txt` instead of `input.txt`. Ignores `@answer` decorators (see [saving answers](#saving-answers))
- `--debug`: prints normally-hidden debugging statements (written with `self.debug(...)`). See [debugging](#debugging)
- `--profile`: run solution through a performance profiler
- `--slow`: specify that long-running solutions (or those requiring manual input) should be run. They're skipped otherwise
- `--time`: print information about how long solutions took to run. More useful than timing at a shell level, since this only starts the timer once all imports have happened and any `advent`-related code is done.

#### Examples

- `./advent`
- `./advent 2`
- `./advent 5 --year 2019`
- `./advent 7 --test-data`
- `./advent 9 -t --debug`

## File Structure

<!-- generated with https://tree.nathanfriend.io/ -->

```
solutions/
├── ...
└── 2020/
    ├── day_01/
    │   ├── solution.py
    │   ├── input.txt
    │   ├── input.test.txt
    │   └── README.md
    ├── day_02/
    │   ├── solution.py
    │   ├── ...
    └── ...
```

- each year has a folder (`YYYY`)
- each day in that year (will eventually) have a folder (`day_NN`)

Each `day_NN` folder has the following files:

- `solution.py`, which has a `class Solution`. `./advent` expects both that filename and that class name exactly, so you shouldn't change them. See [Writing Solutions](#writing-solutions) for how the file is structured
- `input.txt` holds your individualized input from the AoC site. Make sure [not to share it publicly](https://old.reddit.com/r/adventofcode/wiki/troubleshooting/no_asking_for_inputs)!
- `input.test.txt` holds the example input from the prompt. It's read when the `--test-input` flag is used (see below). It also won't throw errors if the result doesn't match the [answer](#saving-answers). You can also do all your work in `input.txt`, but it's marginally less convenient
- `README.md` is a convenient place to take notes or explain your solution

## Writing Solutions

### The `Solution` Class

A helpful base class on which to build your AoC solutions. It's got 2 required properties (which should be pre-filled if you use `./start`): `_year` and `_day`, corresponding to the puzzle you're solving.

Your puzzle input, the parsed contents of the day's `input.txt`, will be available at `self.input`. Learn more in [Reading Input](#reading-input).

There's also a convenience method for print-based debugging: `self.debug()`. You can pass it any number of items and they'll get pretty-printed. It only prints if you use the `--debug` flag with `./advent`.

### Reading Input

AoC input takes a number of forms, so there are a number of simple modes for input parsing. Your generated `Solution` class should inherit from one of the following classes, which will parse `self.input` for you:

| Inherited Class                  | description                                               | sample input for this mode |
| -------------------------------- | --------------------------------------------------------- | -------------------------- |
| `StrSplitSolution` (the default) | `str[]`, split by a specified separator (default newline) | a<br>b<br>c<br>d<br>e      |
| `TextSolution`                   | one solid block of text                                   | `abcde`                    |
| `IntSplitSolution`               | `int[]`, split by a specified separator (default newline) | 1<br>2<br>3<br>4<br>5      |
| `IntSolution`                    | one number                                                | `12345`                    |

```py
# input file is "12345"

from ...base import (
    IntSolution,
    IntSplitSolution,
    StrSplitSolution,
    TextSolution,
)

for BaseClass in [TextSolution, IntSolution, StrSplitSolution, IntSplitSolution]:

    class Solution(BaseClass):
        def show_input(self):
            print(f"\n{self.input} (type: {type(self.input)})\n")

    Solution().show_input()

# 12345 (type: <class 'str'>)
# 12345 (type: <class 'int'>)
# ['12345'] (type: <class 'list'>)
# [12345] (type: <class 'list'>)
```

You can also change the separator to change how the `SplitSolution`s work:

```py
# input file is "1,2,3,4,5"

from ...base import IntSplitSolution, StrSplitSolution

for BaseClass in [StrSplitSolution, IntSplitSolution]:

    class Solution(BaseClass):
        separator = ","

        def show_input(self):
            print(f"\n{self.input} (type: {type(self.input)})\n")

    Solution().show_input()

# ['1', '2', '3', '4', '5'] (type: <class 'list'>)
# [1, 2, 3, 4, 5] (type: <class 'list'>)
```

### Solution Functions

Each AoC puzzle has two parts, so there are two functions you need to write: `part_1` and `part_2`. Each should return an `int`, since that's typically the answer that AoC expects.

Sometimes, it's easier to calculate both parts in a single function (such as if the answer is asking about two parts of a single computation). In that case, there's also a `solve()` method, which should return a 2-tuple with your answers (like `(5, 7)`). `solve` **takes precedence if present**. Feel free to delete any unused functions when you're done.

```py

class Solution(TextSolution):
    def part_1(self) -> int:
        return some_computation()

    def part_2(self) -> int:
        return some_other_computation()

    # or:

    def solve(self) -> tuple[int, int]:
        part_1 = 0
        total = 0

        for i in range(10):
            result = some_computation()
            if i == 0:
                part_1 = result

            total += result

        return result
```

### Saving Answers

Once you've solved the puzzle, you can decorate your answer function (`solve` or `part_N`) with the `@answer` decorator. It asserts that the value returned from the function is whatever you pass to the decorator:

```py
class Solution(TextSolution):
    _year = 2022
    _day = 5

    @answer(123)
    def part_1(self) -> int:
        return 123

    @answer(234)
    def part_2(self) -> int:
        return 123 # err!
```

This is helpful for ensuring your answer doesn't change when editing your code after you've solved the puzzle. It's included as a comment in the template. It's ignored when running against test input, so it's easy to verify as you go.

### Debugging

The base class includes a `self.debug` method which will pretty-print all manner of inputs. These only show up when the `--debug` flag is used, making it a convenient way to show debugging info selectively.

### Linting & Type Checking

I recommend the following tools:

- [Ruff](https://astral.sh/ruff), a lightning-fast linter (to help you catch bugs)
- [Pyright](https://github.com/microsoft/pyright), a type checker to identify logical errors (also available in VSCode using their Python plugin)

If you have both available, then `just lint` will run them both. I've included a simple `ruff` configuration file to help get you started.

### Marking Slow Solutions

If you're running many solutions at once and want to exclude individual parts of solutions (or entire days), you can mark individual functions with the `@slow` decorator. They'll print a warning, but won't actually run the solution.
