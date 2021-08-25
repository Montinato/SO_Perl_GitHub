#!/usr/bin/perl 

%rubrica = ();

$rubrica{FrancescoManganaro} = "3277159476";


$rubrica{UmbertoManganaro} = "5345837284732";


$rubrica{MeloSingh} = "54935839534";

$rubrica{CiccioDevoli} = "56854796854";


$rubrica{JessicaSiviglia} = "31232131332";


$rubrica{MicaRomeo} = "4763524423434";


$rubrica{MarcoRamingo} = "483247324984238";

while (my ($nome, $numero) = each %rubrica)
{
    print "NomeContatto = $nome / Numero = $numero \n";
}