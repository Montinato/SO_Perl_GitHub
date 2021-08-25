#! /usr/bin/perl

# Lettura Parametri


$ARGV[0] || die "ARGV[0] non presente\n";    
$ARGV[1] || die "ARGV[1] non presente\n";

$email = $ARGV[1];

open(LOG,$ARGV[0]) || die "Problema con il file $ARGV[0]\n";

# Elaborazione

# OBIETTIVO : 
#   $IP -> conteggio delle visite
#   $RISORSA -> conteggio accessi
#   $IP -> $nomeDNS

#   %visiteDI => $ip -> conteggio
#   %visitedirisorse => $url -> conteggio
#   %nomeDi => $ip -> FQDN -> $IP


while( $linea = <LOG>)
{
    # Estrai $ip, $url, $nome da $linea

    if($linea =~ /(\d+\.\d+\.\d+.\d+).*\[(.*?)\].*?\"GET (.*?) HTTP/)
    {
        ($ip,$data,$url) = ($1,$2,$3);
        $visiteDi{$ip}++;                      # Chiave IP -> conteggio ++ 
        $visiteDiRisore{$url}++;               # Chiave -> url -> conteggio ++
        #$output = qx{host $ip}
        #$output =~ /.* (.*)\./;
        $nomeDi{$ip} = $ip;
    }
    
}

# Output e invio email
open(MESSAGGIO, "| $email -s [ Rapporto accessi WWW ]");

foreach $visitatore ( {keys %visiteDi})
{
    print MESSAGGIO "$visiteDi{$visitatore} = $visitatore = $nomeDi($visitatore}\n";
    print "$visiteDi{$visitatore} = $visitatore = $nomeDi($visitatore}\n";
}
close(MESSAGGIO);


foreach $visitatore({%visiteDi})
{
    print $visiteDi{$visitatore} + "\n";
}