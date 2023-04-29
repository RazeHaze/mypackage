
#' shinyinit
#'  @description
#'  Starts an example shiny server in the browser. This is designed to show off
#'  some of the functionaltiy of the plot and print methods o
#'
#'
#' @return starts the shiny example for mypackage
#' @export
#'
#' @import shiny
#'
#' @examples
#' \dontrun{shinyinit()}
#'

shinyinit = function()
{
  shiny::runApp(system.file("shiny-1", package =
                            "mypackage"), launch.browser = TRUE)
}
