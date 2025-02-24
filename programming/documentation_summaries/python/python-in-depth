## Source Code Encoding

- Pythons default encoding is **UTF-8**
    - Characters of most languages in the world can be used simultaneously in:
        - Strings literals
        - Identifiers
        - Comments
    - The standard library only uses **ASCII** characters for identifiers
        - A convention any portable code should follow
	- Editor should be able to:
		- Recognise that the file is **UTF-8** 
		- Must use a font that supports all the characters in the file 
- **Declaring the Encoding** 
	- To declare an encoding other than the default UTF-8 a special comment should be added to the *first line*  of the file 

	```python
	# -*- coding: encoding -*-
	```

	- Replace *encoding* with one of the valid `codecs` support by Python 
	- Example 
		- Windows-1252 encoding 
			- `# -*- coding: cp1252 -*-`
	- Exception 
		- If code start with a `UNIX "shebang" line` the encoding line should be added as the second line

``` python 
#!/usr/bin/env python3
# -*- coding: cp1252 -*- 
```

--- 

## Using Python as a Calculator 
- Able to use all basic operators 
	- '+' 
	- '-' 
	- '* ' 
	- '/' 
	- '(x + y)' 
- Notes about specific operators 
	- '/' 
		- Classic division always returns a float 
			- 17 / 3 
			- 5.6666666666
	- '//' 
		- Floor division discards the fractional part 
			- 17 // 3 
				- 5 
	- '%' 
		- Returns the remainder of the division 
			- 17 % 3 
				- 2 
	- '**'  
		- Calculates the powers 
			- 5 ** 2 
				- 25 
	- '=' 
		- Assigns a value to a variable 
			- width = 20 
			- height = 5 * 9 
			- width + height 
				- 900 
- If a variable is not "defined" (assigned a value) it will return an error when used 
- Full support for **Floating Point** 
	- Operators with mixed type operands convert the integer to floating point 
		- 4 * 3.75 - 1
			- 14.0
- In **Interactive Mode**, the last printed expression is assigned to the variable ' _ '. 
	- This means that when you are using Python as a desk calculator, it is easier to continue calculations 

```python 
tax = 12.5 / 10
print = 100.50 
price * tax 
	12.5625 
price + _ 
	113.0626 
round(_, 2)
	113.06
```

> [!NOTE] 
> The variable should be treated as *read-only* 
> 	Do **NOT** assign a value to it 
> 		This would create an independent local variable with the same **name masking** the build-in variable with its 'magic behaviour' 

- In addition to `int` and `float`, Python supports other types of numbers 
	- Decimal 
	- Fraction 
- Also has support for complex numbers and uses the `j` or `J` suffix to indicate the imaginary part 
	- 3+5j 

--- 

## Text 

- Python can manipulate text 
	- Represented by: 
		- Type `str` 
			- Strings 
	- This includes:
		- "!"
		- Words: 
			- "rabbit"
		- Names: 
			- "Paris"
		- Sentences: 
		  "Hello there"

> [!NOTE] 
> They can be enclosed in both single ('...') and double ("...") quotations 

```python 
'spam eggs'
"Paris rabbit says hello" 
```

> [!IMPORTANT]
> Digits and numerals enclosed in quotes are also strings 

```python 
'2023'
```

- In order to quote in a string it needs to be escaped: 
	- This is achieved by preceding with: 
		- " \ "
	- Or by using the unused quotation marks 
```python
# Using the / 
'can/'t'

# Using different quotations 
"can't"
```

- In the Python shell, the string definition and output string can look different
	- The `print()` function produces a more readable output
		- It does this by omitting the enclosing quotes and by printing escaped and special characters 
```python
s = 'First line.\Second line.' # \n means a new line 
s
	'First line.\nSecond line.' # by just calling teh variable, the output includes the special characters in the string 

print(s) 
	First line. # using print(), special characters are interpreted and therefore \n will produce the new line 
	Second line.
```

- If you don't want characters prefaced by ' \ ' to be interpreted as special characters, a `raw string` can be used by adding `r` to the begging of the quote 
```python 
print('C:\file\path\name') # the \n will create a new line 
	C:\some\path
	ame 
print(r'C:\some\path\name') # using a raw quote with the preceding r 
	C:\some\path\name
```

> [!IMPORTANT]
> A raw string may not end in an odd number of \ characters 

- String literals can span multiple lines. 
	- This can be done by using triple quotes: 
		- """...""" 
		- '''...'''
	- End of lines are automatically included in the string 
		- It is possible to prevent this by adding a ' \ ' at the end of the line 
```python 
print("""\
	Usage: object [OPTIONS]
		-h                Something
		-H                Something else
""")
	Usage: object [OPTIONS]
		-h                Something 
		-H                Something else 
```

- Strings can be **concatenated** (stuck together) by using '+' and repeated with ' * '
```python 
3 * 'un' + 'ion'
	'unununion'
```

- Two or more *string literals* next to each other are automatically concatenated

```python 
'Py' 'thon'
	'Python'
```

- This feature is useful when breaking up long strings: 

