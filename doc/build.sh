#brew install pandoc
pandoc -f markdown -t docx OPENAPI_README.md -o OPENAPI_README.docx
tar czvf openapi$(date +%Y%m%d).tgz OPENAPI_README.md OPENAPI_README.docx img sdk/sdk_v2_online.zip
