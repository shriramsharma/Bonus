#!/usr/bin/env perl -T

use strict;
use warnings;

use Test::Most qw/no_plan/;
use Test::Exception;

use_ok 'App::Bonus';

my $correct_emp_data = {
    "bob" => {
        salary => 38.7,
        sales  => 23,
    },
    "jane" => {
        salary => 50.3,
        sales  => 36,
    },
    "jack" => {
        salary => 44.2,
        sales  => 30,
    },
    "Mike" => {
        salary => 77.9,
        sales  => 39,
    },
    "veronica" => {
        salary => '55.3',
        sales  => '41',
    },
};

my $corrupt_data = {
    "Rick" => {
        salary => 'should_fail',
        sales  => 'Test_fail',
    },
    "Debi" => {
        salary => 50.3,
        sales  => 'testing_failure',
    },
};

is_deeply(
    App::Bonus::compute_bonuses($correct_emp_data),
    { "jane" => 10.06, "Mike" => 15.58, "veronica" => 11.06 },
    "Correct Result"
);

throws_ok { App::Bonus::compute_bonuses($corrupt_data) } qr/Corrupt data/,
  'Tested for corrupt data';

1;
