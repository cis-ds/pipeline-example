# Example of a reproducible pipeline

This is a toy example of a reproducible data pipeline, based on Jenny Bryan's example for [STAT 545A](http://stat545-ubc.github.io).

This shows how to create a small-but-automated analytical pipeline using a set of R scripts via `source()` AND using `rmarkdown::render()` on R Markdown files, *without* the help of RStudio's buttons.

Demonstration data: the number of words spoken by various characters in the Lord of the Rings trilogy, available here:

<https://github.com/jennybc/lotr>

Suggested workflows:

* Clone this repository
* Start a fresh RStudio session, make sure this repository is the working directory
* Run any scripts you like interactively
* Run any script you like at arm's length, via `source()` or RStudio Source button
* Run the entire project via the shell

    ``` bash
    Rscript runfile.R
    ```

* Note all the HTML and Markdown reports left behind by this pipeline!
  