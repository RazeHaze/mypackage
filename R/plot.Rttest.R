
#' plot.Rttest
#'
#' @description
#'  Defines the plot method for the Rttest class. Use only with output from
#'  myttest. Plots two plots for unpaired data, and one plot for paired data.
#'
#' @param x The output from myttest
#' @param ... Additional parameters to make plot generic happy
#'
#' @return returns boxplots of myttest's output list;
#'          side by side boxplots for unpaired data, or a single boxplot of the
#'          difference in x and y for paired data, includes confidence interval.
#'
#'
#'
#' @import ggplot2
#' @import purrr
#' @import reshape2
#'
#' @method plot Rttest
#'
#' @export
#'
#' @examples set.seed(20); plot(myttest(rnorm(30,5,2), rnorm(30,3,2), .05, FALSE))
  plot.Rttest = function(x, ...) {
    obj = x.data.frame.df.x...x.data.frame.df.y = variable = value = 0

### creates plots for paired tests
    if (x$test_type == "Paired") {
      #uses purrr map to round the CI list
      mapped = purrr::map(x[2], function(CI) round(CI,3))
      CI.list = c(as.character(mapped[[1]][1]), as.character(mapped[[1]][2]))
      confidence.interval.print = paste(CI.list, collapse = ", ")

      #creates a single plot of the difference of x and y
      paired_df = data.frame(x$data.frame$df.x - x$data.frame$df.y)

      plot = ggplot(paired_df, aes(y = x.data.frame.df.x...x.data.frame.df.y)) +
              geom_boxplot() +
              labs(x = "Difference of samples x and y", y = "values") +
              annotate("text", x = 0, y = 5, label = confidence.interval.print[1])
    }
### creates plots for unpaired tests
    else {
      long_df = reshape2::melt(x$data.frame) #uses reshape2's melt to create side by side plots

      plot = ggplot(long_df, aes(x = variable, y = value)) +
              geom_boxplot() +
              labs(x = "Samples x and y")
    }

    plot #outputs the plot
    }





