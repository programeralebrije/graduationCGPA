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


