#!/bin/bash

# install plenv - part 2

PERL_VERSION=5.24.0

# pull plenv perl-build
git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

# build Perl
plenv install -D usethreads -D man1dir=none -D man3dir=none $PERL_VERSION
plenv rehash
plenv global $PERL_VERSION
plenv install-cpanm