```python
text = ('Put several strings within parentheses ' 
		'to have them join together.')
text 
	'Put several string within parentheses to have them join together.'
```

> [!IMPORTANT]
> This concatenation of strings **ONLY** works with literal string with no variables or expressions within

```python 
prefix = 'Py' # 
prefix 'thon' # This will return an error of 'Invalid Syntax'

('un' * 3) 'ium' # This will return an error of 'Invalid Syntax'
```

> [!TIP]
> To concatenate a variables or a string with variables, use a ' + '

```python 
prefix = 'Py'
prefix + 'thon'
	'Python'
```

- Strings can be indexed (subscripted)
	- A character is simply a string size of '1'

> [!IMPORTANT]
> Counting starts with **0** 
> Example: 
> 	Hello = H[0]e[1]l[2]l[3]o[4]

```python 
# Positive numbers 
word = 'Python' 
word[0]
	'P'
word[3]
	'h'
# Negative Numbers
word[-2] 
	'o'
word[-6]
	'P'
```

- This can be used to break up strings, this is known as **slicing**

```python 
word = 'Python'
word[0:2] # Characters from position 0 (included) to position 2 (excluded)
	'Py'
word[2:5] # Characters from position 2 (included) to position 5 (excluded)
	'tho'
```

- If leaving the first 'index' blank
	- It will default to '0'
- If leaving the second 'index' blank 
	- It will default to the last character 

```python 
word = 'Python'
word[:2]
	'Py'
word[4:]
	'on'
word[-2]
	'on'
```

> [!IMPORTANT]
> When slicing, the start is always **included** and the end is always **excluded** 

```python 
word = 'Python'
word[:2] + word[2:]
	'Python'
word[:4] + word[4:]
	'Python'
```

> [!TIP]
> A way to remember how slices work is to think that the indices are pointing *between* the characters with the **left** edge as **0**, the *first* character and the last character of *n* characters has index *n*

- Example 
+---+---+---+---+---+---+
| P | y | t | h | o | n | 
+---+---+---+---+---+---+
0   1   2   3   4   5   6 
-6  -5  -4  -3  -2  -1  0 

> [!NOTE] 
> For positive indices, the length of the slice is the difference between the indices

- Example: 

```python 
word = 'Python'
word[1:3] # The difference between 1 and 3 is 2 
	'yt' # The length of the sliced string is 2 characters 
```

> [!CAUTION] 
> Attempting to use an index too large (or too small) will not work and result in an error 


> [!IMPORTANT]
> String in Python are **immutable**, which means they cannot be changed. 
> This means assigning to an indexed position will not work and result in an error 

- Example 

```python
word = 'Python' 
word[0] = 'J' 
```

- Attempting the above will result in a *TypeError* as it is attempting to change an immutable variable 

- Considering it is not possible to change a string, a new string should be created instead 
```python 
word = 'Python' 
'J' + word[1:]
	'Jython'
word[:2] + 'py'
	'Pypy'
```

> [!NOTE]
> There is a built in function, `.len()` that will return the length of a string 

```python 
word = 'superrandomlongstringofcharacters'
len(word)
	33
```

> [!COMING SOON] 
> **textseq**: Strings are examples of *sequence types*, and support the common operations supported by such types 
> **string-methods**: String support a large number of methods for basic transformations and searching 
> **f-string**: String literals that have embedded expressions 
> **formatstrings**: Information about string formatting with `str.format()`
> **old-string-formatting**: The old formatting operations invoked when strings are left operand of the `%` operator are described in more detail 

--- 

## Lists 

- Python makes use of a number of *compound* data types, these are used to group together other values
	- The most versatile is the **list** data type
- A list is written using *comma-separated-values* between **square brackets** '[]'
	- A list can contain items of all different types
		- They are usually populated by the same data type though 

> [!NOTE] 
> Lists can also be indexed and sliced 

- Example of a list 

```python 
squares = [1, 4, 9, 16, 25]
squares
	[1, 4, 9, 16, 25]
```

- Indexing a list 

```python 
squares = [1, 4, 9, 16, 25]
squares[0]
	1
squares[-1]
	25
squares[-3]
	[9, 16, 25]
```

- Concatenating a list 

```python 
squares = [1, 4, 9, 16, 25]
squares + [36, 49, 64, 81, 100]
	[1, 4, 9, 16, 25, 26, 49, 64, 81, 100]
```

> [!TIP]
> Lists are **mutable** unlike strings. 
> This means that it is possible to change their content. 

```python 
cubes = [1, 8, 27, 65, 125]
4 ** 3 
	64 # 4 cubed is 64 not 65 
cubes[3] = 64 # Replace the wrong value 
cubes 
	[1, 8, 27, 64, 125]
```

> [!TIP]
> New items can be added to the list by using the built in `.append()` function

- Example

```python
cubes = [1, 8, 27, 64, 125]
cubes.append(216)
cubes 
	[1, 8, 27, 64, 125, 216]
cubes.append(7 ** 3)
cubes 
	[1, 8, 27, 64, 125, 216, 343]
```

