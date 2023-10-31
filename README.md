### The script was upgraded on October 30, 2023. Please use this one ###

## r-base image for visualizing _in-silico_ algorithm scores for SNVs ##  

### 使用法 ###


### コンテナの作成 ###
xmldataディレクトリ内に変異情報を含むxmlファイルがあるとする．
コンテナ作成と同時にホストのディレクトリをコンテナのディレクトリにマウントする．xmldataの内容がmntを通じて共有できる

ホストのディレクトリのパス例

- Mac     /Users/YourUsername/xmldata

- Windows C:\Users\YourUsername\xmldata

```
(Mac)
$ docker run --name visas -it -v /Users/YourUsername/xmldata:/mnt buildandshipany/visas bash

(Windows)
$ docker run --name visas -it -v /mnt/c/Users/YourUsername/xmldata:/mnt buildandshipany/visas bash
```
---
### 実行 ### 

カレントディレクトリをxmlデータのあるディレクトリ（上の例ではmnt）に変更する．また，sampledataディレクトリでも試行できる．

``` 
# cd mnt
```

以下のコマンドラインによって各アルゴリズムスコアに対応するカラーサークルとcsvファイルが得られる．mnt内に新しいディレクトリ「figs」が作成され，全てのデータはそこに格納される．

```
get_circles.sh 
```

使用済みのコンテナを破棄する

```
docker stop visas
docker rm visas
```
---

### カラーサークルにおける各アルゴリズムの並び方 ###

上段から下段へ，左から右へ，精度の高い順（AUC順）に並んでいる．左上のclinpredのAUCが最も高い（1）．

上段

 clinpred/	 metarnn/ 	 bayesdel/	 vest4/	 revel/	 mutpred/	 mvp/	 deogen2/	 provean/	 eigen_pc/	 sift4		

中段

 primateai/	 fathmm_xf/	 metasvm/	 mutationassessor/ polyphen2/	 metalr/	 m_cap/	 mpc/	 sift/	 mutationtaster/ phylo_p100way/	 list_s2

下段	

lrt/    fathmm_mkl/	 dann/	 siphy_29way/	 gerp/	 phastcons_100way/	 fathmm/	 genocahyon/	 phastcons_30way/	 phylo30way/	 phastcons_p17way/	 phylo17way

---
### References ###
1　池田　健　包括的がんゲノムプロファイリング検査で得られる遺伝子変異情報の可視化　第56回北海道病理談話会　令和5年9月16日


### 使用したRパッケージのライセンス ###

1 ggplot2 パッケージ

著作権者: Hadley Wickham

ライセンス: MIT + file LICENSE

ライセンス詳細: https://github.com/tidyverse/ggplot2

2 myvariant パッケージ

著作権者: Adam Mark

ライセンス: Artistic-2.0

ライセンス詳細: https://bioconductor.org/packages/release/bioc/html/myvariant.html

