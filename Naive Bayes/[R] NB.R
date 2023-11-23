# Install and load necessary packages
install.packages(c("e1071", "tm", "slam", "caTools"))
library(e1071)
library(tm)
library(slam)
library(caTools)

# Read your CSV file
# Replace "your_dataset.csv" with the actual file path
data <- read.csv("C:\\Users\\Engineer\\Desktop\\GitHub\\ML-Lab\\Naive Bayes\\train.csv", stringsAsFactors = FALSE)

# Check the structure of your dataset
str(data)

# Text preprocessing
corpus <- Corpus(VectorSource(data$Title))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("en"))
corpus <- tm_map(corpus, stripWhitespace)

# Create a document-term matrix
dtm <- DocumentTermMatrix(corpus)

# Convert the document-term matrix to a matrix
dtm_matrix <- as.matrix(dtm)

# Bind the Category column to the matrix
dtm_matrix <- cbind(dtm_matrix, Category = data$Category)

# Split the dataset into training and testing sets
set.seed(123)
split_index <- sample.split(dtm_matrix$Category, SplitRatio = 0.8)
train_data <- subset(dtm_matrix, split_index == TRUE)
test_data <- subset(dtm_matrix, split_index == FALSE)

# Train a Naive Bayes classifier
nb_model <- naiveBayes(Category ~ ., data = train_data[, -ncol(train_data)])

# Make predictions on the test set
predictions <- predict(nb_model, newdata = test_data[, -ncol(test_data)])

# Evaluate the performance
conf_matrix <- table(predictions$class, test_data$Category)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
cat("Accuracy:", accuracy, "\n")
cat("\nConfusion Matrix:\n", conf_matrix, "\n")
