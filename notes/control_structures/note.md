# Control Structures

* Allow us to control how a script executes
* Run specifed code based on conditions

## if ... then ... fi

If statements execute code based on a conditional expression.

```bash
if [[ ... ]]
then
    script
else
    script
fi

if condition; then script; fi
```

```bash
declare -i a=3

if (($a>4))
then
    echo "$a is greater than 4!"
elif (($a>2))
then echo "$a is greater than 2."
else
    echo "$a is not greater than 4!"
fi
```

## while ... do ... done | until ... do ... done

* While loops run as long as their condition is true
* Until loops run as long as their condition is false

```bash
echo "While Loop"

declare -i n=0
while ((n<10))
do
    echo "n:$n"
    ((n++))
done

echo -e "\n Until Loop"

declare -i m=0
until ((m==10)); do
    echo m:$m
    ((m++))
done
```
