import Model from "./Model";
import User from "./User";
import Elevator from "./Elevator";
import strings from "../../strings";

export default class ElevatorWorker extends Model {
    constructor(json) {
        super(json);
        this.user = new User(json.user);
        this.elevator = new Elevator(json.elevator);
    }

    toString = () => {
        return this.user + " " + strings["from"] + " " + this.elevator;
    }
}