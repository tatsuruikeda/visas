## r-base image for visualizing _in-silico_ algorithm scores for SNVs ##  
 <br /> 

# 使用法 #

コンテナの作成

```
$ docker run --name visas -it --rm buildandshipany/visas /bin/bash
```
デタッチ後 (キーボードでCtrl-p押した後Ctrl-q押す)， FoundationOneCDx xml ファイルを含むディレクトリをコンテナにコピーする
```
(Mac)
$ docker cp /Users/<ユーザ名>/<ディレクトリへのパス> visas:/

(Windows)
$ docker cp C:¥Users¥<ユーザ名>¥<ディレクトリへのパス> visas:/
```

コンテナの接続

```
# docker exec -it visas /bin/bash
```

カレントディレクトリをコピーしたディレクトリ（dataとする）に変更

``` 
# cd data
 ```


以下のコマンドラインによって各アルゴリズムスコアに対応するカラーサークルとcsvファイルが得られる．全てのデータは新しく作成された「figs」に格納される．ラン終了まで数分かかる可能性がある．

```
# get_labels.sh | get_variants.sh > seq.txt
# get_circles.r seq.txt out
```

必要に応じて，画像を一括トリミングできる．

```
# trimming_png.sh
```
デタッチ後 (Ctrl-p，Ctrl-q)，データディレクトリを ローカルにコピーする（パスはMacの例）．コンテナに残ったディレクトリを削除する．
```
$ docker cp visas:/data /Users/<ユーザ名>/Documents
$ rm -R data
```


## カラーサークルにおける各アルゴリズムの並び方 ##


最上段

 clinpred/	 bayesdel/ 	 revel/	 mutpred/	 mvp/	 m-cap/	 eigen-pc/	 metasvm/	 metalr/	 dann/	 genocanyon		

 中段

 primateai/	 phylo_p100way/	 list-s2/	 gerp/ siphy_29way/	 phastcons_100way/	 phastcons_30way/	 phastcons_17way/	 phylo_p30way/	 phylo_p17way/	 metarnn

 最下段	

vest4/	 provean/	 deogen2/	 sift4g/	 sift/	 fathmm-xf/	 polyphen2/	 mutationassessor/	 mutationtaster/	 lrt/	 mpc/	 fathmm-mkl/	 fathmm

# Reference #

https://bioconductor.org/packages/myvariant/


