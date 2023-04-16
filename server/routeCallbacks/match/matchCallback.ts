import { RouterContext } from "https://deno.land/x/oak@v12.1.0/router.ts";
import { gameRoomsMap } from "../matchmaking/matchmakingCallback.ts";
import {
  GameRoom,
  GameRoomMessageReceived,
} from "../../interfaces/interfaces.ts";
import { gameConnectionHandler } from "./handler/matchHandler.ts";
import { verifyIsGameEnded } from "./functions/gameFunctions.ts";

export const matchCb = (ctx: RouterContext<"/match/:userId/:roomId">) => {
  const userId: string = ctx.params.userId;
  const roomId: string = ctx.params.roomId;

  const roomData: GameRoom = gameRoomsMap[roomId];

  const socket = ctx.upgrade();

  socket.onopen = () => {
    console.log("Game Room Connected");

    gameConnectionHandler({
      roomData: roomData,
      socket: socket,
      userId: userId,
    });
  };

  socket.onmessage = (event: MessageEvent) => {
    const data: GameRoomMessageReceived = JSON.parse(event.data);

    console.log(data.msg);

    if (data.msg === "Ready") {
      console.log(roomData.playerTurn);

      return socket.send(
        JSON.stringify({
          msg: "Game Live",
          status: 4003,
          board: roomData.board,
          player_turn: roomData.playerTurn,
        }),
      );
    }

    if (data.msg === "made_play") {
      roomData.playerTurn = roomData.playerTurn == "p1" ? "p2" : "p1";
      roomData.board = data.board;

      console.log(roomData.playerTurn);

      const answer = verifyIsGameEnded(roomData.board);

      if (answer.ended) {
        console.log(`before delete map: ${gameRoomsMap}`);
        console.log(`before delete item: ${gameRoomsMap[roomId]}`);

        delete gameRoomsMap[roomId];

        console.log(`after delete map: ${gameRoomsMap}`);
        console.log(`after delete item: ${gameRoomsMap[roomId]}`);

        return roomData.socketsArr.forEach((userSocket: WebSocket) =>
          userSocket.send(
            JSON.stringify({
              msg: "Game Ended",
              status: 4003,
              winner: answer.winner,
            }),
          )
        );
      }

      return roomData.socketsArr.forEach((userSocket: WebSocket) =>
        userSocket.send(
          JSON.stringify({
            msg: "Game Live",
            status: 4003,
            board: roomData.board,
            player_turn: roomData.playerTurn,
          }),
        )
      );
    }
  };
};
