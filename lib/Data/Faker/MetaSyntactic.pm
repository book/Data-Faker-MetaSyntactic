package Data::Faker::MetaSyntactic;

use strict;
use warnings;

use Data::Faker;
our @ISA = qw( Data::Faker );

use Acme::MetaSyntactic ();

my $meta = Acme::MetaSyntactic->new('any');

# register default plugin
__PACKAGE__->register_plugin( meta => sub { $meta->name() } );

# record one plugin per existing theme
for my $theme ( $meta->themes ) {
    __PACKAGE__->register_plugin(
        "meta_$theme" => sub { $meta->name($theme) } );
}

1;

