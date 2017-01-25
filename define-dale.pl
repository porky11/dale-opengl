#!/usr/bin/perl -w



while( my $line = <STDIN>)  {
    my ($exp, $name, $value) = split(' ', $line);
    if(defined($value) and $value and $exp eq '#define') {
      if(index($name,$ARGV[0])==0) {
       print "(def " . $name . " (var extern (const uint) " . $value . "))\n";
      }
    }
}

