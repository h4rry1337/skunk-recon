#!/usr/bin/env bash
echo '
	    x            )
           / \        (  ) (
          / X \        )    )
         _______      (  ( (
        ( O   O )        )
 ____oOO___(_)___OOo____(
(_______________________)
          L00k3y

from maconheiros to maconheiros
  !SKUNKS ALSO USE INTERNET!'
target=$1
subfinder -d $target -o subfinder.txt -silent | alterx -en -silent 1>/dev/null
assetfinder --subs-only $target >> assetfinder.txt 1>/dev/null
findomain -t $target -u findomain.txt 1>/dev/null
sort -u subfinder.txt assetfinder.txt findomain.txt >> subs.txt
mksub -df subs.txt -l 1 -w ~/skunk-recon/wordlist.txt -r "^[a-zA-Z0-9\.-_]+$" -o permutations1.txt 1>/dev/null
gotator -sub subs.txt -perm ~/skunk-recon/wordlist.txt -depth 1 -numbers 10 -mindup -adv -md > permutations2.txt 1>/dev/null
cat permutations1.txt permutations2.txt | sort -u >> permutations.txt
puredns resolve -r resolvers.txt  permutations.txt -w subs.txt 1>/dev/null
httpx -l subs.txt -retries 2 -threads 100 -o httpx.txt -silent 1>/dev/null
nuclei -l httpx.txt -nh -s info,low,medium,high,critical,unknown -o nuclei-subdomains.txt
nuclei -u $target -s info,low,medium,high,critical,unknown -o nuclei-domain.txt
rm subfinder.txt assetfinder.txt findomain.txt permutations1.txt permutations2.txt