> [!IMPORTANT]
> **Simple Assignment** in Python never copies data. When assigning a list to a variables, the variable refers to the *existing* list. If there are changes to the list through one variable, the change will be made throughout the list 

- Example 

```python 
rgb = ["Red", "Green", "Blue"]
rgba = rgb 
id(rgb) == id(rgba) # Reference the same object 
	True 
rgba.append("Alph") 
rgb
	["Red", "Green", "Blue", "Alph"]
```

- All slice operations return a new list containing the requested elements.
	- This means that the following slice returns a shallow copy of the list 

```python 
rgba = ["Red", "Green", "Blue", "Alph"]
correct_rgba = rgba[:]
correct_rgab[-1] = "Alpha"
correct_rgba
	["Red", "Green", "Blue", "Alpha"]
rgba
	["Red", "Green", "Blue", "Alph"]
```

- Assignment to slices is also possible
	- This can
		- Change the size of the list 
		- Clear the list entirely 

```python 
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
letters 
	['a', 'b', 'c', 'd', 'e', 'f', 'g']
letters[2:5] = ['C', 'D', 'E'] # Change / modify the list 
letters 
	['a', 'b', 'C', 'D', 'E', 'f', 'g']
letters[2:5] = [] # Remove the newly added letters 
letters
	['a', 'b', 'f', 'g']
letters[:] = [] # Replace the all the elements of the lsit with an empty list  
letters 
	[]
```

> [!TIP]
> Lists also make use of the `.len()` function 

```python 
letters = ['a', 'b', 'c', 'd']
len(letters)
	4
```

> [!TIP]
> It is possible to nest lists (create a list within a list)

```python 
a = ['a', 'b', 'c']
n = [1, 2, 3]
x = [a, n]
	[['a', 'b', 'c'], [1, 2, 3]]
x[0]
	['a', 'b', 'c']
x[0][1]
'b'
```

--- 

## Begin Programming 

- Fibonacci Sequence 

```python 
a, b = 0, 1 # Multiple assignment
while a < 10: 
	print(a)
	a, b = b, a + b # Multiple assignment 
0
1
2
3
4
5
6
7
8
```

- The first line containing **multiple assignment** 
	- The variables `a` and `b` simultaneously get the new values 0 and 1 
		- On the list line it is used again

--- 

# Flow Control 

--- 

## `if` Statements 

```python 
x = int(input("Enter an integer: "))
	Enter an integer: 23
if x < 0: 
	x = 0 
	print('Negative value changed to 0')
elif x == 0: # Elif means 'else if' 
	print('Zero')
elif x == 1: 
	print('Single')
else: 
	print('More') 

# Output 
More 
```

---
## `for` Statements 

- The `for` statement in Python iterates over the items of any sequence (a list or a string), in the order that they appear in the sequence.

```python 
words = ['dog', 'door', 'something']
for w in words: 
print(w, len(w))

cat 3 
door 4
something 9
```

---
## Using `if` and `for`


```python 
users = {'Jeaneth': 'active', 'Peru': 'active', 'UK': 'inactive'}

for user, status in users.copy().items(): 
	if status == 'inactive': 
		del users[user]

active_users = {}
for user, status in user.items():
	if status = 'active': 
		active_users[user] = status
```

--- 
## The `range()` function

```python 
for i in range(5): 
	print(i) 

0
1
2
3
4
```

```python 
list(range(5, 10)) 
	[5, 6, 7, 8, 9]

list(range(0, 10, 3))
	[0, 3, 6, 9]

list(range(-10, -100, -30))
	[-10, -40, -70]
```

```python 
a = ['Mary', 'had', 'a', 'little', 'lamb']

for i in range(len(a)): 
	print(i, a[i])

0 Mary 
1 had 
2 a
3 little 
4 lamb
```

```python 
range(10)
	range(0, 10)
```

```python 
sum(range(4)) # 0 + 1 + 2 + 3 
	6 
```

--- 
## `break` and `continue` Statements 

- The `break` statement breaks out of the innermost enclosing **for** or **while** loop

```python 
for n in range(2, 10): 
	for x in range(2, n): 
		if x % x == 0: 
			print(f"{n} equals {x} * {n//x}")
			break

4 equals 2 * 2
6 equals 2 * 3
8 equals 2 * 4
9 equals 3 * 3
```

- The `continue` statement continues with the next iteration of the loop 

```python 
for num in range(2, 10): 
	if num % 2 == 9: 
		print(f"Foudn an even number {num}") 
		continue 
	print(f"Found an odd number {num}")

Found an even number 2 
Found an odd number 3 
Foudn an even number 4 
Found an odd number 5 
Found an even number 6 
Found an odd number 7 
Found an even number 8
Found an odd number 9 
```

--- 

## `else` Clauses on Loops 

```python
for n in range(2, 10): 
	for x in range(2, n): 
		if n % x == 0: 
			print(n, "equals", x, "*", n//x)
			break 
	else: 
		print(n, "is a prime number")

2 is a prime number 
3 is a prime number 
4 equals 2 * 2 
5 is a prime number 
6 equals 2 * 3 
7 is a prime number 
8 equals 2 * 4
9 equals 3 * 3 
```

