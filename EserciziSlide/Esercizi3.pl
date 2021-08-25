#!/usr/bin/perl

# NON FUNZIONA QUESTO   ---->      %arrayAssociativo = { "A" => 1, "B" => 2 };


print "$arrayAssociativo{A}\n";

$arrayAssociativo{A} = 1;
$arrayAssociativo{B} = 2;
$arrayAssociativo{C} = 3;
$arrayAssociativo{D} = 4;
$arrayAssociativo{E} = 5;
$arrayAssociativo{F} = 6;


print "Esiste la chiave C\n" if exists $arrayAssociativo{C};

print "Stampo i valori dell'array associativo!\n";

for my $value (values %arrayAssociativo)
{
    print "$value\n";
}

@chiavi = ();

for my $k (keys %arrayAssociativo)
{
    push(@chiavi,$k);
}

print "@chiavi\n";

$size = keys %arrayAssociativo;
print "La dimensione dell'arrayAssociativo e': " .  $size . "\n"; 

delete($associativo{A});
delete($associativo{B});

