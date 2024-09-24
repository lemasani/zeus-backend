-- CreateTable
CREATE TABLE `admin` (
    `admin_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `role` ENUM('Super Admin', 'Moderator', 'Support') NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`admin_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bookinginquiry` (
    `inquiry_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `inquiry_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` ENUM('Pending', 'Reviewed', 'Resolved') NULL DEFAULT 'Pending',
    `message` TEXT NULL,

    INDEX `property_id`(`property_id`),
    INDEX `tenant_id`(`tenant_id`),
    PRIMARY KEY (`inquiry_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document` (
    `document_id` INTEGER NOT NULL AUTO_INCREMENT,
    `agreement_id` INTEGER NULL,
    `document_url` VARCHAR(255) NOT NULL,
    `uploaded_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `agreement_id`(`agreement_id`),
    PRIMARY KEY (`document_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `favoriteproperties` (
    `favorite_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `property_id`(`property_id`),
    INDEX `tenant_id`(`tenant_id`),
    PRIMARY KEY (`favorite_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `landlord` (
    `landlord_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    `business_name` VARCHAR(100) NULL,
    `profile_picture_url` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`landlord_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `location` (
    `location_id` INTEGER NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(255) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `region` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `latitude` DECIMAL(10, 8) NULL,
    `longitude` DECIMAL(11, 8) NULL,
    `postal_code` VARCHAR(20) NULL,

    PRIMARY KEY (`location_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `maintenancerequest` (
    `request_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `description` TEXT NOT NULL,
    `status` ENUM('Pending', 'In Progress', 'Resolved') NULL DEFAULT 'Pending',
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `resolved_at` TIMESTAMP(0) NULL,

    INDEX `property_id`(`property_id`),
    INDEX `tenant_id`(`tenant_id`),
    PRIMARY KEY (`request_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification` (
    `notification_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `notification_type` ENUM('Alert', 'Reminder', 'Message') NOT NULL,
    `message` TEXT NOT NULL,
    `sent_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `read_status` ENUM('Unread', 'Read') NULL DEFAULT 'Unread',

    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`notification_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `payment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `agreement_id` INTEGER NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `payment_date` DATE NOT NULL,
    `payment_method` ENUM('Bank Transfer', 'Credit Card', 'Mobile Money', 'Cash') NOT NULL,
    `payment_status` ENUM('Pending', 'Completed', 'Failed') NULL DEFAULT 'Pending',

    INDEX `agreement_id`(`agreement_id`),
    PRIMARY KEY (`payment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property` (
    `property_id` INTEGER NOT NULL AUTO_INCREMENT,
    `landlord_id` INTEGER NULL,
    `location_id` INTEGER NULL,
    `property_name` VARCHAR(100) NOT NULL,
    `property_type` ENUM('Apartment', 'House', 'Studio', 'Villa', 'Other') NOT NULL,
    `number_of_bedrooms` INTEGER NOT NULL,
    `number_of_bathrooms` INTEGER NOT NULL,
    `square_footage` DECIMAL(10, 2) NULL,
    `description` TEXT NULL,
    `price_per_month` DECIMAL(10, 2) NOT NULL,
    `availability_status` ENUM('Available', 'Rented') NULL DEFAULT 'Available',
    `amenities` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `landlord_id`(`landlord_id`),
    INDEX `location_id`(`location_id`),
    PRIMARY KEY (`property_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `propertyimage` (
    `image_id` INTEGER NOT NULL AUTO_INCREMENT,
    `property_id` INTEGER NULL,
    `image_url` VARCHAR(255) NOT NULL,
    `uploaded_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `property_id`(`property_id`),
    PRIMARY KEY (`image_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rentalagreement` (
    `agreement_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `landlord_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `monthly_rent` DECIMAL(10, 2) NOT NULL,
    `security_deposit` DECIMAL(10, 2) NULL,
    `status` ENUM('Active', 'Completed', 'Terminated') NULL DEFAULT 'Active',
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `landlord_id`(`landlord_id`),
    INDEX `property_id`(`property_id`),
    INDEX `tenant_id`(`tenant_id`),
    PRIMARY KEY (`agreement_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review` (
    `review_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `rating` INTEGER NULL,
    `review_text` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `property_id`(`property_id`),
    INDEX `tenant_id`(`tenant_id`),
    PRIMARY KEY (`review_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tenant` (
    `tenant_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    `date_of_birth` DATE NULL,
    `gender` ENUM('Male', 'Female', 'Other') NULL,
    `profile_picture_url` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`tenant_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaction` (
    `transaction_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `transaction_type` ENUM('Payment', 'Refund', 'Fee') NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `transaction_date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `transaction_status` ENUM('Pending', 'Completed', 'Failed') NULL DEFAULT 'Pending',

    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`transaction_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `bookinginquiry` ADD CONSTRAINT `bookinginquiry_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `bookinginquiry` ADD CONSTRAINT `bookinginquiry_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `document` ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`agreement_id`) REFERENCES `rentalagreement`(`agreement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `favoriteproperties` ADD CONSTRAINT `favoriteproperties_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `favoriteproperties` ADD CONSTRAINT `favoriteproperties_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `maintenancerequest` ADD CONSTRAINT `maintenancerequest_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `maintenancerequest` ADD CONSTRAINT `maintenancerequest_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notification` ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`agreement_id`) REFERENCES `rentalagreement`(`agreement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`landlord_id`) REFERENCES `landlord`(`landlord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `propertyimage` ADD CONSTRAINT `propertyimage_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_ibfk_2` FOREIGN KEY (`landlord_id`) REFERENCES `landlord`(`landlord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_ibfk_3` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaction` ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

