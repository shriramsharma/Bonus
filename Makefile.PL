#!/usr/bin/env perl

use inc::Module::Install;

name 'App-Bonus';
all_from 'lib/App/Bonus.pm';

requires 'Scalar::Util::Numeric';
test_requires 'Test::Most';
test_requires 'Test::Exception';

auto_install;
WriteAll;
