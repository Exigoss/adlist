#!/usr/bin/perl -w
use strict;

my %hosts = ();
	while ( <> ) {
	if ( $_ =~ m/^\|\|([a-z][a-z0-9-_.]+\.([a-z]{2,3}))\^\s*$/ ) {
		$hosts{$1} = 1;
	}
}

foreach my $host ( sort keys %hosts ) {
	print( "$host\n" );
}
