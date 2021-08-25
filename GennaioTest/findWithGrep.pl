
$ARGV[0] || die "ARGV[0] non presente\n";
$ARGV[1] || die "ARGV[1] non presente\n";
#$ARGV[2] || die "ARGV[2] non presente\n";



#$path = $ARGV[0];
$numero = $ARGV[1];
$stringa = $ARGV[2];


$output = qx(ls -R | grep [.]);             # -R | grep [estensione] -> ricerca ricorsivamente
#print $output;


if($output =~ /(doc)(w*.\w+.\w+)\s+/ )
{
    #print ( " PORCO DIO ");
    $documento = $1.$2;
    $files{$documento} = 6;
}

# ORDINE RICHIESTO DALLA TRACCIA 
# "In ordine decrescente di size e a parità di dimensione in ordine lessicografico . "

foreach $file (sort { $files{$a} <=> $files{$b} || ($a cmp $b)} keys %files)
{
    print "$file - $files{$file}.\n";
}

for $dimensione ( values %files)
{
    $somma += $dimensione;
}

print ("STAMPA DI SOMMA = ".$somma);
print("\n");

# SCRIVERE SU UN FILE 

$file = 'results.out';     # SE IL FILE NON ESISTE LO CREA
open(TESTO, "> $file");
print TESTO %files;
@righe = <TESTO>;


print TESTO "\n----------\n";
@righe = <TESTO>;

print TESTO "Spazio totale occupato: $somma \n";
@righe = <TESTO>;

close(TESTO);
print @righe;



# STAMPA DI PROVA ARRAY ASSOCIATIVO 
while (my ($doc, $dim) = each %files)
{
    print "$doc <---->  $dim\n";
}





