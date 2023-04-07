export interface WaitingRoom {
  playerId: string;
  roomId: string;
  playerSocket: WebSocket;
}

export interface GameRoom {
  player1Id: string;
  player2Id: string;
  player1Socket: WebSocket;
  player2Socket: WebSocket;
  roomId: string;
  board: string[][];
}

export interface MatchmakingHandlerParams {
  socket: WebSocket;
  waitingRoomsArr: WaitingRoom[];
  gameRoomsArr: GameRoom[];
  userId: string;
}
