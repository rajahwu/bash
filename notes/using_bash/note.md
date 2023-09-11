# Bash

## Commands

### Pipes and Redirection

* Pipes send the ouput of one process to another
  * ls | wc -l

```bash
    cat lorem.txt 
    cat lorem.txt | less
    # type q to quit
    cat lorem.txt | wc # word cout
    # output   45    1853   12577
    #         lines  words  chars
```

* Redirection send streams (standard input, output, and error)
    to or from files
  * ls > list.txt

| Stream | Name     |Content      |
|--------|----------|-------------|
|0|Standard input (stdin) | Keyboard or other input |
|1|Standard output (stdout) | Regular output |
|2| Standard error (stderr) | Output marked as 'error' |

|Symbol | Function |
|-------|---------------|
| > | Output redirection (truncate) |
| >> | Output redirection (append) |
| < | Input redirection (append) |
| << | Here document |

```bash
cat << EndOfText
    > This is a
    > multiline
    > text string
    >EndOfText
```

### [bash built-ins](https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html)

* echo - prints texts and add newline
* printf - prints texts without newline

Commands and buitins can over lap to specify:

```bash
command echo hello

builtin echo hello

command -V [program_name] 
# tells if a program is a command or a builtin
```

Builtins take precedence over commands

```bash
enable -n [program_name] # disables the builtin
enable [program_name] # reinable the builtin
```

Builtins use a different documention than the
regular man pages

```bash
help # for builtins

```

## Parentheses, Braces, and Bracket

Bash uses these characters differently than other languages.

## Expansion and subtitutions

Used to specify values that are unknown until a script runs.
Both are interpreted when the run and replace themselves
    with a value or set of values.

| Representation | Name      |
|----------------|-----------|
| ~ | Tidle expansion |
| {...} | Brace expansion |
| ${...} | Parameter expansion |
| $(...) | Command substitution |
| $((...)) | Arithmetic expansion |

### Tilde expansion ~

Tilde expansion represents the user's $HOME environment variable.

```bash
    echo ~ # /home/username

    whoami # username

    echo ~- # OLDPWD 
    # prints the last dir before current
```

### Brace expansion | {a,b,c} {x..y..i}

Brace expansion creates sets or ranges.

**Uses:**

 Keep part of a path the same, but replace a little piece of it

```bash
echo /tmp/{one,two,three}/file.txt
# /tmp/one/file.txt /tmp/two/file.txt /tmp/three/file.txt
```

Provide a set of values in the same part of a string more generally

```bash
echo c{a,o,u}t
# cat cot cut
```

Working with sequential items

```bash
echo /tmp/{1..3}/file.txt
    # /tmp/1/file.txt /tmp/2/file.txt /tmp/3/file.txt

echo {00..50} # 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50

echo {10..1} # 10 9 8 7 6 5 4 3 2 1

echo {a..z} # a b c d e f g h i j k l m n o p q r s t u v w x y z

echo {Z..A} # Z Y X W V U T S R Q P O N M L K J I H G F E D C B A

echo {1..30..3} # add interval
# 1 4 7 10 13 16 19 22 25 28

echo {a..z..2} # a c e g i k m o q s u w y

# Combined expressions 

touch file_{01..05}{a..d}

ls # file_01a file_01b file_01c file_01d file_02a file_02b file_02c file_02d file_03a file_03b file_03c file_03d file_04a file_04b file_04c file_04d file_05a file_05b file_05c file_05d

rm file_* # remove created files

echo {cat,dog,fox}_{1..5}
# cat_1 cat_2 cat_3 cat_4 cat_5 dog_1 dog_2 dog_3 dog_4 dog_5 fox_1 fox_2 fox_3 fox_4 fox_5
```

### Parameter expansion | ${...}

Retrieves and transforms stored values.
Can be used without braces.

```bash
a="Hello World"
echo $a # Hello World
echo ${a} # Hello World
echo ${a:1:9} # ello Worl
echo ${a/World/Everybody} 
# Hello Everybody
```

**Uses:**

```bash
greeting="hello there!"
echo $greeting # hello there!

echo ${greeting:6} # there!
# value starting from position 6

echo ${greeting:6:3} # the
# start 6 run three
```

Pattern substitution

```bash
# replace first match
echo ${greeting/there/everybody} 
# hello everybody!

#replace all
echo ${greeting//e/_} 
# h_llo th_r_!
```

### Command substitution | $(...)

Puts the output of one command inside another.

Often used with tools such as GREP, AWK, and CUT,

and is widely used to determine whether a script has what it needs on the target system.

```bash
uname -r # release version of the kernel
# 5.15.90.1-microsoft-standard-WSL2
echo "The kernel is $(uname -r)."
# The kernel is 5.15.90.1-microsoft-standard-WSL2.
echo "The Python version is $(python -V)."
# The Python version is Python 3.9.4.
echo "Result: $(python3 -c 'print("Hello from Python!")' | tr [a-z] [A-Z])"
# Result: HELLO FROM PYTHON!
```

### Arithmetic expansion | $((...))

Does calculations
Bash can on do calculation with integers

```bash
echo $(( 2 + 2)) # 4
echo $((4 / 5 )) # 0
```
