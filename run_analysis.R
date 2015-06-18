

rm (list = rm())

#  [Step 1]  Read data 
test.subject <- read.table("./test/subject_test.txt")

test.x <- read.table("./test/X_test.txt", colClasses = rep("numeric", 561), comment.char = "")

test.y <- read.table("./test/y_test.txt")

train.subject <- read.table("./train/subject_train.txt")

train.x <- read.table("./train/X_train.txt", colClasses = rep("numeric", 561), comment.char = "")

train.y <- read.table("./train/y_train.txt")

feature.list <- read.table("./features.txt")

active.lables <- read.table("activity_labels.txt")

# [Step 2]  reshape  raw data

# Get index of mean and std
mean.index <- grep("mean()", fixed = TRUE, feature.list$V2)

std.index <- grep("std()", fixed = TRUE, feature.list$V2)

x.extract.col.index <- c(mean.index, std.index)

# Get title of mean and std columns
x.title <- feature.list$V2[x.extract.col.index]

# Extract useful column 
test.x <- test.x[, x.extract.col.index]
train.x <- train.x[, x.extract.col.index]

# Combind data to one data set
data.x <- rbind(train.x, test.x)
data.y <- rbind(train.y, test.y)
data.subject <- rbind(train.subject, test.subject)

# Set title
names(data.x) <- x.title
names(data.y) <- c("y")
names(data.subject) <- c("subject")

# merge to one dataset
joint.data <- data.frame(data.x, data.y, data.subject)

# change y to Readable factor
joint.data$y <- factor(joint.data$y, labels = active.lables$V2)

# [step 3].  Add a new variable

# Create a new factor variable indicate each for each activity and each subject
sub.y <- paste(as.character(joint.data$y) ,  as.character(joint.data$subject), sep = "_" )

# Split data frame by new factor
l <- split(joint.data, joint.data$sub.y, drop = TRUE)

# Get mean for each variable
table.split.by.y.subject <- sapply(l, function(x) sapply(x, mean))


# Wrtie to txt
write.table(table.split.by.y.subject, "result.txt", row.names = FALSE)









