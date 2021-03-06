# LazyMake

reckless code do not judge, but it save up some time

Add this to your .whatevershellrc

```bash
lazymake() {
  cp /Your/Path/to/LazyMake.sh .
  if [ -n "$1" ]
    then
      ./LazyMake.sh ${1}
    else
      ./LazyMake.sh
    fi
  rm LazyMake.sh
}
```
change the second line before using it

call lazy make with a 1 will include CSFML librairy , 2 will include ncurses.

there's features that you can enable by opening the script and looking for them at the begining
