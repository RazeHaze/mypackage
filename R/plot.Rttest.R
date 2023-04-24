
#' plot.Rttest
#'
#' @param w output of myttest function
#' @param ... additional ggplot parameters if desired
#'
#' @return ggplot2 boxplot of the dataframe, differs depending on t.test used
#' @import ggplot2
#' @export
#'
#' @examples set.seed(20); plot(myttest(rnorm(30,5,2), rnorm(30,3,2), .05, FALSE))
plot.Rttest = function(w, ...) {
  ggplot(data = w$data.frame, aes(x = x.val, y = y.val)) +
    geom_boxplot() + ...
}

