Welcome to the Code Book!

**Variables:**
1. test - contains the data of the X_test.txt provided 
2. testlabels - contains the labels of each entry in the X_test.txt
3. subjecttest - contains the subject IDs who did every entry in the test dataset
4. train - contains the data of the X_train.txt provided
5. trainlabels - contains the labels of each entry in the X_train.txt
6. subjecttrain - contains the subject IDs who did every entry in the train dataset
7. dataset - combined train and test dataset
8. cnames - feature name or column names of the dataset
9. m - indices of the columns having "mean" in their names
10. s - indices of the columns having "std" in their names
11. sub1 - temporary subset to get the columns referring to "mean"s
12. sub2 - temporary subset to get the columns referring to "std"s
13. finaldataset - combined dataset, result of combining sub1 and sub2
14. tidydataset - shows the averages of each column grouped by the subject Id and the labels

**Transformations Done**
- omitted Null values
- only considered columns referring to mean and std
- most transformations are done by subsetting and combining subsequest results through cbind() or rbind()
- tidydataset was created through dplyr package and grouping them by the 'Subject' and 'Label' and running mean() across each column.
