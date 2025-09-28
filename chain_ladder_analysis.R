# Claims Reserving with the Chain-Ladder Method in R
# File: chain_ladder_analysis.R

# --- 1. SETUP ---
# This script automatically installs and loads the required 'ChainLadder' package.
if (!require("ChainLadder")) {
  install.packages("ChainLadder")
}
library(ChainLadder)

cat("---"Chain-Ladder Analysis Initialized ---"\n\n")

# --- 2. LOAD DATA ---
# The 'ChainLadder' package comes with sample datasets. We will use `RAA`,
# a classic example dataset from the Reinsurance Association of America.
cat("Step 1: Loading sample data (RAA dataset)\n")
data(RAA)

# Print the original claims development triangle.
# Rows represent origin years (when the policies were written).
# Columns represent development years (how many years have passed since the origin).
# Values are cumulative paid claims.
cat("Original Claims Development Triangle:\n")
print(RAA)
cat("\n")

# --- 3. VISUALIZE INITIAL DATA ---
# Plotting the raw data helps visualize the claims development patterns.
# This plot shows how claims for each origin year develop over time.
cat("Step 2: Generating and saving initial data plot to R_ChainLadder_Plots.png\n")
png("R_ChainLadder_Plots.png", width=1200, height=800)
plot(RAA, main="RAA Claims Development Patterns")


# --- 4. APPLY THE CHAIN-LADDER MODEL ---
# The core of the analysis. The `chainladder` function does the following:
#   1. Calculates age-to-age (ATA) development factors.
#   2. Selects the most appropriate factors (e.g., volume-weighted average).
#   3. Uses these factors to project the claims to their ultimate value.
cat("Step 3: Applying the Chain-Ladder model\n")
# By default, it uses a volume-weighted average of the factors.
cl_model <- chainladder(RAA)

# Print the completed triangle, with projected ultimate claims.
cat("Completed Claims Triangle (with Projections):\n")
print(cl_model)
cat("\n")


# --- 5. ANALYZE AND SUMMARIZE RESULTS ---
# The summary provides the key outputs for actuarial reserving.
cat("Step 4: Summarizing the results\n")
cl_summary <- summary(cl_model)

cat("Chain-Ladder Model Summary:\n")
print(cl_summary)
cat("\n")

# Explanation of Summary Columns:
# - Latest: The most recent diagonal of known claims (latest valuation).
# - Dev.To.Date: The development-to-date factor.
# - Ultimate: The projected total claims for each origin year.
# - IBNR: Incurred But Not Reported reserve. This is the key result.
#         It's calculated as Ultimate - Latest.

cat("----------------------------------------------------
")
cat(paste("Total IBNR (Reserve) Estimate: ", round(cl_summary$Totals["IBNR"], 2), "\n"))
cat("----------------------------------------------------
\n")


# --- 6. VISUALIZE MODEL FIT AND RESULTS ---
# The plot function for the model object provides useful diagnostic plots.
cat("Step 5: Generating and saving model diagnostic plots\n")
# This will add to the PNG file we already created.
par(mfrow=c(2,2)) # Arrange plots in a 2x2 grid
plot(cl_model, main="Chain-Ladder Model Diagnostics")
dev.off() # Close the PNG device and save the file

cat("\n--- Analysis Complete ---
")
cat("Plots have been saved to the file: R_ChainLadder_Plots.png\n")
