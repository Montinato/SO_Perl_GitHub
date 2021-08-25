#!/usr/bin/perl

# SCRIVO COMUNQUE IL COMANDO SHELL CHE AVREI DOVUTO USARE, ANCHE SE NON MI FUNZIONA. 

# @output = qx("ps -elf");    ->    In questo modo salvo in un array il contenuto del comando qx
# print @output;

# SVOLGO L'ESERCIZIO USANDO I FILE DI TESTO ALL'INTERNO DELLA CARTELLA 

open($file , "<" , "processExample.log") or die "Non riesco a trovare il file $!";

@output = ();

while( $line = <$file>)
{
    push(@output,$line);
}

# print("Stampo output: \n");
# print @output;
# print("Fine stampa output \n");

$text = "";

$sizeOutput = @output;

for ($i=0;$i<$sizeOutput;$i++)
{   
    #print("$output[$i]\n");
    $text = $text . $output[$i];

}

# print("Stampo text: \n");
# print($text);
# print("Fine stampa! \n");

# REGEX per processExample.pl -> (\d+)\s(\w+)\s(\w+\W*)\s+(\d+)(\N+)

# print("INIZIO STAMPA!\n");
# print("\n");
# if( $text =~ /Chrome/i)
# {
#     print($text);
# }
# print("\n");
# print("FINE STAMPA!");

#print("Inizio stampa Output\n");

# $occorrenze = 0;
@PID = ();

for ($i=0;$i<$sizeOutput;$i++)
{   
    if($output[$i] =~ /Chrome/i)
    {
        # print $output[$i];
        # print("\n");
        # $occorrenze+=1;

        if($output[$i] =~ /(\d+)\s(\w+)\s(\w+\W*)\s+(\d+)(\N+)/)
        {
            push(@PID,$4);
            #print("Aggiungo!\n");
        }
    }
}

print "@PID\n";

# Aprire in sola lettura il file /proc/PID/status, dove al posto di PID va inserito il valore corrente della quarta colonna
# open($nuovo, "<<" , "/proc/PID/status") or die "Non riesco ad aprire il File!";

open($nuovo,"<","statusExample.log") or die "Non riesco ad aprire il file";

@status = ();
@ram = ();

$cont = 0;

$sizePID = @PID;

while($line = <$nuovo>) 
{
    #$cont += 1;
    push(@status,$line);
    #print("CONT = $cont\n");
}

$sizeStatus = @status;    


# La seconda parte non posso completarla perche' devo richiamare sempre un file a cui assegno un PID diverso
# ad ogni PID e' associato un valore per il consumo della RAM che devo sommare e alla fine restituire.


        
close $file;