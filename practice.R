library(argparse)

parser <- ArgumentParser()

# specify our desired options 
# by default ArgumentParser will add an help option 
parser$add_argument("--alpha", type = "double")
parser$add_argument("--beta", type = "double")
argv <- parser$parse_args()

plot_beta <- function(alpha, beta) {
    print(alpha * beta)
}
plot_beta(argv$alpha, argv$beta)