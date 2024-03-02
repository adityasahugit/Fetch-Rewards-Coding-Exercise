/*
Second: Write a query that directly answers a predetermined question from a business stakeholder

These SQL queries are based on the new structure of 4 tables 
df_user.json
df_brands.json
df_receipts.json
df_reward_receipts.json
*/


-- Question 1: What are the top 5 brands by receipts scanned for most recent month?

SELECT b.brand_id, b.name, COUNT(r.receipt_id) AS receipt_count
FROM receipt r
JOIN rewardReceipt rr ON r.receipt_id = rr.receipt_id
JOIN brands b ON rr.brandCode = b.brandCode
WHERE DATE_FORMAT(FROM_UNIXTIME(r.createDate/1000), '%Y-%m') = 'YYYY-MM'
GROUP BY b.brand_id
ORDER BY receipt_count DESC
LIMIT 5;



-- Question 3: When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT
    rewardsReceiptStatus,
    AVG(totalSpent) AS averageSpend
FROM receipt
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY rewardsReceiptStatus
ORDER BY averageSpend DESC;

-- averageSpend in descending order, so the status with the higher average spend comes first.



-- Question 4: When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT
    rewardsReceiptStatus,
    SUM(purchasedItemCount) AS totalItemsPurchased
FROM receipt
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY rewardsReceiptStatus
ORDER BY totalItemsPurchased DESC;

-- totalItemsPurchased in descending order, so the status with the higher total number of items purchased comes first.



-- Question 5: Which brand has the most spend among users who were created within the past 6 months?

SELECT b.name, SUM(r.totalSpent) AS totalSpend
FROM users u
JOIN receipt r ON u.user_id = r.userId
JOIN rewardReceipt rr ON r.receipt_id = rr.receipt_id
JOIN brands b ON rr.brandCode = b.brandCode
WHERE u.createdDate >= UNIX_TIMESTAMP(CURRENT_DATE - INTERVAL 6 MONTH) * 1000
GROUP BY b.name
ORDER BY totalSpend DESC
LIMIT 1;



-- Question 6: Which brand has the most transactions among users who were created within the past 6 months?

SELECT b.name, COUNT(DISTINCT r.receipt_id) AS transactionCount
FROM users u
JOIN receipt r ON u.user_id = r.userId
JOIN rewardReceipt rr ON r.receipt_id = rr.receipt_id
JOIN brands b ON rr.brandCode = b.brandCode
WHERE u.createdDate >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 6 MONTH) * 1000
GROUP BY b.name
ORDER BY transactionCount DESC
LIMIT 1;
