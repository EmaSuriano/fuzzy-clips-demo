# fuzzy-clips-demo

This a test project to help people to get started with [FuzzyCLIPS](https://github.com/rorchard/FuzzyCLIPS).

> I wrote [an article](https://emasuriano.com/blog/2024-07-31-install-fuzzy-clips/) in my Blog where I explain more in depth some concepts, I recommend taking a look :)

## How to use Fuzzy clips?

- Open FZ clips (binary already compiled from [official repo](https://github.com/rorchard/FuzzyCLIPS)):

```bash
$ ./fz_clips

FuzzyCLIPS V6.10d (10/22/2004)
FuzzyCLIPS>
```

- Load `deftemplate` and `defrule`:

```bash
FuzzyCLIPS> (load "rules.clp")

Defining deftemplate: Temperature
Defining deftemplate: Humidity
Defining deftemplate: FanSpeed
Defining defrule: cool-fan +j+j
Defining defrule: moderate-fan +j+j
Defining defrule: hot-humid-fan +j+j
TRUE
```

- Load `deffacts`:

```bash
FuzzyCLIPS> (load "facts.clp")

Defining deffacts: sample-facts
TRUE
```

- Reset to initial values:

```bash
FuzzyCLIPS> (reset)
```

- Show facts:

```bash
FuzzyCLIPS> (facts)

f-0     (initial-fact) CF 1.00
f-1     (Temperature ???) CF 1.00
        ( (25.0 0.0) (25.0 1.0) (25.0 0.0)  )

f-2     (Humidity ???) CF 1.00
        ( (40.0 0.0) (40.0 1.0) (40.0 0.0)  )

For a total of 3 facts.
```

- Run the step one by one:

```bash
FuzzyCLIPS> (run 1)
```

- Or you can run all together:

```bash
FuzzyCLIPS> (run)
```

- You can check the resulting facts:

```bash
FuzzyCLIPS> (facts)
f-0     (initial-fact) CF 1.00
f-1     (Temperature ???) CF 1.00
        ( (25.0 0.0) (25.0 1.0) (25.0 0.0)  )

f-2     (Humidity ???) CF 1.00
        ( (40.0 0.0) (40.0 1.0) (40.0 0.0)  )

f-3     (FanSpeed ???) CF 1.00
        ( (20.0 0.0) (35.0 0.5) (65.0 0.5) (80.0 0.0)  )

For a total of 4 facts.
```

- Plot fuzzy graph for fact:

```bash
FuzzyCLIPS> (plot-fuzzy-value t + 0 100 3)

Fuzzy Value: FanSpeed
Linguistic Value: ??? (+)

 1.00
 0.95
 0.90
 0.85
 0.80
 0.75
 0.70
 0.65
 0.60
 0.55
 0.50                  +++++++++++++++
 0.45                 +               +
 0.40                +                 +
 0.35               +                   +
 0.30
 0.25              +                     +
 0.20             +                       +
 0.15            +                         +
 0.10
 0.05           +                           +
 0.00+++++++++++                             +++++++++++
     |----|----|----|----|----|----|----|----|----|----|
    0.00     20.00     40.00     60.00     80.00    100.00

Universe of Discourse:  From   0.00  to  100.00
```

plot-fuzzy-value t + 0 40 1

- `+`: means the symbol to use for the graph
- `1 8`: is the range for the plot
- `4`: is the fact to show

- Defuzzify fact

```bash
FuzzyCLIPS> (moment-defuzzify 3)
50.0
```

## Add formatting and some basic syntax checking with VScode

Given that LISP shared some similarities with Clojure language in the way they define the paranthesis we can actually make use of many of the formatters out there!

Just installed any formatter extension and then open your `.clp` file. There run `Cmd+Shift+P` and select `Change Language Mode`. In the list look for Clojure and select it.

The icon of the file should have changed. Now open the menu again by running `Cmd+Shift+P` and select `Format Document`, there you should be able to select the new formatter you installed.

In that moment your code should get formatted to the configuration that you set it up to.

Besides formatting you also gain the perk of checking of the syntax is indeed correct, without the need of loading the program into FuzzyClips. Basically if the formatter fails, it means the syntax is wrong...
