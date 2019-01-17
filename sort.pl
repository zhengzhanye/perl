my @sorted_numbers = sort { $a <=> $b } @numbers; ##将数组按照数字排序
my @sorted_words = sort { lc($a) cmp lc($b) } @words  ##忽略字符串的大小，按照字母排序