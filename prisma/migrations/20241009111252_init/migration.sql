-- CreateTable
CREATE TABLE `admin` (
    `admin_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `role` ENUM('Super Admin', 'Moderator', 'Support') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `admin_name_key`(`name`),
    UNIQUE INDEX `admin_email_key`(`email`),
    PRIMARY KEY (`admin_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bookinginquiry` (
    `inquiry_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `inquiry_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `status` ENUM('Pending', 'Reviewed', 'Resolved') NULL DEFAULT 'Pending',
    `message` VARCHAR(191) NULL,

    INDEX `bookinginquiry_property_id_idx`(`property_id`),
    INDEX `bookinginquiry_tenant_id_idx`(`tenant_id`),
    PRIMARY KEY (`inquiry_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document` (
    `document_id` INTEGER NOT NULL AUTO_INCREMENT,
    `agreement_id` INTEGER NULL,
    `document_url` VARCHAR(191) NOT NULL,
    `uploaded_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `document_agreement_id_idx`(`agreement_id`),
    PRIMARY KEY (`document_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `favoriteproperties` (
    `favorite_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `favoriteproperties_property_id_idx`(`property_id`),
    INDEX `favoriteproperties_tenant_id_idx`(`tenant_id`),
    PRIMARY KEY (`favorite_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `landlord` (
    `landlord_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone_number` VARCHAR(191) NOT NULL,
    `business_name` VARCHAR(191) NULL,
    `profile_picture_url` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `landlord_email_key`(`email`),
    PRIMARY KEY (`landlord_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `location` (
    `location_id` INTEGER NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `region` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL,
    `latitude` DECIMAL(65, 30) NULL,
    `longitude` DECIMAL(65, 30) NULL,
    `postal_code` VARCHAR(191) NULL,

    PRIMARY KEY (`location_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `maintenancerequest` (
    `request_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `description` VARCHAR(191) NOT NULL,
    `status` ENUM('Pending', 'In Progress', 'Resolved') NULL DEFAULT 'Pending',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `resolved_at` DATETIME(3) NULL,

    INDEX `maintenancerequest_property_id_idx`(`property_id`),
    INDEX `maintenancerequest_tenant_id_idx`(`tenant_id`),
    PRIMARY KEY (`request_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification` (
    `notification_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `notification_type` ENUM('Alert', 'Reminder', 'Message') NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `sent_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `read_status` ENUM('Unread', 'Read') NULL DEFAULT 'Unread',

    INDEX `notification_user_id_idx`(`user_id`),
    PRIMARY KEY (`notification_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `payment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `agreement_id` INTEGER NULL,
    `amount` DECIMAL(65, 30) NOT NULL,
    `payment_date` DATETIME(3) NOT NULL,
    `payment_method` ENUM('Bank Transfer', 'Credit Card', 'Mobile Money', 'Cash') NOT NULL,
    `payment_status` ENUM('Pending', 'Completed', 'Failed') NULL DEFAULT 'Pending',

    INDEX `payment_agreement_id_idx`(`agreement_id`),
    PRIMARY KEY (`payment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `property` (
    `property_id` INTEGER NOT NULL AUTO_INCREMENT,
    `landlord_id` INTEGER NULL,
    `location_id` INTEGER NULL,
    `property_name` VARCHAR(191) NOT NULL,
    `property_type` ENUM('Apartment', 'House', 'Studio', 'Villa', 'Other') NOT NULL,
    `number_of_bedrooms` INTEGER NOT NULL,
    `number_of_bathrooms` INTEGER NOT NULL,
    `square_footage` DECIMAL(65, 30) NULL,
    `description` VARCHAR(191) NULL,
    `price_per_month` DECIMAL(65, 30) NOT NULL,
    `availability_status` ENUM('Available', 'Rented') NULL DEFAULT 'Available',
    `amenities` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `property_landlord_id_idx`(`landlord_id`),
    INDEX `property_location_id_idx`(`location_id`),
    PRIMARY KEY (`property_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `propertyimage` (
    `image_id` INTEGER NOT NULL AUTO_INCREMENT,
    `property_id` INTEGER NULL,
    `image_url` VARCHAR(191) NOT NULL,
    `uploaded_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `propertyimage_property_id_idx`(`property_id`),
    PRIMARY KEY (`image_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rentalagreement` (
    `agreement_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `landlord_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `monthly_rent` DECIMAL(65, 30) NOT NULL,
    `security_deposit` DECIMAL(65, 30) NULL,
    `status` ENUM('Active', 'Completed', 'Terminated') NULL DEFAULT 'Active',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `rentalagreement_landlord_id_idx`(`landlord_id`),
    INDEX `rentalagreement_property_id_idx`(`property_id`),
    INDEX `rentalagreement_tenant_id_idx`(`tenant_id`),
    PRIMARY KEY (`agreement_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review` (
    `review_id` INTEGER NOT NULL AUTO_INCREMENT,
    `tenant_id` INTEGER NULL,
    `property_id` INTEGER NULL,
    `rating` INTEGER NULL,
    `review_text` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `review_property_id_idx`(`property_id`),
    INDEX `review_tenant_id_idx`(`tenant_id`),
    PRIMARY KEY (`review_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tenant` (
    `tenant_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone_number` VARCHAR(191) NOT NULL,
    `date_of_birth` DATETIME(3) NULL,
    `gender` ENUM('Male', 'Female') NULL,
    `profile_image_url` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `tenant_email_key`(`email`),
    PRIMARY KEY (`tenant_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaction` (
    `transaction_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `transaction_type` ENUM('Payment', 'Refund', 'Fee') NOT NULL,
    `amount` DECIMAL(65, 30) NOT NULL,
    `transaction_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `transaction_status` ENUM('Pending', 'Completed', 'Failed') NULL DEFAULT 'Pending',

    INDEX `transaction_user_id_idx`(`user_id`),
    PRIMARY KEY (`transaction_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `bookinginquiry` ADD CONSTRAINT `bookinginquiry_tenant_id_fkey` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bookinginquiry` ADD CONSTRAINT `bookinginquiry_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `document` ADD CONSTRAINT `document_agreement_id_fkey` FOREIGN KEY (`agreement_id`) REFERENCES `rentalagreement`(`agreement_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `favoriteproperties` ADD CONSTRAINT `favoriteproperties_tenant_id_fkey` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `favoriteproperties` ADD CONSTRAINT `favoriteproperties_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `maintenancerequest` ADD CONSTRAINT `maintenancerequest_tenant_id_fkey` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `maintenancerequest` ADD CONSTRAINT `maintenancerequest_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notification` ADD CONSTRAINT `notification_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_agreement_id_fkey` FOREIGN KEY (`agreement_id`) REFERENCES `rentalagreement`(`agreement_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_landlord_id_fkey` FOREIGN KEY (`landlord_id`) REFERENCES `landlord`(`landlord_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `property` ADD CONSTRAINT `property_location_id_fkey` FOREIGN KEY (`location_id`) REFERENCES `location`(`location_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `propertyimage` ADD CONSTRAINT `propertyimage_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_tenant_id_fkey` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_landlord_id_fkey` FOREIGN KEY (`landlord_id`) REFERENCES `landlord`(`landlord_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rentalagreement` ADD CONSTRAINT `rentalagreement_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_tenant_id_fkey` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_property_id_fkey` FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaction` ADD CONSTRAINT `transaction_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `tenant`(`tenant_id`) ON DELETE SET NULL ON UPDATE CASCADE;
