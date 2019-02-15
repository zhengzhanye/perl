#!/bin/bash
cfg=${1?missing configure file}
exec 0<$cfg
dir="/g/zhanye/project/WuXD/190116_A1A2KO_119_chip/test/"
while read id;
do 
python /g/zhanye/TF_chipseq_pipeline/chipseq.py  $dir/$id
done
