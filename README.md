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
1. Open a file under the R/ directory. Call it something with you name in it.
2. Create a random dataframe then a ggplot function to plot it 
```r
library(tidyverse)

df <- data.frame("a" = c(1,2,3,4),
                 "b" = c(1,1,2,2))
df %>% 
    ggplot(aes(x = a, y =b ))
    geom_point()
```


```