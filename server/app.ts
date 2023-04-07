import { Application } from "https://deno.land/x/oak@v12.1.0/mod.ts";
import { router } from "./routes/routes.ts";

const app: Application = new Application({ logErrors: false });

app.use(router.routes());
app.use(router.allowedMethods());

await app.listen({ port: 8000 });
