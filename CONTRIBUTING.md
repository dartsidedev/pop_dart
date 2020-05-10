# Development

## To do

* Setup Travis CI
* Add Dart web example
* Add fancy Flutter example in separate folder: calculate user's wallet value in the selected currency
* Add fancy Server example in separate folder: CLI accept currencies as command-line arguments and output price
* Example folder should not be analyzed.


## Build `.g.dart` files

```
$ pub run build_runner build lib
```

## Unit tests

You can run the unit tests easily:

```
pub run test
```

## Autoformat code

To format the code from the command line using `dartfmt`, type:

```
$ dartfmt -w .
```

## Run static analysis

We use [`dartanalyzer`](https://dart.dev/tools/dartanalyzer) to run static analysis on this project.

```
$ dartanalyzer .
```

This project's [`analysis_options.yaml`](./analysis_options.yaml) file is taken from the [`flutter/flutter`](https://github.com/flutter/flutter/blob/master/analysis_options.yaml) project.

## Test coverage

I still didn't figure out how to collect coverage info easily, with one command. For now use this locally:

```
dart --pause-isolates-on-exit --enable-vm-service=NNNN test/*
# Then in a different window
pub run coverage:collect_coverage -o coverage/coverage.json --uri=http://127.0.0.1:60648/9RKIs19q3Q8\=/
pub run coverage:format_coverage --lcov --in coverage/coverage.json --out coverage/lcov.info --packages=.packages --report-on=lib
genhtml coverage/lcov.info -o coverage
open coverage/index.html
```

This helped so far: http://blog.wafrat.com/test-coverage-in-dart-and-flutter/

* [ ] Integrate it in CI pipeline
* [ ] Exclude `.g.dart` files from code coverage
* [ ] Find a way to extract coverage percentage
    