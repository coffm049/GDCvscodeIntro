create_df <- function() {
    df <- data.frame(
        "a" = rnorm(100),
        "b" = rgamma(100, 1)
    )
    return(df)
}



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
plot_histogram <- function(data, x) {
    data %>%
        ggplot2::ggplot(aes(x = {{ x }})) +
        ggplot2::geom_histogram()
}
