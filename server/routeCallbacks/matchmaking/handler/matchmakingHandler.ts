import { randomNumber } from "https://deno.land/x/random_number@2.0.0/mod.ts";
import {
  MatchmakingHandlerParams,
  WaitingRoom,
} from "../../../interfaces/interfaces.ts";

export const matchmakingHandler = (
  { socket, waitingRoomsArr, gameRoomsMap, userId }: MatchmakingHandlerParams,
): void => {
  if (waitingRoomsArr.length !== 0) {
    return joinFirstPossibleRoom({
      socket: socket,
      waitingRoomsArr: waitingRoomsArr,
      gameRoomsMap: gameRoomsMap,
      userId: userId,
    });
  }

  return createRoom({
    socket: socket,
    waitingRoomsArr: waitingRoomsArr,
    userId: userId,
    gameRoomsMap: gameRoomsMap,
  });
};

const joinFirstPossibleRoom = (
  { socket, waitingRoomsArr, gameRoomsMap, userId }: MatchmakingHandlerParams,
) => {
  const opponentWaitingRoom: WaitingRoom = waitingRoomsArr.shift()!;

  gameRoomsMap[opponentWaitingRoom.roomId] = {
    board: Array.from(
      { length: 3 },
      (_, __) => Array.from({ length: 3 }, (_, __) => ""),
    ),
    socketsArr: [],
    player1Id: opponentWaitingRoom.playerId,
    isPlayer1Connected: false,
    player1Socket: null,
    player2Id: userId,
    isPlayer2Connected: false,
    player2Socket: null,
    roomId: opponentWaitingRoom.roomId,
    playerTurn: "p1",
  };

  opponentWaitingRoom.playerSocket.send(
    JSON.stringify({
      room_id: opponentWaitingRoom.roomId,
      status: 4003,
      msg: "Found match",
    }),
  );

  opponentWaitingRoom.playerSocket.close();

  socket.send(
    JSON.stringify({
      room_id: opponentWaitingRoom.roomId,
      status: 4003,
      msg: "Found match",
    }),
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
      status: 4003,
    }),
  );
};
