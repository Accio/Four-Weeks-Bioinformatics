Day 2
===

We have got data from a series of experiments measuring how the fluorescent signal of active cascase-3 changes in response to the exposure of the cells to different doses of a cytotoxic drug in the units of mM. The data is saved in [values.txt](./values.txt).

Today's tasks:

1. Visualise the data with a scatter plot.
2. Transform the caspase activation signal with log2 transformation, and re-do the scatter plot.
3. Fit a linear model between the response and the variable. What's your conclusion?
4. Suppose following concentrations are tested: 5.55, 6.24, 7.11, 9.03 (mM), what are the expected caspase activation signal?
5. Try to find outliers in the model and remove them from the linear model fitting. How does the fitting change?
6. Try to use __MASS::rlm__ to fit the data without removing the outliers, and compare the results.