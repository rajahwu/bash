# Programing wiht bash

## Bash Script syntax

### One-liners

 A command or series of commands presented as one line of text.

* Many commands present in one line of text

* Often piped commands or commands separated by
 semicolon

* Can be very long (and even wrap), but there's
 no newline until the end

* Often stored in a note for frequent use

* Can be used with the alias built in

### Bash script

* Text file that contains a series of commands
* chmod +x myscript.sh
* bash myscript.sh

### Executable bash script

* Includes a shebang as the first line
    (#!/usr/bin/env bash)
* Make executabl with chmod _x myscript
* Run locally with ./myscript or if in the $PATH

```bash
#!/usr/bin/env bash
echo "hello"

# This is a comment
echo "there"
```

* Bash script run inside of a noninteractive shell
* You can change options for the subshell with set
    or shopt in the script
* Scripts help avoid typos and easier sharing of Bash code

## echo

Prints text to the standard output

* \ escapes a character

* ' '  *single quotes or strong quotes*
  * treats everything in the string as literal text

* " " *double quotes*
  * Interprets substitutions, expansion evaluation, variables, and so on

* End with a newline by defalut

```bash
echo

echo;echo "More space!"; echo

# More Space

echo -n "No newline"
echo -n "Part of"; echo -n " a statement"
# Part of a statement
```

## Variable

Allow us to store and retrieve values by name

Variables are a special case of parameter substitution

Variable are named with alphanumeric character

Variables are assigned with an = sign with no space on either end

Variable name are case-sensitive

```bash
mygreeting=Hello
```

Variables are available until the shell session closes

**declare -r** creates a read only variable

### Text transformations

**declare -l** changes the string to lowercase

**declare -u** changes the string to uppercase

**declare -p** show all session variables

**declare -i** for integers

```bash
echo $USER # returns username
```

## Working with Numbers

### $((...))

Arithmetic expansion returns the result of mathematical operations.

### ((...))

Arithmetic evaluation performs calculations and changes the value of variables.

| Operation | Operator |
|-----------|----------|
|Addition|+|
|Subtraction|-|
|Multiplication|*|
|Division|/|
|Modulo|%|
|Exponentiation|**|

Bash only supports integer calculations.

To do more precise calculations, consider using bc or awk

### Bc with Bash

```bash
declare -i c=1
declare -i d=3
e=$(echo "scale=3; $c/$d" | bc)
echo e #.333 treated as text
```

### Random

```bash
echo $RANDOM
# return number between 0 and 32,767
echo $(( 1 + RANDOM % 10 )) 
# random number between 1 and 10
```

## Testing Expression

### [ ... ] | test

[ is an alias for the test built-in and is isused thetes or evaluate expressions ]

```bash
help test

[ 4 -lt 3]; echo $? # 1 
```

* When a test is run an exit or return status of zero or one is reutrned

* 0 means success, and 1 means failure

* 0 and 1 can be treated as truth values (0=true, 1=false)

* The return status is treated as the value of the command

* The variable $? stores the return status of the last-run command

* ! to negate test results

```bash
String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.

arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne, -lt, -le, -gt, or -ge.
```

### [[ ... ]] extend test

Extended test supports comparison that test runs and adds other features

```bash
[[ -d ~ && "cat" = "cat" ]]; echo $? # 0
[[ -d ~ && "cat" = "dog" ]]; echo $? # 1
[[ -d ~ || "cat" = "dog" ]]; echo $? # 0
[[ -d ~ ]] && echo ~ is a directory
# /home/username is a directory
ls && echo "listed the directory"

true && echo "success!" # success!
false && echo "success!" # 
```

### Regex matching | =~

```bash
[[ "cat" =~ c.* ]]; echo $? %
```

Extended test offers more features best to use them over switching between the two

Test is more widely compatible with other shells

## Arrays

Bash supports indexed and associative arrays

### Indexed Arrays

```bash
snacks=("apple" "banana" "orange")
declare -a snacks=("apple" "banana" "orange")

echo ${snacks[2]}

snacks[5]="grapes"
snacks+=("mango")
echo ${snacks[@]} # prints all array elements

for i in {0..6}; do echo "$i: ${snacks[i]}"; done
# 0: apple
# 1: banana
# 2: orange
# 3: 
# 4: 
# 5: grapes
# 6: mango
```

### Associative Arrays

```bash
declare -A office
office[city]="Philadelphia"
office["building name"]="HQ West"
echo ${office["building name"]} is in ${office[city]}
# HQ West is in Philadelphia
```
