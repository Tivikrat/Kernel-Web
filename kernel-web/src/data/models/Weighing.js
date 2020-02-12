import ElevatorWorker from "./ElevatorWorker";

export default class Weighing extends ElevatorWorker {
    constructor(json) {
        super(json);
        this.id = json.id;
    }
}
