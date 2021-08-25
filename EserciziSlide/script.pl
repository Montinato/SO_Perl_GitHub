#!/usr/bin/perl

#   DEVO COMPLETARE SOLO QUESTO -> PRENDERE DA LINEA DI COMANDO IL NOME DEI FILE 
$nomeFile1 = @ARGV[0];
$nomeFile2 = @ARGV[1];

# APRO IL FILE file1.txt in lettura
open($file, "<", "File1.txt") or die "Can’t open < File2.txt: $!";

# Creo un array per salvarmi il contenuto del file 
@righe = ();

while( $line = <$file>)
{
    push(@righe,$line);
}

close $file;

# APRO IL FILE file2.txt in lettura
open($file, "<", "File2.txt") or die "Can’t open < File2.txt: $!";

# Creo un array per salvarmi il contenuto del file 
@righe1 = ();

while( $line = <$file>)
{
    push(@righe1,$line);
}
close $file;


# APRO IL FILE merge.txt in Scrittura

open($new, ">", "merge.txt") or die "Can’t open > output.txt: $!";

$dimensioneRighe = @righe;

# Scorro il primo array e aggiungo ogni riga al file merge.txt
for ($i=0;$i<$dimensioneRighe;$i++)
{
    print $new "$righe[$i]";
}

$dimensioneRighe1 = @righe1;


# Scorro il secondo array e aggiungo ogni riga al file merge.txt
for ($i=0;$i<$dimensioneRighe1;$i++)
{
    print $new "$righe1[$i]";
}

close $new;