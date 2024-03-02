# Fetch Rewards Coding Exercise - Analytics Engineer


This document provides an overview of the key steps undertaken in assessment, focusing on transforming unstructured JSON data into actionable insights through a structured relational data model.




## First: Review Existing Unstructured Data and Diagram a New Structured Relational Data Model

Please refer to [ER Diagram.png](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/ER_diagram.png)

- I have renamed the primary keys of all the 3 tables from _id to user_id, brand_id and receipt_id for respective tables in the new simplified structure of the database.

- I have create a new table **rewardReceipt** from the 'rewardsReceiptItemList' column of the receipt table. The rewardReceipt table tracks individual items within transactions that are eligible for rewards. It plays a critical role in connecting purchases with specific rewards criteria, allowing for the calculation and assignment of reward points or benefits to users based on their purchases. 

-  This new table has been assigned a new primary key as **'rewards_receipt_id'**given that 'brandCode' lacks uniqueness within this table. Additionally, the presence of multiple reward receipt items associated with a single 'receipt_id' precludes the creation of a composite unique key based on 'receipt_id'.

## Second: Write a query that directly answers a predetermined question from a business stakeholder

SQL queries can be found in the [sql](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/tree/main/sql) folder which has Query for creating table and answers based on **new structure** [here](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/sql/sql_queries.sql) 


## Third: Evaluate Data Quality Issues in the Data Provided

Detailed evaluation of the Data Quality Issues can be found inside the [data_quality](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/tree/main/data_quality) folder which contains Jupyter Notebook(Python scripts) for analysis of individual json.

Also new structured json files can be found inside the [new_data](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/tree/main/data_quality/new_data) folder

 - [brands_Analysis.ipynb](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/data_quality/brands_Analysis.ipynb)
 - [receipts_Analysis.ipynb](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/data_quality/receipts_Analysis.ipynb)
 - [users_Analysis.ipynb](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/data_quality/users_Analysis.ipynb)


## Fourth: Communicate with Stakeholders

Please refer [Email.pdf](https://github.com/adityasahugit/Fetch-Rewards-Coding-Exercise/blob/main/Email.pdf) for Product/Business leader, summarizing my findings, questions, and the additional information needed.

