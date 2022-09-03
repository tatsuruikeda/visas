## r-base image for visualizing _in-silico_ algorithm scores for SNVs ##  
 <br /> 

Copy the directory containing xml files (e.g., data) to the container.

```
$ docker cp /Users/xxxxx/data variant:/
```


Make this directory the current directory.

``` 
$ cd data
 ```

To Execute command-lines allows you to obtain color circle png files and out.csv containing scores. All data are stored in the newly-formed "figs" directory.


```
$ get_labels.sh | get_variants.sh > seq.txt
$ get_circles.r seq.txt out
```


