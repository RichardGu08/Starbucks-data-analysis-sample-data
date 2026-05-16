# Starbucks Rewards Offer Analytics

---

# Overview

- Starbucks is exploring how different promotional offers can increase total sales revenue by targeting different customer groups.

- Data Sources:
  - Portfolio
  - Profile
  - Transcript

- All data for this project comes from https://www.kaggle.com/ihormuliar/starbucks-customer-data 

---

# Project Planning

## Business Question

How can Starbucks increase the total sales revenue by providing different offers to different customers

## Understand the Data Sets

### Portfolio Dataset
Contains metadata about offers:
- Offer ID
- Offer type (buy one get one -- discount -- informational)
- Reward given to customer for completing an offer
- Difficulty to complete the offer
- Duration of the offer
- Communication channels (email, web, mobile, social)

### Profile Dataset
Contains customer demographic information:
- ID
- Age (Starbucks is using ages ranged from 18-100; age = 118 shoud be unknown or Null values)
- Gender (male, female, other, null)
- Income
- Signup date

### Transcript Dataset
Contains customer activity events:
- Person
- Event (offer received -- offer viewed -- offer completed -- transaction)
- Value (offer id for offers received or viewed -- amount for transaction -- offer_id + reward for offers completed)
- Time passed since user signup

---

# Exploratory Data Analysis (EDA)

The following questions were explored during the analysis:

- What is the customer population and demographic distribution?

gender: 2175 Other (Unknown), 6129 F, 8484 M, 212 Other gender

- What is the average income of Starbucks customers?

2175 null values, 14825 non-null values; average income is $65404.991568

- What is the average age of Starbucks customers?

 2175 Unknown, 14825 with data, from which the average age is 54.3935

- What is the most common promotion type?

It seems all promotions have a count around 7600 offers sent.

- Who are the most loyal customers based on transcript activity?

Men, as well as customers with an income under $70000

- Which offers receive the highest completion rates?

The offer with id fafdcd668e3743c1bb461111dcafc2a4 has the highest daily completion rate on average. (A discount type offer sent to all 4 channels)

- How does offer difficulty impact customer completion behavior?

Interestingly, offers with a difficulty rating of 7 recieved the highest completion rate (namely 2298d6c36e964ae4a3e7e9706d1fb8c2, a discount type offer sent to all 4 channels)

- Which communication channels are most effective?

They are all similar, with web and social having a slightly higher completion rate.

---

# Data Cleaning / Preparation

Several preprocessing and transformation steps were performed:

- Cleaned invalid demographic values (age = 118,) and filled missing data ()
- Converted timestamps into analyzable date formats (from time since signup to date format)
- Flattened and extracted data from nested JSON fields (channel indicators and transcript values)
- Created new column (hours passed since last activity) derived from existing column (time since signup)
- Converted numerical fields into proper formats
- Built relationships between transcript, profile, and portfolio datasets

---

# Data Analysis

## Offer Funnel Analysis

The project analyzed customer progression through:
1. Offer Received
2. Offer Viewed
3. Offer Completed

This identified conversion drop-off points and offer effectiveness.

In Power BI, measures were created for displaying certain needed values: Average of completion per day; Completion rate;  Weighted interaction Score 

(I set Offer viewed = 1, Offer completed = 2, Transaction = 3, to better gauge customer's loyalty according to their actions, with transactions being the highest representation of their engagement with Starbucks)

---

## Offer Difficulty Analysis

Average difficulty was analyzed by offer ID to determine whether more difficult promotions reduce completion rates.

### Findings
- Moderate difficulty offers often performed best (difficulty 7)
- Very high difficulty offers showed lower completion efficiency
- Somehow, the offer '2298d6c36e964ae4a3e7e9706d1fb8c2' has low rewards (3) and high difficulty (7), but somehow holds the overwhelming record for highest completion rate at around 73%.   
Logically speaking, users should be preferring offers with high rewards and low difficulty, a better offer would be '9b98b8c7a33c4b65b9aebfe6a799e6d9', with reward 5 and difficulty 5, yet the completion rate is at 62%, more than 10% lower. We can only guess there is some unknown factor that caused this.
---

## Customer Demographic Analysis

The project explored:
- Age distribution
- Gender distribution
- Income segmentation
- Signups and trends over time

### Findings
- Certain demographic groups interacted more frequently with offers: 
The top users with the most weighted interactions are almost all men with an income below 70K. Overall, men make up 51% of interactions compared to women at around 37%. Age can vary largely, but most users are between 45 to 65 years old, so future advertisements and offers should be made with that in mind.

- Membership growth increased steadily over time
Possibly as an effect of Starbuck's aggressive marketing for their point based loyalty app, the number of users surged during July-August 2015.     
There is also a clear correlation between the revenue and the number of signups, as well as the average number of offers received per day, that can be seen on the timeline in Power BI's Time relation tab.

- Slightly higher engagement was observed among active mobile users


---

## Communication Channel Analysis

Offer engagement was compared across: 
- Email
- Mobile
- Social
- Web

### Findings
- Web channels showed the strongest interaction rates, but only by a small margin
- Mobile showed the worst performance; there is almost no difference when adding mobile. This could be cut out of the campaigns next time. 

---

# Dashboard Features

The Power BI dashboard includes:
- Interactive slicers
- Dynamic filters
- Bar charts
- Line charts
- Offer performance analysis
- Customer demographic insights
- Drilldown ordered by customers loyalty

---

# Challenges Encountered

Issues encountered included:
- Verifying data with timeline revenue trend
- Date format missing from transcripts; replaced by time (hours) instead
- Missing or unexplained demographic values
- Missing offer id for transactions
- Multiple offer interactions per customer

---

# Conclusion

This project demonstrates how customer behavioral data can be transformed into business insights using Power BI and analytical modeling techniques.

The analysis helps identify:
- Effective promotional strategies
- Customer engagement trends
- Effective communication channels
- Opportunities to optimize offer targeting and conversion rates

---

# Tools & Technologies

- Power BI
- DAX
- MySQL
- Data Modeling
- Data Ingestion

---

# Future Improvements

- Predictive modeling for offer completion
- Customer segmentation analysis
- Cross-checking with real Starbucks events
- Cohort retention analysis
- Regression and correlation analysis
