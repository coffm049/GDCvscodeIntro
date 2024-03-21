# GDCvscodeIntro
An introduction to using VScode for GDC pipeline developers. Take any of the files you need to get started in you own workspace or use this as a template directory to get started with your projects.

In this tutorial we will build a simple R package to make a ggplot-ing function. Through this we will explore

- Installing reccomended VScode extensions
- My R development workflow 
    - including scripting and refactoring
- Version control with VScode
    - With gitlens visualization
- Establishing a remote connection to MSI


# Set up repo
Open VScode. Then select "clone git repo". Enter "https://github.com/coffm049/GDCvscodeIntro" for the repo address. This is equivalent to the following
```bash
git clone https://github.com/coffm049/GDCvscodeIntro
```

# Install reccomended VSCode extensions
Once in the working directory, VSCode will prompt you (on the left hand side) to install reccomended extensions. Extensions are ways of customizing VSCode to your particular workflow. In this case, I've configured this repo to reccomend the basic set of extensions I've found useful in my development workflows, feel free to remove any of the ones I reccomend and include others that I didn't.


# Version controlling
1. Open your terminal. Terminal > New Terminal
2. Open the version control icon on the left toolbar (looks like a "Y" with circular nodes). 
3. Click the three dots in the upper corner of the window that opens, click "Branch", then "Create branch...". Name your branch something with your name in it. This will automatically switch you to the new branch as well and is equivalent to  
```bash
git branch <branch-name>
git switch <branch-name>
```

## Starting your R package
1. Open another terminal. But this time, you should have the option to open an R terminal (because of the extensions we just installed)
2. Load devtools and usthis (or install them if you need)
3. Create the file structure for your R package calling "create_package" or "create_tidy_package" for more rigorous/opinionated setup.
```R
library(devtools)
library(usethis)
usethis::create_package(".")
```
NOTE: It is not standard to have a package within an already established repo so it will ask you if you are sure you want to create it and select "Yes". (usually you make the package then initiate the repo using "usethis::use_git()")

4. Make your first commit for this branch. Go to the Source control tool on the left, click the "+" beside files you want to include in commit. Write your commit message then commit and push. This is equivalent to 
```bash
git add <files>
git commit -m "commit message"
git push
```

## Adding first function to package
1. Open a file under the R/ directory. Call it something with you name in it. You can do it manually or use usethis::use_r("filename")
2. Create a random dataframe then a ggplot function to plot it 
```r
library(tidyverse)

df <- data.frame("a" = rnorm(100),
                 "b" = rgamma(100, 1))
df %>% 
    ggplot(aes(x = b)) +
    geom_histogram()
```

## making it behave like a function
Now that we have a working script, to treat it as a package, we need to make this a function, this is called "refactoring". With our extensions refactoring can be automated. Since R is a less common language, the refactoring is handled through copilot (as opposed to natively in RStudio). 
1. Highlight the code. Right click and select "refactor".
2. For copilot, tell it to "refactor as a function without any arguments" to generate the dataframe. And to refactor with b as an argument for the plotting function.
3. Autoformat the file. Right click anywhere in the file and click "reformat document". This doesn't change any of the logic just how easy it is to read the code.

Heres is what I ended up with
```R
create_df <- function() {
    df <- data.frame(
        "a" = rnorm(100),
        "b" = rgamma(100, 1)
    )
    return(df)
}



plot_histogram <- function(data, x) {
    data %>%
        ggplot2::ggplot(aes(x = {{ x }})) +
        ggplot2::geom_histogram()
}
```

Note the explicit namespaces, which is necessary for functions within a package. I additionally had some automatic documentation written up for the histogram function by highlighting it and invoking copilot. I told it to write ROxygen2 documentation for the function and it gave me

```R
#' Plot a histogram
#'
#' This function takes in a data frame and a variable name and plots a histogram of the variable.
#'
#' @param data The data frame containing the variable of interest.
#' @param x The name of the variable to be plotted.
#'
#' @return A histogram plot of the variable.
#'
#' @import ggplot2
#'
#' @examples
#' data <- data.frame(x = rnorm(100))
#' plot_histogram(data, x = "x")
#'
```


Let's commit these changes to our branch.