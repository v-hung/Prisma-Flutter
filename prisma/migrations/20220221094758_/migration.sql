-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_flollows" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "user_follow" INTEGER,
    CONSTRAINT "flollows_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "flollows_user_follow_fkey" FOREIGN KEY ("user_follow") REFERENCES "profiles" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_flollows" ("id", "user_follow", "user_id") SELECT "id", "user_follow", "user_id" FROM "flollows";
DROP TABLE "flollows";
ALTER TABLE "new_flollows" RENAME TO "flollows";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
