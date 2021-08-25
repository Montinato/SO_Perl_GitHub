#!/usr/bin/perl

$ARGV[0] || die "ARGV[0] non presente\n";

$path = $ARGV[0]; 

# Dovrei farlo usando la bash così: 
#$output = qx("tail -f $path");
#print($output);


open($file , "<" , "auth.log");

# while($line = <$file>)
# {
#     push(@array,$line);
#     chomp $line;
# }

# $sizeArray = @array;

# for($i=0;$i<$sizeArray;$i++)
# {
#     $testoFile = $testoFile . $array[$i];
# }

#print("Stampo il contenuto del file! \n");
#print("$testoFile \n");

@utenti = ();
%numeroTentativi = ();
%ip = ();
%porta = ();

while($line = <$file>)
{
    if( $line =~ /invalid\suser\s(\w+)\sfrom\s(\d+.\d+.\d+.\d+)\sport\s(\d+)/ )
    {
        push(@utenti,$1);
        $ip{$1} = $2;
        $porta{$1} = $3;
    }

}

close $file;

open($file , "<" , "auth.log");

$tentativi = 0;
while($line = <$file>)
{
    if( $line =~ /invalid\suser\s(\w+)\sfrom\s(\d+.\d+.\d+.\d+)\sport\s(\d+)/ )
    {
        
        
        $numeroTentativi{$1} = $tentativi+1;
        
    }
}

# print("\n");
# print("STAMPA DI ip: \n");
# while (my ($user, $ip) = each %ip)
# {
#     print "$user -> $ip\n";
# }


# print("\n");
# print("STAMPA DI porta: \n");
# while (my ($user, $p) = each %porta)
# {
#     print "$user -> $p\n";
# }


# print("\n");
# print("STAMPA DI numeroTentativi: \n");
# while (my ($user, $n) = each %numeroTentativi)
# {
#     print "$user -> $n\n";
# }

open($new, ">", "FILE.txt") or die "Can’t open > FILE.txt: $!";

$dimensioneUtenti = @utenti;

foreach $utente (sort { $numeroTentativi{$a} <=> $numeroTentativi{$b} || ($a cmp $b)  } keys %numeroTentativi)
{
    print $new "$utente ha effettuato $numeroTentativi{$utente} tentativi di accesso. \n";
    print $new "$ip{$utente}:$porta{$utente}\n";
}

# for( $k=0;$k<$dimensioneUtenti;$k++)
# {
#     print ("Utente : $utenti[$k] -> $ip{$utenti[$k]} : $porta{$utenti[$k]}\n")
# }


close $file;