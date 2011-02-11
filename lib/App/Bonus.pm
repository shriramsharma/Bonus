package App::Bonus;

use strict;
use warnings;

use Scalar::Util::Numeric qw/isnum/;

sub compute_bonuses {
    my ($emp_data) = @_;

    my $result = {};
    for ( keys %{$emp_data} ) {
        die "Corrupt data"
          unless ( isnum( $emp_data->{$_}->{'sales'} )
            && isnum( $emp_data->{$_}->{'salary'} ) );
        $result->{$_} = $emp_data->{$_}->{'salary'} / 5
          if ( $emp_data->{$_}->{'sales'} > 30 );
    }

    return $result;
}

1;
