-- CreateTable
CREATE TABLE "Notes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Note" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "archive" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Notes_Category_key" ON "Notes"("Category");
