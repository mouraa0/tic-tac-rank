import { MatchmakingHandlerParams, WaitingRoom } from "./interfaces.ts";
import { randomNumber } from "https://deno.land/x/random_number@2.0.0/mod.ts";

export const matchmakingHandler = (
  { socket, waitingRoomsArr, gameRoomsArr, userId }: MatchmakingHandlerParams,
): void => {
  if (waitingRoomsArr.length !== 0) {
    return joinFirstPossibleRoom({
      socket: socket,
      waitingRoomsArr: waitingRoomsArr,
      gameRoomsArr: gameRoomsArr,
      userId: userId,
    });
  }

  return createRoom({
    socket: socket,
    waitingRoomsArr: waitingRoomsArr,
    userId: userId,
    gameRoomsArr: gameRoomsArr,
  });
};

const joinFirstPossibleRoom = (
  { socket, waitingRoomsArr, gameRoomsArr, userId }: MatchmakingHandlerParams,
) => {
  const opponentWaitingRoom: WaitingRoom = waitingRoomsArr[0];

  waitingRoomsArr.shift();

  gameRoomsArr.push({
    board: Array.from(
      { length: 3 },
      (_, __) => Array.from({ length: 3 }, (_, __) => ""),
    ),
    player1Id: opponentWaitingRoom.playerId,
    player1Socket: opponentWaitingRoom.playerSocket,
    player2Id: userId,
    player2Socket: socket,
    roomId: opponentWaitingRoom.roomId,
  });

  opponentWaitingRoom.playerSocket.send(
    `{"room_id": "${opponentWaitingRoom.roomId}", "status": "Found match", "msg": "Found match"}`,
  );

  socket.send(
    `{"room_id": "${opponentWaitingRoom.roomId}", status: "Found match", "msg": "Found match"}`,
  );

  return socket.close();
};

const createRoom = (
  { socket, waitingRoomsArr, userId }: MatchmakingHandlerParams,
) => {
  const roomId = `${randomNumber({ max: 9, min: 0 })}${
    randomNumber({ max: 9, min: 0 })
  }`;

  const waitingRoom: WaitingRoom = {
    playerId: userId,
    roomId: roomId,
    playerSocket: socket,
  };

  waitingRoomsArr.push(waitingRoom);

  socket.send(
    JSON.stringify({
      msg: "In waiting room",
      room_id: roomId,
      status: "waiting",
    }),
  );
};
