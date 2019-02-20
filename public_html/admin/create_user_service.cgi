#!/usr/bin/perl

use v5.14;

use SHM qw(:all);
use Core::Billing;

my %res;
our %in = parse_args();

my $user = SHM->new();

# Switch to user
get_service('config')->local('user_id', $in{user_id} );

$in{settings}||= {};

if ( my $us = create_service( %in ) ) {
    ( my $obj ) = get_service('UserServices')->list_for_api( usi => $us->id, admin => 1 );
    %res = %{ $obj };
}

print_header();
print_json( \%res );

exit 0;

