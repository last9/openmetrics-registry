module_dirs="aws gcp"

for d in $module_dirs; do
  find $d -name "*.hcl" | awk '{
    a=$1; b=$1; path=$1
    gsub("[[:punct:]]/", "", a);
    gsub("[[:punct:]]/", "", path);
    gsub("/", "_", a)
    n=split($1, s, "/")
    gsub(s[n], "version.txt", b)
    cmd = "cat " b
    cmd | getline c
    gsub("[[:punct:]]hcl", "_v"c".hcl", a)
    print a":"path
  }'
done
