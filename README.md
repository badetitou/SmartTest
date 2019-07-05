# SmartTest

Master: [![Master](https://travis-ci.org/badetitou/SmartTest.svg?branch=master)](https://travis-ci.org/badetitou/SmartTest/branches)
Development: [![development](https://travis-ci.org/badetitou/SmartTest.svg?branch=development)](https://travis-ci.org/badetitou/SmartTest/branches)

## What is SmartTest ?

SmartTest is a plugin developed in [Pharo](http://pharo.org/). It is an Add-On for Quality Assistant by [Yuriy Tymchuk](http://yuriy.tymch.uk/) and provides new rules and critiques.
But it has also is own implementation of feedback about testing

The goal of SmartTest is to provide to the developers the list of tests they should run after they modify their code.
With this plugin installed, developers will save time and will develop in a better way (hopefully).

## Installation

The complete presentation is available [here](http://badetitou.github.io/research/smalltalk/2017/08/21/SmartTest/).

## Development version

Evaluate this code in a Playground to load the SmartTest development version:


```Smalltalk
Metacello new
  baseline: #SmartTest;
  githubUser: 'badetitou' project: 'SmartTest' commitish: 'development' path: '.';
  onWarningLog;
  load
```
