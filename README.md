# String-Calculator-using-lex-and-yacc

Using LEX and Yacc achieve the following tasks. This is similar to Calculator, except it is used with text
strings.
Text processor: Let op1 and op2 are operands whose values are text (contains alphanumeric
characters).

1. op1 * op2 is concatenation of the two operands.

2. op1~op2 is true if op1 is a prefix of op2 (Eg: abc ~ abcd has value true).

3. op1@op2 is true if op1 is a suffix of op2

4. op1#op2 is true if op1 is a substring of op2

5. op1 = op2 is true if both operands are equal.

6. op1 <> op2 is true if op1 is not equal to op2.

7. op1^numb, where numb is an nonnegative integer is, op1 contacentated to itself numb number of
times.

8. op1%numb is the prefix of op1 whose length is numb.

9. op1&numb is the suffix of op1 whose length is numb.

10.?op1 gives the length of op1.

Operations can be nested using braces ( ).

Precedence & associativity rules

Highest to lowest precedence, the operators are: (),?,^.*, %,&,~,@,#,=

Associativity is from left to right (except for ? and ^ which are right to left).
