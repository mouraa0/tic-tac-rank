import { Application, Router } from "https://deno.land/x/oak@v12.1.0/mod.ts";
import { randomNumber } from "https://deno.land/x/random_number@2.0.0/mod.ts";

const app: Application = new Application({ logErrors: false });
const router: Router = new Router();

const gameRoomsArr: GameRoom[] = [];

const waitingRoomsArr: WaitingRoom[] = [];

router.get("/", (ctx) => {
  return ctx.response.body = "Hello World!";
});

router.get("/matchmaking/:userId", (ctx) => {
  const userId: string = ctx.params.userId;

  const socket: WebSocket = ctx.upgrade();

  if (waitingRoomsArr.length !== 0) {
    const opponentWaitingRoom: WaitingRoom = waitingRoomsArr[0];

    waitingRoomsArr.splice(0, 1);

    gameRoomsArr.push({
      board: Array.from(
        { length: 3 },
        (_, i) => Array.from({ length: 3 }, (_, i) => ""),
      ),
      player1Id: opponentWaitingRoom.playerId,
      player1Socket: opponentWaitingRoom.playerSocket,
      player2Id: userId,
      player2Socket: socket,
      roomId: opponentWaitingRoom.roomId,
    });

    opponentWaitingRoom.playerSocket.send(
      `{roomId: ${opponentWaitingRoom.roomId}, status: 'Found match'}`,
    );

    socket.send(
      `{roomId: ${opponentWaitingRoom.roomId}, status: 'Found match'}`,
    );

    return;
  }

  const roomId = `${randomNumber({ max: 9, min: 0 })}${
    randomNumber({ max: 9, min: 0 })
  }`;

  const waitingRoom: WaitingRoom = {
    playerId: userId,
    roomId: roomId,
    playerSocket: socket,
  };

  waitingRoomsArr.push(waitingRoom);

  socket.send(`{status: In waiting room, roomId: ${roomId}}`);
});

app.use(router.routes());
app.use(router.allowedMethods());

console.log("here");

await app.listen({ port: 8000 });

interface WaitingRoom {
  playerId: string;
  roomId: string;
  playerSocket: WebSocket;
}

interface GameRoom {
  player1Id: string;
  player2Id: string;
  player1Socket: WebSocket;
  player2Socket: WebSocket;
  roomId: string;
  board: string[][];
}
