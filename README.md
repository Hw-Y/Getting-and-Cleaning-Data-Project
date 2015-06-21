# Getting-and-Cleaning-Data-Project
This is the project for Getting and Cleaning Data on coursera.
Open the run_analysis.R, and you will finally generate 3 .txt documents: 
Independent Data with Means, which is a table generated on step 5. 
Merged Data generated on step 1, and Merged Data with Measurements on Means and Std based on requirements of step 3.

Firstly, I column-combined the Subject_test.txt, X_test and y_test to get testing data, and the training data
was generated in the same way as above. Then I row-combined the traning and testing data to get the Merged Data. 
After extracting columns with measurements on means and std, I got Merged Data with Measurements on Means and Std. Using cast() command, the mean values of each variable for each activity of every person were caculated, generating the Independent Data with Means. 
