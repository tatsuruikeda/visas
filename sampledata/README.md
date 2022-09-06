## r-base image for visualizing _in-silico_ algorithm scores for SNVs ##  
 <br /> 

# Usage #

Create a Docker container

```
$ docker run --name visas -it --rm buildandshipany/visas /bin/bash
```
Detach (Ctrl-p and Ctrl-q) and copy the directory containing FoundationOneCDx xml files to the container

```
$ docker cp /Users/<path to a data dir> visas:/
```

Run the container

```
# docker exec -it visas /bin/bash
```

Change the current directory.

``` 
# cd data
 ```

To Execute command-lines allows you to obtain color circle png files and a out.csv file containing scores. All data are stored in the newly-formed "figs" directory.


```
# get_labels.sh | get_variants.sh > seq.txt
# get_circles.r seq.txt out
```

If you like to trimm figures, you can run this line

```
# trimming_png.sh
```
Detach (Ctrl-p and Ctrl-q) and copy the data directory to your local area and remove recursively the directory

```
$ docker cp visas:/data /Users/<path to a dir>
$ rm -R data
```

# Reference #

https://bioconductor.org/packages/myvariant/


