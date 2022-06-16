#!/bin/bash
######################

CWD=`pwd`

[ -f ./sound_headers.h ] && rm ./sound_headers.h

cd ./Sounds

[ -f ./files.txt ] && rm ./files.txt

ls -1 *.wav >files.txt

while read -r a_file; do

    if [ -f ./${a_file} ]; then
        _name="$(echo "${a_file}" | tr '-' '_' | rev | cut -c 5- | rev)"
        sox ./${a_file} -t raw -e signed -b 16 -L -r 44100 -c 2 pcm.raw
        xxd -i pcm.raw > ./${_name}.h
        sed -i "s/pcm_raw/${_name}/g" ./${_name}.h
        mv ./${_name}.h ../RawHeaders
        echo "#include \"./RawHeaders/${_name}.h\"" >> ../sound_headers.h
        [ -f ./pcm.raw ] && rm ./pcm.raw
    fi
done < ./files.txt

cd ${CWD}
