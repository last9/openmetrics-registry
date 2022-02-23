usage() {
  echo "Usage: $0
    [-d <directory path where hcls files are present>]
    [-i <file exclude pattren from given directory | default ''>"
}

while getopts ":d:i:" o; do
    case "${o}" in
        d) d=${OPTARG} ;;
        i) i=${OPTARG:=""} ;;
        *) usage;;
    esac
done

if [[ -z $d ]] ; then
    usage;
    exit 1
fi

start() {
  cat <<EOF
---
apiVersion: v1
data:
EOF
}

files_data() {
  echo "  ${FILE_NAME}: |"
  while IFS= read -r line; do
    echo "    $line"
  done < "${DIR}/${FILE_NAME}"
}

end() {
  cat <<EOF
kind: ConfigMap
metadata:
  labels:
    app.kubernetes.io/name: exporters
  name: exporters
  namespace: default
EOF
}

start;

ls $d -I "$i" | while read line 
do
  FILE_NAME="$line" DIR="$d" files_data;
done

end;
