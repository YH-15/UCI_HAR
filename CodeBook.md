This is a codebook to illustrate variables used and the data cleaning process

## Read data
subject_test = read in from subject_test.txt
subject_train = read in from subject_train.txt
x_test = read in from X_test.txt
x_train = read in from X_train.txt
y_test = read in from Y_test.txt
y_train = read in from Y_train.txt

features = read in from features.txt
labels = read in from activity_labels.txt

## Merge
subject_test & subject_train are merged to get subject
x_test & x_train are merged to get x
y_test & y_train are merged to get y

subject: 10299 rows of subjects, numbered from 1 to 30
x: 561 features of these 10299-row subjects
y: 10299 rows of activity labels, numbered from 1 to 6

## Clean
criteria = a logical vector of length 561, indicates if ith feature is a mean()/std()
filter x using criteria , and we get a new x
x = all the mean()/std() features of these 10299-row subjects, in total, there are 79 columns

## Desciption
rename rows and columns accordingly, using labels and features

## An independent tidy dataset
NewData = a summary for each activity label and subject
New_data.csv = a new file created to store the cleaned dataset
