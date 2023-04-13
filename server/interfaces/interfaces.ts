export interface WaitingRoom {
  playerId: string;
  roomId: string;
  playerSocket: WebSocket;
}

export interface GameRoom {
  player1Id: string;
  player2Id: string;
  socketsArr: WebSocket[];
  isPlayer1Connected: boolean;
  isPlayer2Connected: boolean;
  player1Socket: WebSocket | null;
  player2Socket: WebSocket | null;
  roomId: string;
  board: string[][];
  playerTurn: string;
}

export interface GameRoomMap {
  [key: string]: GameRoom;
}

export interface MatchmakingHandlerParams {
  socket: WebSocket;
  waitingRoomsArr: WaitingRoom[];
  gameRoomsMap: GameRoomMap;
  userId: string;
}

export interface GameRoomConnectionHandlerParams {
  socket: WebSocket;
  userId: string;
  roomData: GameRoom;
}

export interface GameRoomMessageReceived {
  msg: string;
  board: string[][];
  status: number;
}
