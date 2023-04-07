import { RouterContext } from "https://deno.land/x/oak@v12.1.0/router.ts";
import { GameRoom, WaitingRoom } from "../interfaces/interfaces.ts";
import { matchmakingHandler } from "../handlers/matchmaking_handler.ts";

const gameRoomsArr: GameRoom[] = [];

const waitingRoomsArr: WaitingRoom[] = [];

export const matchmakingCb = (ctx: RouterContext<"/matchmaking/:userId">) => {
  const userId: string = ctx.params.userId;

  console.log(userId);

  const socket = ctx.upgrade();

  socket.onopen = () => {
    console.log("WebSocket connection established");
    socket.send("WebSocket connection established");

    matchmakingHandler({
      gameRoomsArr: gameRoomsArr,
      socket: socket,
      userId: userId,
      waitingRoomsArr: waitingRoomsArr,
    });
  };

  socket.onmessage = (event) => console.log(event);
};
