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
