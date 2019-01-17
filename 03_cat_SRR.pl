#!/usr/bin/perl

use warnings;
use strict;
use utf8;
use File::Basename;


my $dir = "../data";

my $fi = "./GSM_to_SRR.txt";
open my $I , '<' , $fi or die "$0 : failed to open input file '$fi' :$!\n";
 my %hash;

while (<$I>) {
    chomp;
    my @f = split/\s+/;
    my $cell = $f[0];
    my $srr = $f[2];
    push @{$hash{$cell}} , $srr;
}

foreach my $cell (sort keys %hash) {
    my @srrs =  @{$hash{$cell}};
    my @srr1 = map {$_."_1.fastq.gz"} @srrs;
    my @srr2 = map {$_."_2.fastq.gz"} @srrs;
    my $cmd1 = "zcat @srr1 | gzip > GM12878_1.fastq.gz";
    my $cmd2 = "zcat @srr2 | gzip > GM12878_2.fastq.gz";
    print "$cmd1\n";
    print "$cmd2\n";
}