import { RouterContext } from "https://deno.land/x/oak@v12.1.0/router.ts";
import { gameRoomsMap } from "../matchmaking/matchmakingCallback.ts";
import {
  GameRoom,
  GameRoomMessageReceived,
} from "../../interfaces/interfaces.ts";
import { Game } from "./classes/game/game.ts";
import { handleNewGameMessage } from "./handler/message_handler.ts";

export const matchCb = (ctx: RouterContext<"/match/:userId/:roomId">) => {
  const userId: string = ctx.params.userId;
  const roomId: string = ctx.params.roomId;

  const roomData: GameRoom = gameRoomsMap[roomId];

  const socket = ctx.upgrade();

  const game = new Game({
    userId: userId,
    userSocket: socket,
    roomData: roomData,
  });

  socket.onopen = () => {
    console.log("Game Room Connected");

    game.handleNewConnection();
  };

  socket.onmessage = (event: MessageEvent) => {
    const data: GameRoomMessageReceived = JSON.parse(event.data);

    return handleNewGameMessage({ game: game, data: data });
  };
};
