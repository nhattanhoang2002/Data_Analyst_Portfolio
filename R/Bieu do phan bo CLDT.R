library(readxl)

if (!require(dplyr)) install.packages("dplyr")
library(dplyr)


library(tidyr)
library(ggplot2)

# Đọc dữ liệu từ sheet có tên là "CLDV", bắt đầu từ hàng 9
data <- read_excel("D:/#TÀI LIỆU/#_ CHUYÊN ĐỀ + KHÓA LUẬN/#0_SPSS_INPUT NEW_THUNGHIEM - Copy (doclapphanphoichuan).xlsx", 
                   sheet = "CLDV", 
                   range = cell_rows(9))

# Đặt lại tên cột vì tên cột bắt đầu từ hàng 9
names(data) <- c("CL1", "CL2", "CL3", "CL4", "CL5")

# Kiểm tra dữ liệu
head(data)


# Chuyển đổi dữ liệu sang dạng dài
data <- read_excel("D:/#TÀI LIỆU/#_ CHUYÊN ĐỀ + KHÓA LUẬN/#0_SPSS_INPUT NEW_THUNGHIEM - Copy (doclapphanphoichuan).xlsx", 
                   sheet = "CLDV", 
                   range = "A9:E1000")
names(data) <- c("CL1", "CL2", "CL3", "CL4", "CL5")
data_long <- pivot_longer(data, cols = c("CL1", "CL2", "CL3", "CL4", "CL5"), names_to = "Variable", values_to = "Value")



# Tính toán tần suất cho mỗi điểm đánh giá từ 1 đến 5
ratings <- data_long %>% 
  group_by(Variable, Value) %>% 
  summarise(Count = n(), .groups = 'drop') %>% 
  group_by(Value) %>%
  summarise(AvgCount = mean(Count))



# Vẽ biểu đồ đường với giới hạn trục y
ggplot(ratings, aes(x = Value, y = AvgCount)) +
  geom_line(group=1, color="blue") +
  labs(title = "CHẤT LƯỢNG DV KHÓA HỌC", x = "Điểm đánh giá", y = "Tần suất trung bình") +
  theme_minimal() +
  ylim(0, 200) +  # Giới hạn trục y từ 0 đến 200
  theme(plot.title = element_text(hjust = 0.5))




