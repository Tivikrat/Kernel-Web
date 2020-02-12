import Model from "./Model";
import LaboratoryAssistant from "./LaboratoryAssistant";

export default class LabAnalysis extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.lab_assistant = new LaboratoryAssistant(json.lab_assistant);
        this.humidity = json.humidity;
        this.clogging = json.clogging;
    }
}