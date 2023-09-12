# Formatting and styling text output

## echo -e

Interprets escaped characters like \t, \n, \a, and other control characters

```bash
echo -e "Name\t\tNumber"; echo -e "Scott\t\t123"
# Name            Number
# Scott           123
echo -e "This text\nbreaks over\nthree lines"
# This text
# breaks over
# three lines

echo -e "\a" # bell
```

## Control Characters

**\033** : Formating Instructions

```bash
echo -e "\033[33;44mColor Text\033[0m"
echo -e "\033[30;42mColor Text\033[0m"
echo -e "\033[41;105mColor Text"
echo "some text that shouldn't have styling"
echo -e "\033[0m"
echo "some text that shouldn't have styling"
echo -e "\033[4;31;40mERROR:\033[0m\033[31;40m Something went wrong.\033[0m"
```

### Common Terminal Colors and Styles

#### Colors

| Color | FG | BG |
|-------|----|----|
|Black|30|40|
|Red|31|41|
|Green|32|42|
|Yellow|33|43|
|Blue|34|44|
|Magenta|35|45|
|Cyan|36|46|
|White|37|47|

|Bright Black|90 | 100 |
|Bright Red |91 | 101 |
|Bright Green|92 | 102 |
|Bright Yellow|93 | 103 |
|Bright Blue|94 | 104 |
|Bright Magenta|95 | 105 |
|Bright Cyan|96 | 106 |
|Bright White|97 | 107 |

#### Styles

|Style||
|-----|-|
|Reset |0|
|Bright (bold)|1|
|Dim|2|
|Italic|3|
|Underlined|4|
|Blinking|5|
|Inverted|7|
|Strikethrough|9|

```bash
echo -e "\033[4;32mExample \033[1;94mText\033[0m" # Example Text
# Underlined with "Example" colored green and "Text" colored blue
```

## printf "..." values

Outputs text using placeholder and formatting

**%d** : digit
**%s** : string
**%-** : left-aligned

```bash
echo "The results are: $(( 2 + 2 )) adn $(( 3 / 1))"

printf "The results are: %d and $d\n" $(( 2 + 2 )) $(( 3 / 1 ))
```

### Formating dates

```bash
printf "%(%Y-%m-%d %H:%M:%S)T\n" 1658179558
date +%s
date +%Y-%m-%d\ %H:%M:%S
printf "%(%Y-%m-%d %H:%M:%S)T\n" $(date +%s)
printf "%(%Y-%m-%d %H:%M:%S)T\n"
printf "%(%Y-%m-%d %H:%M:%S)T is %s\n" -1 "the time"

```