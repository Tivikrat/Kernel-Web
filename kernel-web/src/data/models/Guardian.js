import ElevatorWorker from "./ElevatorWorker";

export default class Guardian extends ElevatorWorker {
    constructor(json) {
        super(json);
        this.id = json.id;
    }
}
