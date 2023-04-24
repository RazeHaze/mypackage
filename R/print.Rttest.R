
#' print.Rttest
#' defines the print method for the Rttest class
#'
#' @param x #the output of the myttest function
#' @param ... add. parameters
#'
#'
#' @return returns a list of length 6: kable table of x and y
#' a confidence interval of the t.test, the type of test used,
#' p.value of the t.test, a rejection statement,
#' and the alpha value used.
#' @import kableExtra
#' @method print Rttest
#' @export
#'
#' @examples set.seed(20); print(myttest(rnorm(30,5,2), rnorm(30,3,2), .05, FALSE))
print.Rttest = function(x, ...) {
  print_output = list(kable.table = kable(x$data.frame),
                      confidence.interval = x$confidence.interval,
                      test_type = x$test_type,
                      p.value = x$p.value,
                      alpha = x$alpha,
                      reject = x$reject)
  print_output
}

