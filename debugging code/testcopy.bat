echo off
set trainpath=%2
set trainoutput=%4

echo "going to copy the file"
copy "helloworld.py" %trainoutput%
echo "finished copying the file"

::Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtrain.R"