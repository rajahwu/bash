# Script Portability

* Check the user's Bash version before running the script
  * $BASH_VERSION and $BASH_VERSINFO contain version info

```bash
[[  ! $BASH_VERSINFO -ge 4 ]] && echo "You'll need to update to Bash+." && exit
```

* Check if the user has nonstandard tools the script uses

```bash
[[ ! -a $(which nmap) ]] && echo "This script use Nmap, which was not found on this system." && exit
```

* Sometimes, it's useful to write script that also work with
    Bourne Shell (sh) for broader compatibility

* Keep scripts clear, readable, and well commented for yourself and others

* Decide how portable the script need to be
