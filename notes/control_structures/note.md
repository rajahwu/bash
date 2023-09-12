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

## for i in ... do ... done

For loops, iterate through a list of items,
    running once for each item

```bash
for i in 1 2 3; do echo $i; done
# 1
# 2
# 3

for i in {1..100}
do  
    echo $i
done

for (( i=1; i<=10; i++))
do  
    echo $i
done

declare -a fruits=("apple" "banana" "cherry")
for i in ${fruits[@]}
do  
    echo $i
done
# apple
# banana
# cherry

declare -A arr
arr["name"]="scott"
arr["id"]="1234"
for i in "${!arr[@]}"
do
    echo $i: "${arr[$i]}"
done

for i in $(ls)
do 
    echo "Found a file: $i"
done

for i in *
do 
    echo "Found a file: $i"
done
```
