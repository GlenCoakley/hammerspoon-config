scriptDir="$(perl -e 'use Cwd "realpath"; use File::Basename; print dirname(realpath($0))')"
cd "$scriptDir"
diff -Bbr . ../.. | grep -v '^Only in'
