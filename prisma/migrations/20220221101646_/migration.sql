/*
  Warnings:

  - You are about to drop the `flollows` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "flollows";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "follows" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "user_follow" INTEGER,
    CONSTRAINT "follows_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "follows_user_follow_fkey" FOREIGN KEY ("user_follow") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
