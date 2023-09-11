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
echo $(( 1 + RANDOM % 100 )) 
# random number between 1 and 10
```
