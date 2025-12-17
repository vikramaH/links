You can use the `MODE` function combined with `COUNTIF` to achieve this. Here's a formula that will work:

## Option 1: Using MODE and COUNTIF

```excel
=IF(COUNTIF(A1:H1,MODE(A1:H1))>=4,1,0)
```

**How it works:**
- `MODE(A1:H1)` finds the most frequently occurring number in the range
- `COUNTIF(A1:H1,MODE(A1:H1))` counts how many times that mode appears
- `IF(...>=4,1,0)` returns 1 if the count is 4 or more, otherwise 0

## Option 2: More robust formula (handles cases with multiple modes)

If you want to check ALL values (not just the most common one):

```excel
=IF(MAX(COUNTIF(A1:H1,A1:H1))>=4,1,0)
```

**Important:** This is an **array formula**, so you need to press **Ctrl + Shift + Enter** instead of just Enter (in older Excel versions). In Excel 365/2021, just press Enter.

## Option 3: Without array formula

```excel
=IF(SUMPRODUCT(--(COUNTIF(A1:H1,A1:H1)>=4))>0,1,0)
```

## Example with your data:

If your values are in cells A1 through H1:
```
A1: 9, B1: 8, C1: 9, D1: 5, E1: 9, F1: 9, G1: 9, H1: 2
```
Any of the formulas above will return **1** because the number 9 appears 5 times.

**Note:** The first formula (Option 1) is usually sufficient for most cases. Place it in the cell where you want the result (e.g., I1).

**Adjust the range A1:H1 to match where your actual data is located.**
