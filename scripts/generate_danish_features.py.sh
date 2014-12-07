#!/bin/bash


for matrix in bioprefix wholetags nopos supersense
do
    for file in test.bente test.all test.folketing test.mangamania test.politiken test.selvhenter test.seoghoer train.politiken
    do
        for mode in iw cs
        do

        if [ $mode = "cs" ]
        then
        separator="--separator :"
        fi
            outfile=$file.$matrix.$mode.feats
            python ../source/generate_features.py ../data/gold/gold.$file.tsv --confusionmatrix ../data/cm/politiken5-6.bioprefix.tsv --weightmode $mode --embeddings ../data/res/da.clarindk.embd $separator > $outfile
        done
    done
done

matrix=baseline
for file in test.bente test.all test.folketing test.mangamania test.politiken test.selvhenter test.seoghoer train.politiken
do
    for mode in iw cs
    do

    if [ $mode = "cs" ]
    then
    separator="--separator :"
    fi
        outfile=$file.$matrix.$mode.feats
        python ../source/generate_features.py ../data/gold/gold.$file.tsv --weightmode $mode --embeddings ../data/res/da.clarindk.embd $separator > $outfile
    done
done
