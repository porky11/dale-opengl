#!/usr/bin/perl -w

while( my $line = <>)  {
    my ($exp, $name, $value) = split(' ', $line);
    
    if(defined($value) and $value and $exp eq '#define') {
      print "(def " . $name . " (var extern uint " . $value . "))\n";
    }
}

