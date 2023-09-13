# Interacting with the user

## Arguments in Bash Scripting

* Allows us to pass information into a script from the CLI
* Are text that represent a string, a filename, and so on
* Are represented by numbered vafiables ($1,$2, and so on)

```bash
# The variable $0 is the name of the script
# The first argument is assigned to $1

echo "The $0 script got the argument: $1"

./myscript Apple
# The ./myscript script got the argument: Apple 

echo "The $0 script got the argument: $1"
echo "Argument 2 is: $2"

./myscript Apple "Apple Pie"
# The ./myscript script got the argument: Apple
# Argument 2 is: Apple Pie
```

### Argument Array

```bash
for i in "$@"
do
    echo $i
done

#The variable $# contains the number of arguments
echo "There were $# arguments" 

./myscript cat dog "blue bird"
# cat
# dog
# blue bird
# There were 4 arguments
```

## Options in Bash Scripting

* Allow us to pass information into a script from the CLI
* Are a combination of a dash and a letter (like -u or -p)
* Are accessed using the getopts keyword
* Can accept arguments of their own
* Can be specified and used in any order

### optstring

* getopts takes an optstring and a variable name

```bash
while getopts u:p:ab option;
# variables followed by a colon like u: p:
#   expect a value
# variables without a colon are optionaly
#   the optional options can only respond to presence
# a colon before the opts string not associated with anyouther letter
#   responses to options not defined
```

```bash
# ./myscript
#!/usr/bin/env bash
while getopts :u:p:ab option; do
    case $option in
        u) user=$OPTARG;;
        p) pass=$OPTARG;;
        a) echo "got the 'a' flag";;
        b) echo "got the 'b' flag";;
        ?) echo "I dont know what $OPTARG is!"
    esac
done

echo "user $user / pass: $pass"

./myscript -u rajah -p wu
# user rajah / pass: wu

./myscript -u rajah -p wu -b
# got the 'b' flag
# user rajah / pass: wu

./myscript -u rajah -p wu -b -z
# got the 'b' flag
# I dont know what z is!
# user rajah / pass: wu
```
