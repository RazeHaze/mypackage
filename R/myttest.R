#' myttest
#'
#' @description an example function for DSA 5041. Given two data sets,
#'  performs a ttest, either Student's, Welch, or Paired, depending on the data.
#'  Outputs a list of Rttest, use print.Rttest or plot.Rttest to display the
#'  output more cleanly.
#'
#'
#' @param x #first list of data
#' @param y #second list of data
#' @param alpha #alpha value for t.test
#' @param paired #use paired = TRUE for paired t.test, paired = FALSE for unpaired t.test
#'
#' @import stats
#'
#' @return returns a list of length 6: a data frame of x and y,
#'  a confidence interval of the t.test, the type of test used,
#'  p.value of the t.test, a rejection statement,
#'  and the alpha value used. Class is Rttest.
#'
#' @export
#'
#' @examples set.seed(21); myttest(x = rnorm(30,5,2), y = rnorm(30,3,2), alpha =.05, paired = FALSE)
myttest = function(x, y, alpha, paired) {

###Creates data frame from x and y
  df = data.frame(df.x = x, df.y = y)

### Determines which t.test to use
  varx = var(x)
  vary = var(y)

  #If test are paired, runs the paired t.test
  if (paired == TRUE) {
    test_type = "Paired"
    t.vals = t.test(x,y, paired = TRUE, conf.level = 1 - alpha)
  }

  #If variances of x and y are equal and unpaired, runs a student's t.test
  else if (varx == vary) {
    test_type = "Student's"
    t.vals = t.test(x,y, var.equal = TRUE, conf.level = 1 - alpha)
  }

  #If variances are not equal and unpaired, runs welch test
  else {
    test_type = "Welch"
    t.vals = t.test(x,y, var.equal = FALSE, conf.level = 1 - alpha)
  }

### Determines if null hypothesis rejected
  if (is.na(t.vals$p.value) == TRUE) {
    reject = "P-value is NaN, you might have an issue with your data."
  }
  else if(t.vals$p.value <= alpha) {
    reject = "T.test indicates that you should reject the Null."
  }
  else if (t.vals$p.value > alpha) {
    reject = "T.test indicates that you should *not* reject the Null."
  }

### Creates confidence interval
  CI = c(t.vals$conf.int[1],t.vals$conf.int[2])

### Creates P value
  p.val = t.vals$p.value

### Compiles everything into a list
  output_list = list(data.frame = df,
                     confidence.interval = CI,
                     test_type = test_type,
                     p.value = p.val,
                     reject = reject,
                     alpha = alpha)

### Sets custom class Rttest
  class(output_list) = "Rttest"

  output_list
}


