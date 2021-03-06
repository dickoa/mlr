#' @export
makeRLearner.cluster.FarthestFirst = function() {
  makeRLearnerCluster(
    cl = "cluster.FarthestFirst",
    package = "RWeka",
    par.set = makeParamSet(
      makeIntegerLearnerParam(id = "N", default = 2L, lower = 1L),
      makeIntegerLearnerParam(id = "S", default = 1L, lower = 1L)
    ),
    properties = c("numerics"),
    name = "FarthestFirst Clustering Algorithm",
    short.name = "farthestfirst"
  )
}

#' @export
trainLearner.cluster.FarthestFirst = function(.learner, .task, .subset, .weights = NULL,  ...) {
  ctrl = RWeka::Weka_control(...)
  RWeka::FarthestFirst(getTaskData(.task, .subset), control = ctrl)
}

#' @export
predictLearner.cluster.FarthestFirst = function(.learner, .model, .newdata, ...) {
  # RWeka returns cluster indices (i.e. starting from 0, which some tools don't like
  predict(.model$learner.model, .newdata, ...) + 1
}

