# factor_analysis_key_latent_variables_italian_cities
This repository contains the analysis and findings from a study aiming to identify the key latent variables that describe 92 Italian cities, using data sourced from Eurostat. The project leverages Factor Analysis, a statistical technique for identifying underlying patterns in multivariate data, to uncover the dimensions that shape urban characteristics.

📑 Project Overview

	•	Research Question: What are the key latent variables able to describe Italian cities?
	•	Dataset: Data on 96 Italian cities and 23 variables describing various factors such as population, housing, tourism, and employment.
	•	Approach:
	•	Data cleaning and preprocessing, including handling missing values and standardization.
	•	Factor analysis using different rotations (none, Varimax, Promax, Oblimin).
	•	Interpretation of latent variables based on their contributions to explaining city characteristics.

🚀 Features

	1.	Data Preprocessing:
	•	Converted dataset variables to numeric.
	•	Addressed missing values using linear interpolation.
	•	Reduced dimensionality by removing highly correlated variables.
	2.	Factor Analysis:
	•	Extracted four primary factors:
	1.	Socio-Economic Status and Tourism Activity.
	2.	Housing Characteristics.
	3.	Population and Employment.
	4.	Unemployment.
	•	Explored factor correlations to interpret relationships among urban dimensions.
	3.	Rotations:
	•	Evaluated models with no rotation, Varimax, Promax, and Oblimin.
	•	Selected Oblimin rotation for final interpretation due to its ability to represent correlated factors.
	4.	Insights:
	•	Socio-economic status and tourism activity are positively correlated with population and employment.
	•	High socio-economic status often correlates with smaller average house sizes in urban centers.

📊 Tools and Libraries Used

	•	Programming Language: R
	•	Key Libraries:
	•	psych: For factor analysis.
	•	GPArotation: For factor rotation techniques.
	•	tidyverse: For data manipulation and visualization.
	•	zoo: For handling missing data through interpolation.

📂 File Structure

	•	data/: Contains the cleaned and standardized dataset.
	•	scripts/: Includes R scripts for data preprocessing, factor analysis, and visualization.
	•	results/: Output files such as scree plots, factor loadings, and correlation matrices.
	•	docs/: Detailed documentation of methods and results.