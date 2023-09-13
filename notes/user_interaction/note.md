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

## read

* Scripts often need input as they run
* The read keyword allow us to gather input,
    pausing the script until input is provided
* Input is stored in a variable

```bash
echo "What is you name?"
read name

echo "What is your password?"
read -s pass

read -p "What's your favorite animal? " animal

echo name: $name, pass: $pass, animal: $animal
# What is you name?
# Rajah
# What is your password
# What's your favorite animal? bird
# name: Rajah, pass: wu, animal: bird
```

### help read

```bash
read: read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]
    Read a line from the standard input and split it into fields.
    
    Reads a single line from the standard input, or from file descriptor FD
    if the -u option is supplied.  The line is split into fields as with word
    splitting, and the first word is assigned to the first NAME, the second
    word to the second NAME, and so on, with any leftover words assigned to
    the last NAME.  Only the characters found in $IFS are recognized as word
    delimiters.
    
    If no NAMEs are supplied, the line read is stored in the REPLY variable.
    
    Options:
      -a array  assign the words read to sequential indices of the array
                variable ARRAY, starting at zero
      -d delim  continue until the first character of DELIM is read, rather
                than newline
      -e        use Readline to obtain the line
      -i text   use TEXT as the initial text for Readline
      -n nchars return after reading NCHARS characters rather than waiting
                for a newline, but honor a delimiter if fewer than
                NCHARS characters are read before the delimiter
      -N nchars return only after reading exactly NCHARS characters, unless
                EOF is encountered or read times out, ignoring any
                delimiter
      -p prompt output the string PROMPT without a trailing newline before
                attempting to read
      -r        do not allow backslashes to escape any characters
      -s        do not echo input coming from a terminal
      -t timeout        time out and return failure if a complete line of
                input is not read within TIMEOUT seconds.  The value of the
                TMOUT variable is the default timeout.  TIMEOUT may be a
                fractional number.  If TIMEOUT is 0, read returns
                immediately, without trying to read any data, returning
                success only if input is available on the specified
                file descriptor.  The exit status is greater than 128
                if the timeout is exceeded
      -u fd     read from file descriptor FD instead of the standard input
    
    Exit Status:
    The return code is zero, unless end-of-file is encountered, read times out
    (in which case it's greater than 128), a variable assignment error occurs,
    or an invalid file descriptor is supplied as the argument to -u.
```

## select

```bash
# ./myscript
#!/usr/bin/env bash
select animal in "bird" "dog" "fish"
do
    echo "You selected $animal"
    break
done

./myscript
# 1) bird
# 2) dog
# 3) fish
# #? 1
# You selected bird

# ./myscript
#!/usr/bin/env bash
select animal in "bird" "dog" "fish" "quit"
do
    case $animal in
        bird) echo "Birds like to fly.";;
        dog) echo "Dogs like to play catch.";;
        fish) echo "Fish like to swim.";;
        quit) break;;
        *) echo "I'm not sure what that is."
    esac
done

./myscript
# 1) bird
# 2) dog
# 3) fish
# 4) quit
# #? 1
# Birds like to fly.
# #? 3
# Fish like to swim.
# #? 2
# Dogs like to play catch.
# #? h
# I'm not sure what that is.
# #? 4
```

## Ensuring a response

* Use -i to suggest a response to the user

```bash
# ./myscript
#!/usr/bin/env bash
read -ep "Favorite color? " -i "Blue" favcolor
echo "$favcolor"

./myscript
# Favorite color? Blue
# Blue
```

* The $# variable holds the number of total arguments

```bash
# ./myscript
#!/usr/bin/env bash
if (($#<3)); then
    echo "This command requires three arguments:"
    echo "username, userid, and favorite number"
else
    echo "username: $1"
    echo "userid: $2"
    echo "favorite number: $3"
fi

./myscript rajah
# This command requires three arguments:
# username, userid, and favorite number

./myscript rajah 1 17
# username: rajah
# userid: 1
# favorite number: 17
```

* Use a loop to stop execution until correct
    input is received

```bash
# ./myscript
#!/usr/bin/env bash
read -p "Favorite animal? " fav
while [[ -z $fav ]]
do
    read -p "I need an answer! " fav
done
echo "$fav was selected."

./myscript
# Favorite animal? 
# I need an answer! 
# I need an answer! 
# I need an answer! cat
# cat was selected.

read -p "Favorite animal? [cat]" fav
if [[ -z $fav ]]; then
    fav="cat"
fi
echo "$fav was selected."

./myscript
# Favorite animal? [cat]
# cat was selected.
```

## Validation

```bash
# ./myscript
#!/usr/bin/env bash
read -p "What year? [nnn] " year
until [[ $year =~ [0-9]{4} ]]; do
    read -p "A four-digit year, please! [nnnn] " year
done
echo "Selected year: $year"

./mysript
# What year? [nnn] 
# A four-digit year, please! [nnnn] 45
# A four-digit year, please! [nnnn] 1545
# Selected year: 1545
```
