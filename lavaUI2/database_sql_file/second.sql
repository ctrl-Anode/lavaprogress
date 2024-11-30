-- Table for User Information
CREATE TABLE `userstb` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mname` VARCHAR(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lname` VARCHAR(50) COLLATE utf8mb4_general_ci NOT NULL,
  `uname` VARCHAR(20) COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
  `contact` VARCHAR(15) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` ENUM('male', 'female', 'other') COLLATE utf8mb4_general_ci NOT NULL,
  `address` VARCHAR(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` VARCHAR(100) COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
  `password` VARCHAR(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email_token` VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table for Membership Information
CREATE TABLE `Memberships` (
  `MembershipID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `MembershipType` VARCHAR(50) NOT NULL,
  `MembershipPrice` DECIMAL(10, 2) NOT NULL,
  `MembershipInfo` TEXT DEFAULT NULL, 
  `DurationInMonths` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table for Terms and Conditions
CREATE TABLE `TermsAndConditions` (
  `TermID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `TermText` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table for User Memberships
CREATE TABLE `UserMemberships` (
  `UserMembershipID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id` INT NOT NULL,
  `MembershipID` INT NOT NULL,
  `StartDate` DATE NOT NULL,
  FOREIGN KEY (`id`) REFERENCES `userstb`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`MembershipID`) REFERENCES `Memberships`(`MembershipID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table for Classes
CREATE TABLE `Classes` (
  `ClassID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `ClassType` VARCHAR(50) NOT NULL,
  `Description` TEXT DEFAULT NULL,
  `DurationInMinutes` INT NOT NULL,
  `Price` DECIMAL(10, 2) NOT NULL,
  `GymInstructor` VARCHAR(100) NOT NULL,
  `Schedule` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table for Class Bookings
CREATE TABLE `ClassBookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id` INT NOT NULL,
  `ClassID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`id`) REFERENCES `userstb`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`ClassID`) REFERENCES `Classes`(`ClassID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
