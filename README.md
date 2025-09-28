# Claims-Reserving-with-the-Chain-Ladder-Method-R

This project demonstrates a fundamental actuarial technique—claims reserving using the Chain-Ladder method. It is implemented in R using the industry-standard `ChainLadder` package.

## Objective

The goal is to analyze a claims development triangle to project the ultimate cost of claims and determine the Incurred But Not Reported (IBNR) reserve. This reserve is the amount of money an insurer must hold to pay for claims that have occurred but are not yet settled.

## Files in this Repository

- `chain_ladder_analysis.R`: The main R script that performs the entire analysis, from loading data to summarizing results and generating plots.
- `README.md`: This file, providing an overview and instructions.
- `.gitignore`: A standard R gitignore file to exclude unnecessary files from version control.
- `R_ChainLadder_Plots.png`: A PNG file that is **generated** by the script, containing visualizations of the data and model results.

## Prerequisites

- **R**: You must have R installed on your system. You can download it from the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/).
- **RStudio (Recommended)**: An integrated development environment (IDE) like RStudio makes working with R much easier.

## How to Run the Analysis

1.  **Open R or RStudio**.
2.  **Set the Working Directory**: Navigate to the `R_ChainLadder_Project` directory.
    ```R
    setwd("path/to/your/R_ChainLadder_Project")
    ```
3.  **Run the Script**: Execute the main script using the `source` command. The script will handle package installation automatically.
    ```R
    source("chain_ladder_analysis.R")
    ```

## Understanding the Output

When you run the script, you will see several outputs in the R console:

1.  **Original Claims Triangle**: The raw input data (`RAA` dataset).
2.  **Completed Claims Triangle**: The triangle with future claims projected by the model.
3.  **Chain-Ladder Model Summary**: A table showing the key results for each origin year:
    - `Ultimate`: The projected final cost of claims.
    - `Paid`: The amount of claims paid to date.
    - `IBNR`: The estimated reserve (Ultimate - Paid).
4.  **Total IBNR Estimate**: The final, total reserve required across all origin years.

Additionally, a file named `R_ChainLadder_Plots.png` will be saved in the project directory. It contains diagnostic plots that help you assess the model's fit and visualize the development patterns.

## Setting up a Git Repository

To manage this project with Git, follow these steps in your terminal or command line:

```bash
# Navigate to the project folder
cd path/to/your/R_ChainLadder_Project

# Initialize a new Git repository
git init

# Add all the files to staging
git add .

# Make your first commit
git commit -m "Initial commit: Set up Chain-Ladder analysis project"
```