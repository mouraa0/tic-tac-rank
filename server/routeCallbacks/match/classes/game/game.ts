import { GameRoom } from "../../../../interfaces/interfaces.ts";

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
    this._verifyWhichUser();

    this._verifyBothUsersConnected();
  };

  _verifyWhichUser = (): void => {
    if (this.userId === this.roomData.player1Id) {
      return this._setPlayer1Socket();
    }

    if (this.userId === this.roomData.player2Id) {
      return this._setPlayer2Socket();
    }

    // return this._handlerError({ status: 4171 });
  };

  _verifyBothUsersConnected = (): void => {
    if (this.roomData.isPlayer1Connected && this.roomData.isPlayer2Connected) {
      this._sendBothPlayersDifferentMessages({
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

  _setPlayer1Socket = (): void => {
    this.roomData.isPlayer1Connected = true;
    this.roomData.player1Socket = this.userSocket;
    this.roomData.socketsArr.push(this.userSocket);
  };

  _setPlayer2Socket = (): void => {
    this.roomData.isPlayer2Connected = true;
    this.roomData.player2Socket = this.userSocket;
    this.roomData.socketsArr.push(this.userSocket);
  };

  _sendBothPlayersSameMessage = (msgObject: any): void => {
    this.roomData.socketsArr.forEach((socket: WebSocket) =>
      socket.send(JSON.stringify({
        msgObject,
      }))
    );
  };

  _sendBothPlayersDifferentMessages = (
    { msgObjectP1, msgObjectP2 }: { msgObjectP1: any; msgObjectP2: any },
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
