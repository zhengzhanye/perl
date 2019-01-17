#!/usr/bin/perl
use warnings;
use strict;
use utf8;


my $fi = "data/E14119_clean_R1.fastq.gz";
open(my $I,"gunzip -c $fi|") or die ("can not open $fi\n");  #gunzip -c == gzip -dc (-d uncompress)
my $fo = "data/E14119_celan_len50_R1.fastq.gz";
open my $O ,"|gzip >$fo" or die $!;
select $O;

while(<$I>) {
    chomp;
    if ($.%2 == 0) {  #($.-2)%4 == 0 只处理第二行，即序列信息
        print substr($_,0,50)."\n";
    }
    else{
        print "$_\n";
    }
}
## usage:substr($string,offset,length) 
## offset代表启示字符串的位置，length代表引用的字符串的长度，
## 如果省略length则代表从起始值到字符串的最后一个字符的长度，而offset是负值的话，就从字符串右边开始指定的字符