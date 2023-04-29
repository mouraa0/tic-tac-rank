import { GameRoomConnectionHandlerParams } from "../../../interfaces/interfaces.ts";

export const gameConnectionHandler = (
  { socket, userId, roomData }: GameRoomConnectionHandlerParams,
): void => {
  if (userId === roomData.player1Id) {
    roomData.isPlayer1Connected = true;
    roomData.player1Socket = socket;

    if (roomData.isPlayer2Connected) {
      roomData.player2Socket?.send(
        JSON.stringify({
          msg: "All players connected",
          status: 4003,
          player: "p2",
        }),
      );

      socket.send(
        JSON.stringify({
          msg: "All players connected",
          status: 4003,
          player: "p1",
        }),
      );
    }
  }

  if (userId === roomData.player2Id) {
    roomData.isPlayer2Connected = true;
    roomData.player2Socket = socket;

    if (roomData.isPlayer2Connected) {
      console.log("All players connected");
      roomData.player1Socket?.send(
        JSON.stringify({
          msg: "All players connected",
          status: 4003,
          player: "p1",
        }),
      );

      socket.send(
        JSON.stringify({
          msg: "All players connected",
          status: 4003,
          player: "p2",
        }),
      );
    }
  }

  roomData.socketsArr.push(socket);
};
