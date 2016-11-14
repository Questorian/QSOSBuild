#!/usr/bin/env perl

use strict;
use warnings;

my @accounts = qw / qssysadm qsdevop qsapp qsdb qsdbro /;
my $pass = 'Questor123';
my $salt = 'qsos';

foreach my $acc (@accounts){
        print "creating account: $acc\n";
                my $crypt = crypt($pass, $salt);
                        `useradd --create-home --shell '/bin/bash' -p $crypt $acc`;
                                }

