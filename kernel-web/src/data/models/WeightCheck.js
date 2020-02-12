import Model from "./Model";
import Weighing from "./Weighing";

export default class WeightCheck extends Model{
    constructor(json) {
        super(json);
        this.id = json.id;
        this.weighing = new Weighing(json.weighing);
        this.net_weight = json.net_weight;
        this.gross_weight = json.gross_weight;
    }
}