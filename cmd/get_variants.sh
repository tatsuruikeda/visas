#! /bin/sh

sed '
/missense/!d
s/&gt;/>/
# lmited to SNV
/>.\"/!d
/strand="-"/{
s/[0-9]*G>A\"/Cytosine>Thymine\"/
s/[0-9]*G>T\"/Cytosine>Adenine\"/
s/[0-9]*G>C\"/Cytosine>Guanine\"/
s/[0-9]*C>A\"/Guanine>Thymine\"/
s/[0-9]*C>T\"/Guanine>Adenine\"/
s/[0-9]*C>G\"/Guanine>Cytosine\"/
s/[0-9]*A>T\"/Thymine>Adenine\"/
s/[0-9]*A>C\"/Thymine>Guanine\"/
s/[0-9]*A>G\"/Thymine>Cytosine\"/
s/[0-9]*T>A\"/Adenine>Thymine\"/
s/[0-9]*T>C\"/Adenine>Guanine\"/
s/[0-9]*T>G\"/Adenine>Cytosine\"/
}' $* |

sed '
s/Adenine/A/
s/Guanine/G/
s/Thymine/T/
s/Cytosine/C/' |

sed 's/\"chr\(.*\):\([0-9]*\)\"/\"chr\1:g.\2\"/ ' |

awk '{ print $9 $3 $7 $10 $13}' | 

sed 's/position=\(\"chr.*:g.[0-9]*\)\"cds-effect=\".*\(.>.\"\)gene=\"\(.*\)\"protein-effect=\"\(.*\)\"transcript=\(.*\).xml/\1\2\ \3\_\4\ \5/
'
