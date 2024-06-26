#!/bin/bash
for source in `cat subscriptions.list`; do
	echo $source;
	curl --silent $source >> ads.txt
	echo -e "\t`wc -l ads.txt | cut -d " " -f 1` lines downloaded"
done

echo -e "\nFiltering non-url content..."
perl converter.pl ads.txt > ads_parsed.txt
rm ads.txt
echo -e "\t`wc -l ads_parsed.txt | cut -d " " -f 1` lines after parsing"

echo -e "\nRemoving duplicates..."
sort -u ads_parsed.txt > ads_unique.txt
rm ads_parsed.txt
echo -e "\t`wc -l ads_unique.txt | cut -d " " -f 1` lines after deduping"

cat ads_unique.txt >> blacklist.txt
sort -u blacklist.txt > blacklist.txt2
rm blacklist.txt
mv blacklist.txt2 blacklist.txt
rm ads_unique.txt
