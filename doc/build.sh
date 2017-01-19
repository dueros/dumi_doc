#brew install pandoc


######### update index
cat >tmp_awk_script <<END
BEGIN{
    off=0;
}
{
    if(\$0~/^## Table of Contents/) {
        print
        off=1
        print "\n"
        system("./gh-md-toc OPENAPI_README.md|grep '*'");
        print "\n"
    }else if(\$0~/^##/) {
        off=0
    }
    if(off==0){
        print
    }
}
END
awk -f tmp_awk_script  OPENAPI_README.md >tmp_md
rm tmp_awk_script
mv tmp_md OPENAPI_README.md
#####################


pandoc -f markdown -t docx OPENAPI_README.md -o OPENAPI_README.docx
pandoc -f markdown -t html OPENAPI_README.md -o OPENAPI_README.html


tar czvf openapi$(date +%Y%m%d).tgz OPENAPI_README.md OPENAPI_README.docx OPENAPI_README.html img sdk/sdk_v2_online.zip
