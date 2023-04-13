export const verifyIsGameEnded = (
  board: string[][],
): { ended: boolean; winner: string } => {
  for (let i = 0; i < 3; i++) {
    if (
      board[i][0] == board[i][1] &&
      board[i][1] == board[i][2] &&
      board[i][0].length != 0
    ) {
      return { ended: true, winner: board[i][0] };
    }
    if (
      board[0][i] == board[1][i] &&
      board[1][i] == board[2][i] &&
      board[0][i].length != 0
    ) {
      return { ended: true, winner: board[0][i] };
    }
  }
  if (
    board[0][0] == board[1][1] &&
    board[1][1] == board[2][2] &&
    board[0][0].length != 0
  ) {
    return { ended: true, winner: board[0][0] };
  }
  if (
    board[0][2] == board[1][1] &&
    board[1][1] == board[2][0] &&
    board[0][2].length != 0
  ) {
    return { ended: true, winner: board[0][2] };
  }

  const isEnded = !board.some((row) => row.some((cell) => cell === ""));
  return { ended: isEnded, winner: "" };
};
