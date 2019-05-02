import "./main.css";
import stores from "../data/stores.json";
import { Elm } from "./Main.elm";
import registerServiceWorker from "./registerServiceWorker";

Elm.Main.init({
  node: document.getElementById("root"),
  flags: {
    stores
  }
});

registerServiceWorker();
