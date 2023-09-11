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
|3| Standard error (stderr) | Output marked as 'error' |

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

### Brace expansion

### Parameter expansion

### Command substitution

### Arithmetic expansion
