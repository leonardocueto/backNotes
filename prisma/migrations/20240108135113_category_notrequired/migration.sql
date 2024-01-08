/*
  Warnings:

  - You are about to drop the column `CategoryId` on the `Note` table. All the data in the column will be lost.
  - You are about to drop the column `Note` on the `Note` table. All the data in the column will be lost.
  - You are about to alter the column `archive` on the `Note` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Boolean`.
  - Added the required column `note` to the `Note` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Note" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "note" TEXT NOT NULL,
    "categoryId" INTEGER,
    "archive" BOOLEAN NOT NULL,
    CONSTRAINT "Note_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Note" ("archive", "id") SELECT "archive", "id" FROM "Note";
DROP TABLE "Note";
ALTER TABLE "new_Note" RENAME TO "Note";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
