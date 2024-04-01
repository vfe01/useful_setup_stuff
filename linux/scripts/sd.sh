seq 1 9 | xargs -I '*' echo -e alias sd'*'=\'dir'*'=\$\(pwd\)\; echo path \$dir'*' saved to variable dir'*'\' "\n"alias rtd'*'=\'cd $dir'*'\' | cat > .sd; echo source ~/.sd >> ~/.bashrc
