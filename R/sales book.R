

data <- read.csv("D:/bestsellers with categories.csv")

head(data)

if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

ggplot(data, aes(x = Price)) +
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  ggtitle("Phân phối Giá Sách") +
  xlab("Giá") +
  ylab("Tần số")

ggplot(data, aes(x = Reviews)) +
  geom_histogram(bins = 30, fill = "green", color = "black") +
  ggtitle("Phân phối Số Lượng Đánh Giá") +
  xlab("Số Lượng Đánh Giá") +
  ylab("Tần số")

ggplot(data, aes(x = Price)) +
  geom_density(fill = "blue", alpha = 0.5) +
  ggtitle("Phân phối Mật độ của Giá Sách") +
  xlab("Giá") +
  ylab("Mật độ")

ggplot(data, aes(x = Reviews)) +
  geom_density(fill = "green", alpha = 0.5) +
  ggtitle("Phân phối Mật độ của Số Lượng Đánh Giá") +
  xlab("Số Lượng Đánh Giá") +
  ylab("Mật độ")


# Giá trị trung bình của đánh giá
mean_rating <- mean(data$User.Rating, na.rm = TRUE)

# Trung vị của đánh giá
median_rating <- median(data$User.Rating, na.rm = TRUE)

# Độ lệch chuẩn của đánh giá
sd_rating <- sd(data$User.Rating, na.rm = TRUE)

# Phạm vi của đánh giá
range_rating <- range(data$User.Rating, na.rm = TRUE)

# In kết quả
cat("Giá trị trung bình của đánh giá: ", mean_rating, "\n")
cat("Trung vị của đánh giá: ", median_rating, "\n")
cat("Độ lệch chuẩn của đánh giá: ", sd_rating, "\n")
cat("Phạm vi của đánh giá từ: ", range_rating[1], " đến ", range_rating[2], "\n")

library(ggplot2)

# Histogram của đánh giá người dùng
ggplot(data, aes(x = User.Rating)) +
  geom_histogram(bins = 20, fill = "blue", color = "black") +
  ggtitle("Phân phối Đánh Giá Người Dùng") +
  xlab("Đánh Giá") +
  ylab("Tần số")


