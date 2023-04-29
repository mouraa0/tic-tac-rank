import { GameRoomMessageReceived } from "../../../interfaces/interfaces.ts";
import { Game } from "../classes/game/game.ts";

export const handleNewGameMessage = ({ game, data }: args) => {
  switch (data.msg) {
    case "Ready":
      return game.sendMessageToUser({
        msg: "Game Live",
        status: 4003,
        board: game.roomData.board,
        player_turn: game.roomData.playerTurn,
      });

    case "made_play":
      return game.handleNewPlay(data.board);
  }
};

interface args {
  game: Game;
  data: GameRoomMessageReceived;
}
