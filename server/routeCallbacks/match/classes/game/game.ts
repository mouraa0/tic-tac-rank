import { GameRoom } from "../../../../interfaces/interfaces.ts";
import { gameRoomsMap } from "../../../matchmaking/matchmakingCallback.ts";
import { verifyIsGameEnded } from "../../functions/gameFunctions.ts";

export class Game {
  userId: string;
  roomData: GameRoom;
  userSocket: WebSocket;

  constructor({ userId, roomData, userSocket }: GameConstructorInterface) {
    this.userId = userId;
    this.roomData = roomData;
    this.userSocket = userSocket;
  }

  handleNewConnection = (): void => {
    this.verifyWhichUser();

    this.verifyBothUsersConnected();
  };

  handleNewPlay = (newBoard: string[][]): void => {
    this.roomData.playerTurn = this.roomData.playerTurn == "p1" ? "p2" : "p1";

    this.roomData.board = newBoard;

    const isGameEnded = this.verifyGameEnded(this.roomData.board);

    if (isGameEnded.ended) {
      this.handleGameEnded(isGameEnded.winner);
    }

    return this.sendBothPlayersSameMessage({
      msg: "Game Live",
      status: 4003,
      board: this.roomData.board,
      player_turn: this.roomData.playerTurn,
    });
  };

  private verifyGameEnded = (
    board: string[][],
  ): { ended: boolean; winner: string } => {
    return verifyIsGameEnded(board);
  };

  private handleGameEnded = (winner: string): void => {
    delete gameRoomsMap[this.roomData.roomId];

    return this.sendBothPlayersSameMessage({
      msg: "Game Ended",
      status: 4003,
      winner: winner,
      board: this.roomData.board,
    });
  };

  private verifyWhichUser = (): void => {
    if (this.userId === this.roomData.player1Id) {
      return this.setPlayer1Socket();
    }

    if (this.userId === this.roomData.player2Id) {
      return this.setPlayer2Socket();
    }

    // return this._handlerError({ status: 4171 });
  };

  private verifyBothUsersConnected = (): void => {
    if (this.roomData.isPlayer1Connected && this.roomData.isPlayer2Connected) {
      this.sendBothPlayersDifferentMessages({
        msgObjectP1: {
          msg: "All players connected",
          status: 4003,
          player: "p1",
        },
        msgObjectP2: {
          msg: "All players connected",
          status: 4003,
          player: "p2",
        },
      });
    }
  };

  private setPlayer1Socket = (): void => {
    this.roomData.isPlayer1Connected = true;
    this.roomData.player1Socket = this.userSocket;
    this.roomData.socketsArr.push(this.userSocket);
  };

  private setPlayer2Socket = (): void => {
    this.roomData.isPlayer2Connected = true;
    this.roomData.player2Socket = this.userSocket;
    this.roomData.socketsArr.push(this.userSocket);
  };

  sendBothPlayersSameMessage = (
    msgObject: { [key: string]: string | number | string[][] },
  ): void => {
    this.roomData.socketsArr.forEach((socket: WebSocket) =>
      socket.send(JSON.stringify(
        msgObject,
      ))
    );
  };

  sendMessageToUser = (
    msgObject: { [key: string]: string | number | string[][] },
  ): void => {
    this.userSocket.send(JSON.stringify(msgObject));
  };

  sendBothPlayersDifferentMessages = (
    { msgObjectP1, msgObjectP2 }: {
      msgObjectP1: { [key: string]: string | number };
      msgObjectP2: { [key: string]: string | number };
    },
  ) => {
    console.log(msgObjectP1);
    console.log(msgObjectP2);
    this.roomData.player1Socket?.send(JSON.stringify(msgObjectP1));
    this.roomData.player2Socket?.send(JSON.stringify(msgObjectP2));
  };
}

interface GameConstructorInterface {
  userId: string;
  roomData: GameRoom;
  userSocket: WebSocket;
}
