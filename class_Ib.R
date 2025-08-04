dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")
getwd()
list.files("raw_data")
patient <- read.csv("raw_data/patient_info.csv")
View(patient)

#Checking the structure of the patient information dataset
str(patient)

#Identified variables with incorrect or inconsistent data types:
# 'gender': Character- should be a factor (categorical variable)
# 'diagnosis': Character- should be a factor (categorical variable)
# 'smoker': Character- should be converted to a binary numeric variable (1 = Yes, 0 = No)

#Converting gender and diagnosis variables to factors
patient$gender <- as.factor(patient$gender)

patient$diagnosis <- as.factor(patient$diagnosis)

#Checking updated data type
class(patient$gender)
class(patient$diagnosis)

#Converting Smoking Status to Binary Variable
patient$smoker_binary <- ifelse(patient$smoker == "Yes", 1, 0)

#Rechecking
summary(patient)

#Saving the clean datasheet
write.csv(patient, "clean_data/patient_info_clean.csv")

save.image(file = "Ishani_Class_Ib_Assignment.RData")

