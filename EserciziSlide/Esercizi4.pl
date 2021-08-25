#!/usr/bin/perl 

%associativo = ();

$associativo{A} = 1;
$associativo{B} = 45;
$associativo{C} = 5;

# Ordinare in maniera crescente i valori dell’array associativo utilizzando l’operatore compare per il contesto numeric.

print("Compare contesto numeric :\n");
foreach $x (sort { $associativo{$a} <=> $associativo{$b} } values %associativo)
{
    print "$x\n";
}


# Ordinare in maniera crescente i valori dell’array associativo utilizzando l’operatore compare per il contesto string.

print("Compare contesto string :\n");
foreach $x (sort { $associativo{$a} cmp $associativo{$b} } values %associativo)
{
    print "$x\n";
}

$associativo{D} = 45;
$associativo{E} = 10;
$associativo{F} = 1;

foreach $x (sort { $associativo{$a} <=> $associativo{$b} } values %associativo)
{
    print "$x\n";
}

# Ordinare e stampare prima in ordine crescente i valori contenuti nell’array associativo e a parità di valore ordinare
# lessicograficamente sulle chiavi

print("Stampo in ordine crescente i valori contenuti nell'array associativo \n");

foreach $associativo(sort{$associativo{$a} <=> $associativo{$b}} values %associativo)
{
    print "$associativo\n";
}

foreach $associativo(sort{$a cmp $b} keys %associativo)
{
    print "$associativo\n";
}

