-- Creating the Brands Table
CREATE TABLE brands (
    brand_id VARCHAR PRIMARY KEY,
    barcode BIGINT,
    category VARCHAR,
    categoryCode VARCHAR,
    name VARCHAR,
    topBrand FLOAT,
    brandCode VARCHAR,
    cpg_ref VARCHAR,
    cpg_id VARCHAR,
    FOREIGN KEY (brandCode) REFERENCES rewardReceipt(brandCode)
);

-- Creating the Users Table
CREATE TABLE users (
    user_id VARCHAR PRIMARY KEY,
    active BOOLEAN,
    createdDate BIGINT,
    lastLogin BIGINT,
    role VARCHAR,
    signUpSource VARCHAR,
    state VARCHAR
);

-- Creating the Receipt Table
CREATE TABLE receipt (
    receipt_id VARCHAR PRIMARY KEY,
    bonusPointsEarned FLOAT,
    bonusPointsEarnedReason VARCHAR,
    createDate BIGINT,
    dateScanned BIGINT,
    finishedDate BIGINT,
    modifyDate BIGINT,
    pointsAwardedDate BIGINT,
    pointsEarned FLOAT,
    purchaseDate BIGINT,
    purchasedItemCount FLOAT,
    rewardsReceiptStatus VARCHAR,
    totalSpent FLOAT,
    userId VARCHAR,
    FOREIGN KEY (userId) REFERENCES users(user_id)
);

-- Creating the RewardReceipt Table
CREATE TABLE rewardReceipt (
    reward_receipt_id INT PRIMARY KEY,
    barcode VARCHAR,
    description VARCHAR,
    finalPrice VARCHAR,
    itemPrice VARCHAR,
    needsFetchReview BOOLEAN,
    partnerItemId VARCHAR,
    preventTargetGapPoints BOOLEAN,
    quantityPurchased FLOAT,
    userFlaggedBarcode VARCHAR,
    userFlaggedNewItem BOOLEAN,
    userFlaggedPrice VARCHAR,
    userFlaggedQuantity FLOAT,
    receipt_id VARCHAR,
    needsFetchReviewReason VARCHAR,
    pointsNotAwardedReason VARCHAR,
    pointsPayerId VARCHAR,
    rewardsGroup VARCHAR,
    rewardsProductPartnerId VARCHAR,
    userFlaggedDescription VARCHAR,
    originalMetaBriteBarcode VARCHAR,
    originalMetaBriteDescription VARCHAR,
    brandCode VARCHAR,
    competitorRewardsGroup VARCHAR,
    discountedItemPrice VARCHAR,
    originalReceiptItemText VARCHAR,
    itemNumber VARCHAR,
    originalMetaBriteQuantityPurchased FLOAT,
    pointsEarned FLOAT,
    targetPrice VARCHAR,
    competitiveProduct BOOLEAN,
    originalFinalPrice VARCHAR,
    originalMetaBriteItemPrice VARCHAR,
    deleted BOOLEAN,
    priceAfterCoupon VARCHAR,
    metabriteCampaignId VARCHAR,
    FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id),
    FOREIGN KEY (brandCode) REFERENCES brands(brandCode)
);
