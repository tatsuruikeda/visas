## r-base image with myvariant for visualizing _in-silico_ algorithm scores for SNVs ##  
 <br /> 

### * README_JPN.md is stored in the sampledata directory ###


# Usage #


To Execute the command in the directory containing the xml files allows you to obtain color circle png files and a out.csv file. It may take a few minutes to run. All data are stored in the newly-formed "figs" directory.

```
# get_labels.sh | get_variants.sh > seq.txt
# get_circles.r seq.txt out 2>/dev/null
```

If you like to trimm figures, you can run this line

```
# trimming_png.sh
```


# Color circles # 

### Upper row (from left to right) ###

 clinpred/	 bayesdel/ 	 revel/	 mutpred/	 mvp/	 m-cap/	 eigen-pc/	 metasvm/	 metalr/	 dann/	 genocanyon		

### Middle row (from left to right) ###

 primateai/	 phylo_p100way/	 list-s2/	 gerp/ siphy_29way/	 phastcons_100way/	 phastcons_30way/	 phastcons_17way/	 phylo_p30way/	 phylo_p17way/	 metarnn

### Lower row (from left to right)	 ###

vest4/	 provean/	 deogen2/	 sift4g/	 sift/	 fathmm-xf/	 polyphen2/	 mutationassessor/	 mutationtaster/	 lrt/	 mpc/	 fathmm-mkl/	 fathmm


# Reference #

https://bioconductor.org/packages/myvariant/


