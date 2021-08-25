#!/usr/bin/perl

$ARGV[0] || die "Primo elemento non inserito";
$ARGV[1] || die "Secondo elemento non inserito";

$operazione = $ARGV[0];
$utente = $ARGV[1];

if( $operazione =~ /-c|-m/ )
{
    #print("Controllo 1 OK! \n");
}
else
{
    print("ERRORE sul primo argomento! \n");
}

if( $utente =~ (/\w+/) )
{
    #print("Controllo 2 OK! \n"); 
}
else
{
    print("ERRORE sul secondo argomento! \n");
}

# Dovrei farlo da shell ma non funziona 
#$comandoTOP = qx("top -n1 -b");
#print $comandoTOP;

open($handle, "<" , "comandoTop.txt");

@array = ();
$fileTop;

while($line = <$handle>)
{
    push(@array,$line);
}
close $handle;

$dimensioneFile = @array;

for($i=0;$i<$dimensioneFile;$i++)
{
    $fileTop = $fileTop . $array[$i];
}

# print $fileTop;

open($handle1, "<" , "comandoTop.txt");

while($line = <$handle1>)
{
    #print $line;
    if($line =~ /\s+\d+\s(\w+\S*)\D*\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\w+\s+(\d+.\d+)\s+(\d+.\d+)\s+\d+:\d+.\d+\s\w+\N/)
    {
        if ($1 eq $utente)
        {
            if($operazione eq "-c")
            {
                #print("\n");
                $cpu{$1} += $2;
                #print("Utente : $1, valoreCPU $2 \n");
            }
            else
            {
                #print("\n");
                $mem{$1} += $3;
                #print("Utente : $1, memoria $2 \n");
            }
        }
    }
}

# print("\n");

open($scrivo, ">", "FILE.txt") or die "Can’t open > FILE.txt: $!";

if($operazione eq "-c")
{
    $valore = $cpu{$utente};
    print "utente $utente CPU: $valore%\n";
    print $scrivo "utente $utente CPU: $valore%\n";
}
else
{
    $valore = $mem{$utente};
    print "utente $utente MEM: $valore%\n";
    print $scrivo "utente $utente MEM: $valore%\n";
}

close $handle1;

open($handle, "<" , "comandoTop.txt");

%cpu = ();
%mem = ();

while($line = <$handle>)
{
    #print $line;
    if($line =~ /\s+\d+\s(\w+\S*)\D*\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\w+\s+(\d+.\d+)\s+(\d+.\d+)\s+\d+:\d+.\d+\s\w+\N/)
    {
        if($operazione eq "-c")
        {
            #print("\n");
            $cpu{$1} += $2;
            #print("Utente : $1, valoreCPU $2 \n");
        }
        else
        {
            #print("\n");
            $mem{$1} += $3;
            #print("Utente : $1, valoreCPU $2 \n");
        }
    }
}

while( my($chiave,$valore) = each %cpu){
    #print "\n$chiave - $valore \n";
}

$max_utente = 0;
$valore_Max = 0;

if($operazione eq "-c")
{
    while( my($chiave,$valore) = each %cpu)
    {
        if ($valore > $valoreMax)
        {

            $valore_Max = $valore;
            $max_Utente = $chiave;

            
        }
    }
}
else
{
    while( my($chiave,$valore) = each %mem)
    {
        if ($valore > $valoreMax)
        {
            $valore_Max = $valore;
            $max_Utente = $chiave;
        }
    }
}



if($operazione eq "-c")
{
    print("Max uso CPU : ");
    print ("$max_Utente ");
    print ($valore_Max);
    print "% \n";

    print $scrivo("Max uso CPU : ");
    print $scrivo ("$max_Utente ");
    print $scrivo ($valore_Max);
    print $scrivo "% \n";
}
else
{
   print $scrivo("Max uso MEM : ");
   print $scrivo($max_Utente);
   print $scrivo($valore_MAX);
   print $scrivo "% \n";
}


close $scrivo;
close $handle;
        