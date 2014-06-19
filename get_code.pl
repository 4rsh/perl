#!/usr/bin/perl -w

# GetCode - Developed by Arsh Leak.
# $ wget https://github.com/4rsh/

use strict;
use warnings;
use WWW::Mechanize;
use Data::Dumper;
use Term::ANSIColor qw(:constants);

system("clear");
print RED BOLD"\n\n";
print "  .oooooo.                  .        .oooooo.                   .o8            \n";
print " d8P'  `Y8b               .o8       d8P'  `Y8b                  888            \n";
print "888            .ooooo.  .o888oo    888           .ooooo.   .oooo888   .ooooo.  \n";
print "888           d88' `88b   888      888          d88' `88b d88' `888  d88' `88b \n";
print "888     ooooo 888ooo888   888      888          888   888 888   888  888ooo888 \n";
print "`88.    .88'  888    .o   888 .    `88b    ooo  888   888 888   888  888    .o \n";
print " `Y8bood8P'   `Y8bod8P'    8888     `Y8bood8P'  `Y8bod8P' `Y8bod88P  `Y8bod8P' \n\n";
print "                           Coded by Arsh Leak \n\n";

print WHITE BOLD "Insira um Link com HTTP://. ";
print BLUE "(e.g: http://www.facebook)\n";
print WHITE BOLD"> ";
my $url = <STDIN>;
my $mech = WWW::Mechanize->new();
$mech->get($url);

print GREEN BOLD + Dumper($mech->content());
