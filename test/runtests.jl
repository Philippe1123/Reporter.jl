using LognormalDiffusionProblems, Reporter

folder = joinpath(dirname(pathof(Reporter)), "..", "reports")

# precompilation run
print("precompilation run... ")
estimator = init_lognormal(ML(), MC(), verbose = false, name = "precompile")
history = run(estimator, 1e-3)
println("done")

#
# MLMC
#
print("testing MLMC... ")
estimator = init_lognormal(ML(), MC(), verbose = false, name = "MLMC")
history = run(estimator, 1e-3)
report(history, joinpath(folder, split(history[:name], ".")[1]))
println("done")

#
# MLQMC
#
print("testing MLQMC... ")
estimator = init_lognormal(ML(), QMC(), verbose = false, name = "MLQMC")
history = run(estimator, 1e-3)
report(history, joinpath(folder, split(history[:name], ".")[1]))
println("done")

#
# TDMC
#
print("testing MIMC, TD... ")
estimator = init_lognormal(TD(2), MC(), verbose = false, name = "MIMC, TD")
history = run(estimator, 1e-3)
report(history, joinpath(folder, split(history[:name], ".")[1]))
println("done")

#
# ADMC
#
print("testing adaptive MIMC... ")
estimator = init_lognormal(AD(2), MC(), verbose = false, name = "adaptive MIMC")
history = run(estimator, 1e-3)
report(history, joinpath(folder, split(history[:name], ".")[1]))
println("done")
