#! /usr/local/bin/perl

# NEED INPUT INFO
die "\n\nusage: $0 <Prot.fas>\n\n" unless $#ARGV == 0;

my $ProtFile = shift;

###### Store the sequence info into hash
my %Sequences = ();
open (P, $ProtFile) or die "can't open $ProtFile\n";
while (<P>) {
    chomp;

    if (/>(.+)/) {
        $SeqName = $1;
    }

    else {
        $Sequences{$SeqName} .= $_;
    }
}
close P;

foreach $key (sort keys %Sequences){
	my $Seqlen = length ($Sequences{$key});
	my @Seq = split(//,$Sequences{$key});
	for (my $i; $i<= scalar @Seq; $i++){
		if ($Seq[$i] eq "*"){
		print $key,"\t",$Seqlen,"\t",$i,"\n";		
		}else{next;}
	}
}

