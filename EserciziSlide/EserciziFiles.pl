#!/usr/bin/perl

open($file, "<", "passwd.txt") or die "Can’t open < passwd.txt: $!";

#$contoRiga = 0;

# while($line = <$file>)
# {
#     #print("Stampo line: $line\n");

#     if($contoRiga%2==0)
#     {
#         print($contoRiga);
#         print("\n");
#         print($line);
#     }

#     push(@output,$line);

#     $contoRiga+=1;
#     chomp $line;
# }

#print("PRINT OUTPUT\n");
#print(@output);
#print("\n");

open($new, ">", "ouput.txt") or die "Can’t open > output.txt: $!";

while($line = <$file>)
{
    #print ("Stampo la riga: $line \n");

    if($line =~ '(root)(:\w+:\d+:\d+:\w+:\/\w+:\/\w+\/\w+)')
    {
        print("REGEX CHECK -> " . $1.$2 ."\n");
        #print($1.$2);
        print("\n");
    }

}
    


close $file;

