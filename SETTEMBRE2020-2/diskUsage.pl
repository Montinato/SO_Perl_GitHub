#!/usr/bin/perl

$ARGV[0] || die "Primo parametro non inserito";
$ARGV[1] || die "Secondo parametro non inserito";

$formati = $ARGV[0];
$path = $ARGV[1];

$value = qx(du -ka);
#print $value;
@array = qx(du -ka);

#print "STAMPO L'ARRAY: \n";
print @array;

if($formati =~ /--filter=(\w+),*(\w*),*(\w*)/)
{
    #print "CONTROLLO FORMATI OK \n";
    push(@formati,$1);
    push(@formati,$2);
    push(@formati,$3);   
}
else
{
    print "ERRORE FORMATO FILE \n";
}

print "Stampo i formati \n";
print @formati;
print("\n");

%spazioPerFormato = ();

$sizeArray = @array;

for (my $i = 0; $i <= $sizeArray; $i += 2)
{
    if($array[$i] =~/(\d{1,4})\s+.\/\SettembreTest\/(\w+\-*\w*\-*\w*\-*\w*\-*\w*).(\w+)/)
    {
        $spazioPerFormato{$3} += $1;
    }

    #$k = shift @array;
}

print("Stampa di spazioPerFormato : \n");
while ( ($formato,$dimensione) = each %spazioPerFormato)
{
    print $formato;
    print("\n");
    print $dimensione;
    print("\n");
}




