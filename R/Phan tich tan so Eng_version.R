# Check if 'readxl' package is available, if not, install it
if (!require(readxl)) install.packages("readxl")
library(readxl)

# Load data from an Excel file
data <- read_excel("D:/#TÀI LIỆU/#_ CHUYÊN ĐỀ + KHÓA LUẬN/#0_SPSS_INPUT NEW_THUNGHIEM - Copy (doclapphanphoichuan).xlsx")

# Print the names of the columns in the dataset
print(names(data))

# Select the first four columns for analysis
selected_columns <- data[, 1:4]
# Generate summary statistics for the selected columns
summary(selected_columns)

# Check if 'ggplot2' package is available, if not, install it
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Prepare data and calculate percentage for the "Gender" column
data_counts <- data.frame(table(data$GIOITINH))
data_counts$perc <- round(data_counts$Freq / sum(data_counts$Freq) * 100, 1)

# Plot a pie chart for "Gender" with percentage labels
ggplot(data_counts, aes(x="", y=Freq, fill=Var1)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta="y") +
  geom_text(aes(label=paste(perc, "%")), position=position_stack(vjust=0.5)) +
  labs(title="Sample Structure by Gender", fill="Gender") +
  theme_minimal() +
  theme(axis.text.x=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        legend.position="bottom",
        plot.background=element_rect(fill="white"))

# Calculate percentage for "Current Level of Education"
data_counts_tdht <- data.frame(table(data$`TRINH DO HIEN TAI`))
data_counts_tdht$perc <- round(data_counts_tdht$Freq / sum(data_counts_tdht$Freq) * 100, 1)

# Plot a pie chart for "Current Level of Education" with percentage labels
ggplot(data_counts_tdht, aes(x="", y=Freq, fill=Var1)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta="y") +
  geom_text(aes(label=paste(perc, "%")), position=position_stack(vjust=0.5)) +
  labs(title="Distribution of Current Education Level",
       subtitle="Pie Chart Showing Percentage for Each Education Level",
       fill="Current Education Level") +
  theme_minimal() +
  theme(axis.text.x=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        legend.position="bottom",
        plot.background=element_rect(fill="white"))

# Calculate percentage for "Goal"
data_counts_mt <- data.frame(table(data$`MUC TIEU`))
data_counts_mt$perc <- round(data_counts_mt$Freq / sum(data_counts_mt$Freq) * 100, 1)

# Plot a pie chart for "Goal"
ggplot(data_counts_mt, aes(x="", y=Freq, fill=Var1)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta="y") +
  geom_text(aes(label=paste(perc, "%")), position=position_stack(vjust=0.5)) +
  labs(title="Distribution of Goals",
       subtitle="Pie Chart Showing Percentage for Each Goal",
       fill="Goal") +
  theme_minimal() +
  theme(axis.text.x=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        legend.position="bottom",
        plot.background=element_rect(fill="white"))

# Calculate percentage for "Information Source"
data_counts_bn <- data.frame(table(data$`BIET NHAT UY VIET THONG QUA`))
data_counts_bn$perc <- round(data_counts_bn$Freq / sum(data_counts_bn$Freq) * 100, 1)

# Plot a pie chart for "Information Source"
ggplot(data_counts_bn, aes(x="", y=Freq, fill=Var1)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta="y") +
  geom_text(aes(label=paste(perc, "%")), position=position_stack(vjust=0.5)) +
  labs(title="Distribution of Information Source",
       subtitle="Pie Chart Showing Percentage for Each Source",
       fill="Information Source") +
  theme_minimal() +
  theme(axis.text.x=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        legend.position="bottom",
        plot.background=element_rect(fill="white"))
