#!/bin/bash
. bin/base.sh

check_dependency pv
check_dependency pigz
check_dependency man man-db

init_repo

### blob object hash ###

pe "echo 'Hello, world.' > readme.md"
pe "git add readme.md" # creates a blob object
pe "pigz --decompress < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97" # using zlib to decompress blob files (normal deflate algorithm)
pe "pigz -d < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97 | sha1sum" # content is base for sha1 generation
pe "pigz -d < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97 | xxd" # notice null character after size and new line at the end
pe "clear"

p 'printf "blob 14\\x00Hello, world.\\n" | sha1sum'
printf "blob 14\x00Hello, world.\n" | sha1sum # \x00 and \n
pe "CONTENT='Hello, world.'"
pe 'echo $CONTENT | wc -c'
p 'printf "blob $(echo $CONTENT | wc -c)\\x00$CONTENT\\n"'
printf "blob $(echo $CONTENT | wc -c)\x00$CONTENT\n"
p 'printf "blob $(echo $CONTENT | wc -c)\\x00$CONTENT\\n" | sha1sum'
printf "blob $(echo $CONTENT | wc -c)\x00$CONTENT\n" | sha1sum
pe "clear"

### git hash-object ###

pe "man git hash-object"
pe 'echo $CONTENT | git hash-object -t blob --stdin'
pe "clear"

### tree object hash ###

pe "git commit -m \"initial commit message\""
pe "git cat-file -t 46da79a"
pe "git cat-file -s 46da79a"
pe "git cat-file -p 46da79a"
pe "clear" 
pe "pigz -d < .git/objects/46/da79aa0393fda954c12ed4c6e7de8a920d52b5"
pei ""
pe "pigz -d < .git/objects/46/da79aa0393fda954c12ed4c6e7de8a920d52b5 | xxd"
pe "clear"

p 'printf "tree 37\\x00100644 readme.md\\x00\\xf7\\x5b\\xa0\\x5f\\x34\\x0c\\x51\\x06\\x5c\\xbe\\xa2\\xe1\\xfd\\xbf\\xe5\\xfe\\x13\\x14\\x4c\\x97"'
printf "tree 37\x00100644 readme.md\x00\xf7\x5b\xa0\x5f\x34\x0c\x51\x06\x5c\xbe\xa2\xe1\xfd\xbf\xe5\xfe\x13\x14\x4c\x97"
pei ""
p 'printf "tree 37\\x00100644 readme.md\\x00\\xf7\\x5b\\xa0\\x5f\\x34\\x0c\\x51\\x06\\x5c\\xbe\\xa2\\xe1\\xfd\\xbf\\xe5\\xfe\\x13\\x14\\x4c\\x97" | sha1sum'
printf "tree 37\x00100644 readme.md\x00\xf7\x5b\xa0\x5f\x34\x0c\x51\x06\x5c\xbe\xa2\xe1\xfd\xbf\xe5\xfe\x13\x14\x4c\x97" | sha1sum
pei ""
pe "clear"

p 'printf "tree 37\\x00100644 readme.md\\x00" > tree-hash.txt'
printf "tree 37\x00100644 readme.md\x00" > tree-hash.txt
p "printf \"\$(echo f75ba05f340c51065cbea2e1fdbfe5fe13144c97 | sed -e 's/../\\x&/g')\" >> tree-hash.txt"
printf "$(echo f75ba05f340c51065cbea2e1fdbfe5fe13144c97 | sed -e 's/../\\x&/g')" >> tree-hash.txt
pe "sha1sum tree-hash.txt"
pe "clear"

### commit object hash ###

pe "git log --pretty=fuller"
pe "GIT_COMMITTER_DATE=\"2022-10-21T12:00:00\" git commit --amend --no-edit --quiet --date=\"2022-10-21T12:00:00\""
pe "git log --pretty=fuller"
pe "GIT_COMMITTER_DATE=\"2022-10-21T12:00:00\" git -c user.name=\"A U Thor\" -c user.email=author@example.com commit --amend --no-edit --quiet --reset-author --date=\"2022-10-21T12:00:00\""
pe "git log --pretty=fuller"
pe "clear"

pe "pigz -d < .git/objects/96/ec08604a2df92697ee6318c722b251e8509afb"
pei ""
pe "pigz -d < .git/objects/96/ec08604a2df92697ee6318c722b251e8509afb | xxd"
pe "clear"
