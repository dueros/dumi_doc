#brew install pandoc

cat >files <<END
mateapp.md
tutorial.md
sdk/index.md
api/overview.md
api/request.md
api/response.md
directives/AudioPlayer.md
directives/Speaker.md
directives/SpeechSynthesizer.md
Skills.md
BOTAPI_README.md
BOTAPI2.0_README.md
END

######### update index
for f in $(cat files|grep -v '#')
do
cat >tmp_awk_script <<END
BEGIN{
    off=0;
}
{
    if(\$0~/^## Table of Contents/) {
        print
        off=1
        print "\n"
        system("./gh-md-toc $f|grep '*'");
        print "\n"
    }else if(\$0~/^##/) {
        off=0
    }
    if(off==0){
        print
    }
}
END
awk -f tmp_awk_script  $f >tmp_md
rm tmp_awk_script
mv tmp_md $f
done
#####################


#pandoc -f markdown -t docx OPENAPI_README.md -o OPENAPI_README.docx
#pandoc -f markdown -t html OPENAPI_README.md -o OPENAPI_README.html


#tar czvf openapi$(date +%Y%m%d).tgz OPENAPI_README.md OPENAPI_README.docx OPENAPI_README.html img sdk/sdk_v2_online.zip
