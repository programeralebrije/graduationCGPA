## https://github.com/programeralebrije/graduationCGPA.git

#This is to predict college GPA holding TOEFL score constant and using university rating as a predictor.

## Testing Assumptions

### Normality - Need to examine both GPA and TOEFL score

plotNormalHistogram(graduate_admissions$CGPA)

graduate_admissions$CGPAsq <- graduate_admissions$CGPA * graduate_admissions$CGPA
plotNormalHistogram(graduate_admissions$CGPAsq)

plotNormalHistogram(graduate_admissions$`TOEFL Score`)
spec(graduate_admissions)

graduate_admissions$`TOEFL.ScoreSQ` <- graduate_admissions$`TOEFL Score`* graduate_admissions$`TOEFL Score`
plotNormalHistogram(graduate_admissions$`TOEFL.ScoreSQ`)

### Homogeneity of Variance

leveneTest(CGPAsq~`University Rating`, data=graduate_admissions)

# Results were not significant, so the assumption is met!

### Homogeneity of Regression Slopes

Homogeneity_RegrSlp = lm(CGPA~TOEFL.Score, data=graduate_admissions)
anova(Homogeneity_RegrSlp)

# This isn't met, but I'll proceed anyway for learning purposes. In the real world, I would use this as an IV!

### Sample size is met - need 20 per IV or CV and I have 2, so need at least 40 and there are 400 cases!

## Running the Analysis

ANCOVA = lm(CGPA~TOEFL.Score + University.Rating*TOEFL.Score, data=graduate_admissions)
anova(ANCOVA)

# Significant interaction between TOEFL score and University Rating, but there is a significant impact on university rating and on TOEFL score by itself.

## Post Hocs

postHocs <- glht(ANCOVA,linfct=mcp(University.Rating = "Tukey"))
summary(postHocs)

# After examining the post hocs, it looks like the overall significance in the F test above was just an artifact of Type I error, since no group significantly differs from any other group.

## Examine Adjusted Means

adjMeans <- effect("University.Rating", ANCOVA)
adjMeans

# Looking at the means confirms my conclusion above - all of these have a college GPA that is about the same.

