
#' print.Rttest
#' defines the print method for the Rttest class
#'
#' @param list #the output of the myttest function
#'
#'
#' @return returns a list of length 6: kable table of x and y
#' a confidence interval of the t.test, the type of test used,
#' p.value of the t.test, a rejection statement,
#' and the alpha value used.
#' @import kableExtra
#'
#' @export
#'
#' @examples set.seed(20); print(myttest(rnorm(30,5,2), rnorm(30,3,2), .05, FALSE))
print.Rttest = function(list) {
  print_output = list(kable.table = kable(list$data.frame),
                      confidence.interval = list$confidence.interval,
                      test_type = list$test_type,
                      p.value = list$p.value,
                      alpha = list$alpha,
                      reject = list$reject)
  print_output
  UseMethod("print.Rttest")
}

