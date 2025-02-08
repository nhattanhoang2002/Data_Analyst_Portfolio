library(dplyr)

# Tính tổng số đánh giá cho mỗi cuốn sách
total_reviews_per_book <- data %>%
  group_by(Name, Author) %>%
  summarise(Total_Reviews = sum(as.numeric(Reviews), na.rm = TRUE)) %>%
  ungroup()

# Sắp xếp dữ liệu theo tổng số đánh giá giảm dần
sorted_books <- total_reviews_per_book %>%
  arrange(desc(Total_Reviews))

# Lấy cuốn sách có nhiều đánh giá nhất
most_reviewed_book <- sorted_books[1, ]
print(most_reviewed_book)


# Hàm để cắt tên sách nếu quá dài
shorten_name <- function(name, max_length = 20) {
  if (nchar(name) > max_length) {
    paste0(substr(name, 1, max_length), "...")
  } else {
    name
  }
}

# Áp dụng hàm này lên cột Name
sorted_books$Short_Name <- sapply(sorted_books$Name, shorten_name, max_length = 20)
ggplot(sorted_books[1:10,], aes(x = reorder(Short_Name, -Total_Reviews), y = Total_Reviews, fill = Author)) +
  geom_col() +
  labs(title = "Top 10 Cuốn Sách Có Nhiều Đánh Giá Nhất",
       x = "Tên Sách",
       y = "Tổng Số Đánh Giá") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
