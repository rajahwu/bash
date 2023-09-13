# Reading and Writng Text Files

* Write to  files with output redirection operators (> and >>)
  * echo "abc" > out.txt overwrites the contents of out.txt
  * echo "abc" >> out.txt appends to the end of out.txt

* Read from files with input redirecton (<) and read command
  * while read line; do echo $line; done < in.txt

## Writing to text files

```bash
for i in 1 2 3 4 5
    do echo "This is line $i" > textfile.txt
done

cat textfile.txt
# This is line 5

for i in 1 2 3 4 5
    do echo "This is line $i" >> textfile.txt
done

cat textfile.txt
# This is line 1
# This is line 2
# This is line 3
# This is line 4
# This is line 5
```

## Reading text files

```bash
while read f
    do echo "I read a line and it says: $f"
done < textfile.txt
# I read a line and it says: This is line 1
# I read a line and it says: This is line 2
# I read a line and it says: This is line 3
# I read a line and it says: This is line 4
# I read a line and it says: This is line 5
```
