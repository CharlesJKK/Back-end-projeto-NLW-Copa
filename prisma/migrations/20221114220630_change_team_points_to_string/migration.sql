-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Guess" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstTeamPoints" TEXT NOT NULL,
    "secondTeamPoints" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gameId" TEXT NOT NULL,
    "partcipantId" TEXT NOT NULL,
    CONSTRAINT "Guess_partcipantId_fkey" FOREIGN KEY ("partcipantId") REFERENCES "Participant" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Guess_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Guess" ("createdAt", "firstTeamPoints", "gameId", "id", "partcipantId", "secondTeamPoints") SELECT "createdAt", "firstTeamPoints", "gameId", "id", "partcipantId", "secondTeamPoints" FROM "Guess";
DROP TABLE "Guess";
ALTER TABLE "new_Guess" RENAME TO "Guess";
CREATE UNIQUE INDEX "Guess_partcipantId_gameId_key" ON "Guess"("partcipantId", "gameId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
