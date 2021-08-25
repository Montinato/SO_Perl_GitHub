# SCRIVERE SU UN FILE 

$file = 'SCRIVO.txt';     # SE IL FILE NON ESISTE LO CREA
open(TESTO, "> $file");
print TESTO "TESTOTESTOTESTOTESTO";
@righe = <TESTO>;
close(TESTO);
print @righe;



# LEGGERE DA UN FILE 
$file = 'LEGGO.log';
open(TESTO, "< $file");
@righe = <TESTO>;
close(TESTO);
print @righe;


# ARGOMENTI
$ARGV[0] || die "ARGV[0] non presente\n";
$ARGV[1] || die "ARGV[1] non presente\n";
$ARGV[2] || die "ARGV[2] non presente\n";


$path = $ARGV[0];
$numero = $ARGV[1];
$stringa = $ARGV[2];

# COMANDO SHELL

$output = qx(ls -R | grep [.]);             # -R | grep [estensione] -> ricerca ricorsivamente
print $output;
