#!/usr/bin/perl 

$stringa1 = <STDIN>;

$stringa2 = <STDIN>;

$ris = $stringa1 . $stringa2;

$dimensione = length($ris)-1;
print $dimensione."\n";

$sottostringa = substr($ris,5,2);
print("Il valore della sottostringa e': ");
print($sottostringa);
print("\n");

$lettera = "a";
$cont = 0;

my @spl = split($lettera, $ris);

foreach my $i (@spl)  
{ 
    #print $i."\n"; 
    $cont++;
} 

print $cont-1;
print("\n");

$complemento = reverse $ris;

print ($complemento);
