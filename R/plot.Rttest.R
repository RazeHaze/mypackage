
#' plot.Rttest
#'
#' @param x output of myttest function
#' @param ... additional parameters
#'
#' @return ggplot2 boxplot of the dataframe, differs depending on t.test used
#' @import ggplot2
#' @export
#'
#' @examples set.seed(20); plot(myttest(rnorm(30,5,2), rnorm(30,3,2), .05, FALSE))
plot.Rttest = function(x, ...) {
  ggplot(data = x$data.frame, aes(x = x$data.frame$df.x, y = x$data.frame$df.y)) +
    geom_boxplot()
}

