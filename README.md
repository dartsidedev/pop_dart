# `pop_dart`

> A delicious Dart library.

I'm going to write a proper description later, I promise.

[![Continuous Integration](https://github.com/dartsidedev/pop_dart/workflows/Continuous%20Integration/badge.svg?branch=master)](https://github.com/dartsidedev/pop_dart/actions) [![codecov](https://codecov.io/gh/dartsidedev/pop_dart/branch/master/graph/badge.svg)](https://codecov.io/gh/dartsidedev/pop_dart) [![pop_dart](https://img.shields.io/pub/v/pop_dart?label=pop_dart&logo=dart)](https://pub.dev/packages/pop_dart 'See pop_dart package info on pub.dev') [![Published by dartside.dev](https://img.shields.io/static/v1?label=Published%20by&message=dartside.dev&logo=dart&logoWidth=30&color=40C4FF&labelColor=1d599b&labelWidth=100)](https://pub.dev/publishers/dartside.dev/packages) [![GitHub Stars Count](https://img.shields.io/github/stars/dartsidedev/pop_dart?logo=github)](https://github.com/dartsidedev/pop_dart 'Star me on GitHub!')

## Important links

* [Source code](https://github.com/dartsidedev/pop_dart)
* [Package info](https://pub.dev/packages/pop_dart)
* [Issues](https://github.com/dartsidedev/pop_dart/issues)
* [API Documentation](https://pub.dev/documentation/pop_dart)
* [Examples](https://github.com/dartsidedev/pop_dart/tree/master/example)

## Warning

With this package, I'm learning both how to write reusable, idiomatic Dart code and how to implement common algorithms and data structures.
The package is not ready for production use yet and the API might change from one release to another.

## Philosophy

This package is a collection of common data structures and algorithms that are not part of the Dart SDK,
the Dart [`dart:collection`](https://api.dart.dev/stable/dart-collection/dart-collection-library.html) library,
and the [`package:collection`](https://pub.dev/packages/collection) package by the Dart team.

## Sorting



Pros and cons

Different usages: xyzSort, extension on List: sortWith(xyzSorter), and xyzSort.

Why

Benchmark

Benchmark disclaimer: always do your own before switching from the default sorting alg.

TODO: priority queues are in collections
TODO: in some cases, I reimplemented stuff. why: probably because I think it's better?


# TODO

Here are some issues that I still don't fully understand and I want to research later.

* Would be great to understand the `library` keyword
* library+part+part+of (Quiver) vs export (Flutter)
* Why we needed a class for sorting? Could have we just use simple functions?
* Benchmarks: For example, benchmark the three solutions for insertion sorts in Programming Pearls.
    * Depending on the speed and code readability, keep one (as it is a library, prefer speed)
* generic arg on class or on method?
* it would be good to have a stricter lint rule set up for this project, it's easy to be messy.