@echo off
setlocal enabledelayedexpansion

for %%G in (
  arch b2sum b3sum base32 base64 basename basenc cat cksum comm cp csplit cut
  date dd df dir dircolors dirname du env expand expr factor false fmt
  fold hashsum head hostname join link ln ls md5sum mkdir mktemp more mv nl
  nproc numfmt od paste pr printenv printf ptx pwd readlink realpath rm rmdir
  seq sha1sum sha224sum sha256sum sha3-224sum sha3-256sum sha3-384sum sha3-512sum
  sha384sum sha3sum sha512sum shake128sum shake256sum shred shuf sleep sort split
  sum sync tac tail tee test touch tr true truncate tsort uname unexpand uniq
  unlink vdir wc whoami yes
) do (
  doskey %%G=coreutils %%G $*
)

:: Add specific command overrides here
:: Ex: I always want `ls` output to be colored
doskey ls=coreutils ls --color=auto $*

echo Coreutils aliases set up successfully
