import ElevatorWorker from "./ElevatorWorker";

export default class LaboratoryAssistant extends ElevatorWorker {
    constructor(json) {
        super(json);
        this.id = json.id;
    }
}
