$ARGV[0] || die "ARGV[0] non presente";
$ARGV[1] || die "ARGV[1] non presente";
$ARGV[2] || die "ARGV[2] non presente";
$ARGV[3] || die "ARGV[3] non presente";

$nomeFile = $ARGV[0];
$IP = $ARGV[1];
$protocollo = $ARGV[2];
$orario = $ARGV[3];


# print "IP = ".$IP."\n";
# print "PROTOCOLLO = ".$protocollo."\n";
# print "ORARIO = ".$orario."\n";

# LEGGERE IL TESTO DI UN FILE 

$file = 'dump.log';
open(TESTO, $file);
@righe = <TESTO>;
close(TESTO);
#print @righe;

for my $element (@righe)
{
    $x = $x . $element;
}

print $x;


@output = ();

while($x =~ /((\d{1,2}):\d{1,2}:\d{1,2}.\d+\sIP\s(\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}).(\d{1,5})\s>\s\d+.\d+.\d+.\d+.\d+:\s(\w{1,3}))/gm)
{
    # print("ENTRO NELL'IF\n");
    # print("\n");
    # print "\n"."ORARIO REGEX = ".$2;
    # print "\n"."IP REGEX = ".$3;
    # print "\n"."PORTA REGEX = ".$4;
    # print "\n"."PROTOCOLLO REGEX = ".$5;
    # print("\n");

    # print("\n Provo a stampare tutta la riga :");
    # print $1;
    # print("\n");

    if($2 == $orario and $3 == $IP  and $protocollo == $5 ) 
    {
       #print("L'orario e' uguale\n");
       $frase = $frase.$1."\n";
       
       push(@output,$frase);
    }

}

$file = 'dump.log';     # SE IL FILE NON ESISTE LO CREA
open(TESTO, "> $file");
print TESTO "\n PROGRAMMA TERMINA \n";
@righe = <TESTO>;
close(TESTO);
print @righe;




print @output;