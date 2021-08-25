#!/usr/bin/perl 

print "Hello World";


my $variabile_scalare = "CIAO";

my @array = (01,01,1999);

my %arrayAssociativo = ( 1 => "Francesco", 2 => "Umberto");


print("\n");
print "Inserisci due numeri \n";
$primo = <STDIN>;
$secondo = <STDIN>;


print("Somma = ");
print($primo + $secondo);
print("\n");

print("Differenza = ");
print($primo - $secondo);
print("\n");

print("Prodotto = " . $primo * $secondo);
print("\n");

print("Quoziente = " . $primo / $secondo);
print("\n");

@arrayNUOVO = ();

$input = <STDIN>;

while($input != -1)
{
    push @arrayNUOVO,($input);

    $input = <STDIN>;
}

for my $elem (@arrayNUOVO)
{
    $somma += $elem;
}

print $somma;
