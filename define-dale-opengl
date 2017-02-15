#!/usr/bin/perl -w



while( my $line = <STDIN>)  {
    my ($exp, $name, $value) = split(' ', $line);
    if(defined($value) and $value and $exp eq '#define') {
      if(index($name,$ARGV[0])==0) {
       
       my ($_,$newname) = split($ARGV[0], $name);
       $newname =~ tr/_/-/;
       $newname =~ tr/A-Za-z/a-zA-Z/;
       if($newname=~ /^\d/) {
         $newname=':' . $newname;
       }
       print "(def " . $newname . " (var extern (const uint) " . $value . "))\n";
      }
    }
}

