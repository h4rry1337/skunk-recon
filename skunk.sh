#!/usr/bin/env bash
echo '
	    x            )
           / \        (  ) (
          / X \        )    )
         _______      (  ( (
        ( O   O )        )
 ____oOO___(_)___OOo____(
(_______________________)
          h4rry
      !SKUNKS 4FUN!'
target=$1
subfinder -d $target -silent | alterx -enrich -silent > subfinder.out
assetfinder --subs-only $target >> assetfinder.out 1>/dev/null
findomain -t $target -u findomain.out 1>/dev/null
sort -u subfinder.out assetfinder.out findomain.out >> subs.out
mksub -df subs.out -l 1 -w ~/skunk-recon/wordlist.txt -r "^[a-zA-Z0-9\.-_]+$" -o permutations1.out 1>/dev/null
gotator -sub subs.out -perm ~/skunk-recon/wordlist.txt -depth 1 -numbers 10 -mindup -adv -md > permutations2.out 1>/dev/null
cat permutations1.out permutations2.out | sort -u >> permutations.out
puredns resolve -r resolvers.txt  permutations.out -w subs.out 1>/dev/null
httpx -l subs.out -retries 2 -threads 100 -o httpx.out -silent 1>/dev/null
nuclei -l httpx.out -nh -s info,low,medium,high,critical,unknown -o nuclei-subdomains.out
nuclei -u $target -s info,low,medium,high,critical,unknown -o nuclei-domain.out
echo http://$target >> httpx.out
katana -l httpx.txt -d 4 -jsl -jc -o katana.out
cat nuclei-subdomains.out nuclei-domain.out | grep wordpress | awk '{print $4}' >> wordpresses.out
rm subfinder.out assetfinder.out findomain.out permutations1.out permutations2.out
echo 'ALL SITES IN THE RANGE THAT USE WORDPRESS ARE STORED IN THE wordpresses.out FILE!'
