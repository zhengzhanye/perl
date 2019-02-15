#!/usr/bin/perl
use warnings;
use utf8;
use strict;
use File::Basename;


#ENCODE
my $script = "test";
my $tdir = "/g/zhanye/project/WuXD/190116_A1A2KO_119_chip/trimdata/E14119";
my $idir = "/g/zhanye/project/WuXD/181226_Li_chip/cleandata/E14input/trim_cutadapt";
my $dio = "/g/zhanye/project/WuXD/190116_A1A2KO_119_chip/result";


my $fi = "$script/file.txt";   ## ENCODE 整理的fastq的名字，ENCFF002CEK.fastq_1.gz , 只保留 ENCFF002CEK 
open my $I , '<' ,$fi or die "$0 : failed to open input file '$fi' :$!\n";



#my %fname ;
while (<$I>){
    chomp;
    my @f = split/\t/;
    my $name= $f[0];
    $name =~ s/_R1.fq.gz//;
   # print "$name\n";
    my $type = "\"type\" : \"TF\",";
    my $spe = "\"species\" : \"hg19\",";
    my $nth = "\"nth\" : 20,";
    my $pe = "\"pe\" : true,";
    my $f1 = "\"$tdir/${name}_R1_val_1.fastq.gz\",";
    my $f2 = "\"$tdir/${name}_R2_val_2.fastq.gz\",";
    my $fq1 = "\"fastq1_1\" : $f1";
    my $fq2 = "\"fastq1_2\" : $f2";
    my $in1 = "\"$idir/${name}_input_1.fastq.gz\",";
    my $in2 = "\"$idir/${name}_input_2.fastq.gz\",";
    my $ctl1 = "\"ctl_fastq1_1\" : $in1";
    my $ctl2 = "\"ctl_fastq1_2\" : $in2";
    my $dion = "$dio/$name";
    mkdir $dion unless -d $dion;
    my $out = "\"out_dir\" : \"$dion\"" ;

    my $fo = "$script/${name}.cfg";
    open my $O , '>' , $fo or die "$0 : failed to open input file '$fi' :$!\n";
    select $O;
    print $O "\{\n$type\n$spe\n$nth\n$pe\n$fq1\n$fq2\n$ctl1\n$ctl2\n$out\n\}"
}

