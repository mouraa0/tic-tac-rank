import { Router } from "https://deno.land/x/oak@v12.1.0/mod.ts";
import { matchmakingCb } from "./route_callbacks.ts";

export const router: Router = new Router();
router.get("/", (ctx) => {
  return ctx.response.body = "Hello World!";
});

router.get("/matchmaking/:userId", matchmakingCb);
