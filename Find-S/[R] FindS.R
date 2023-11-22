find_s_algorithm <- function(data) {
  hypothesis <- data[1, ]
  for (i in 1:nrow(data)) {
    example <- data[i, ]
    if (example[length(example)] == 'Yes') {
      for (j in 1:length(hypothesis)) {
        if (example[j] != hypothesis[j]) {
          hypothesis[j] <- '?'
        }
      }
    }
  }
  return(hypothesis)
}

data <- matrix(c(
  'Sunny', 'Warm', 'Normal', 'Strong', 'Warm', 'Same', 'Yes',
  'Sunny', 'Warm', 'High', 'Strong', 'Warm', 'Same', 'Yes',
  'Rainy', 'Cold', 'High', 'Strong', 'Warm', 'Change', 'No',
  'Sunny', 'Warm', 'High', 'Strong', 'Cool', 'Change', 'Yes'
), ncol = 7, byrow = TRUE)

hypothesis <- find_s_algorithm(data)
print(hypothesis)
