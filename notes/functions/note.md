# Bash Functions

## fname() {...}

Functions allow us to repeatedly call a peice of code.

```bash
greet() {
    echo "Hi there!"
}

echo "And now, a greeting!"
greet
# And now, a greeting!
# Hi there!
```

Funtions with arguments

```bash
greet() {
    echo "Hi there!, $1! What a nice $2"
}

echo "And now, a greeting!"
greet Rajah day
# And now, a greeting!
# Hi there!, Rajah! What a nice day
```

## Function Variables

* $@ represents the list of arguments given to a funciton
* $FUNCNAME represents the name of the funciton

```bash
numberthings() {
    i=1
    for f in "$@"; do
    echo $i: "$f"
    ((i++))
    done
    echo "This counting was brought to you by the function $FUNCNAME!"
}

numberthings *
echo
numberthings pine birch maple spruce

# 1: dir1
# 2: dir2
# 3: dir3
# 4: error.txt
# 5: list.txt
# 6: lorem.txt
# 7: myscript
# 8: notes
# 9: output.txt
# 10: readme.md
# 11: snippets.md
# 12: sys_info.sh
# 13: sysreport
# This counting was brought to you by the function numberthings!

# 1: pine
# 2: birch
# 3: maple
# 4: spruce
# This counting was brought to you by the function numberthings!
```

## Scope

```bash
var1="I'm variable 1"

myfunction() {
    var2="I'm variable 2"
    local var3="I'm variable 3"
}

myfunction

echo $var1
echo $var2
echo $var3

# I'm variable 1
# I'm variable 2
#
```
