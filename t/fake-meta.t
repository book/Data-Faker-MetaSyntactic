use strict;
use warnings;
use Test::More;

use Data::Faker 'MetaSyntactic';
use Acme::MetaSyntactic ();

# test using all themes
my @themes = grep ! /^(?:any|random)$/, Acme::MetaSyntactic->themes;
my $meta   = Acme::MetaSyntactic->new;

plan tests => scalar @themes;

my $faker = Data::Faker->new;
for my $theme ( sort @themes ) {
    my $provider = "meta_$theme";
    my %item = map +( $_ => 1 ), $meta->name( $theme => 0 );
    my $item = $faker->$provider;
    ok( exists $item{$item}, "$theme: $item" );
}
