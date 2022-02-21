/*
  Warnings:

  - You are about to drop the column `user_follow` on the `follows` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `follows` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_follows" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "profile_id" INTEGER,
    "profile_follow" INTEGER,
    CONSTRAINT "follows_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "follows_profile_follow_fkey" FOREIGN KEY ("profile_follow") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_follows" ("id") SELECT "id" FROM "follows";
DROP TABLE "follows";
ALTER TABLE "new_follows" RENAME TO "follows";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
