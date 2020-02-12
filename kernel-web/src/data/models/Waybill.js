import Model from "./Model";
import Contract from "./Contract";
import Elevator from "./Elevator";
import WeightCheck from "./WeightCheck";
import LabAnalysis from "./LabAnalysis";
import Provider from "./Provider";

export default class Waybill extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.name = json.name;
        this.provider = new Provider(json.provider);
        this.elevator = new Elevator(json.elevator);
        this.to_elevator = json.to_elevator;
        this.date = json.date;
        // this.contract = new Contract(json.contract);
        // this.humidity = json.humidity;
        // this.clogging = json.clogging;
        // this.net_weight = json.net_weight;
        // this.gross_weight = json.gross_weight;
        // this.departure_time = json.departure_time;
        // this.arrival_time = json.arrival_time;
        this.weight_check = json.weight_check ? new WeightCheck(json.weight_check) : undefined;
        this.lab_analysis = json.lab_analysis ? new LabAnalysis(json.lab_analysis) : undefined;
    }

    toString() {
        return this.name;
    }
}
