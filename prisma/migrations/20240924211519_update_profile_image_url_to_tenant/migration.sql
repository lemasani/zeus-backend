/*
  Warnings:

  - You are about to drop the column `profile_picture_url` on the `tenant` table. All the data in the column will be lost.
  - The values [Other] on the enum `tenant_gender` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterTable
ALTER TABLE `tenant` DROP COLUMN `profile_picture_url`,
    ADD COLUMN `profile_image_url` VARCHAR(191) NULL,
    MODIFY `gender` ENUM('Male', 'Female') NULL;
