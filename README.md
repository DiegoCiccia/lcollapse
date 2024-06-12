# lcollapse
Stata collapse but it keeps the labels.

## Setup

```stata
net install lcollapse, from("https://raw.githubusercontent.com/DiegoCiccia/lcollapse/main") replace
```

## Syntax

```stata
lcollapse anything [, options]
```

The syntax of collapse is supported in full.

## Example

```
qui sysuse auto, clear
lcollapse (max) price rep78 (min) weight , by(foreign)
```