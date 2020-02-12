import Model from "./Model";
import Good from "./Good";
import Provider from "./Provider";

export default class Contract extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.good = new Good(json.good);
        this.provider = new Provider(json.provider);
        this.name = json.name;
        this.total_weight = json.total_weight;
        this.is_confirmed = json.is_confirmed;
        this.date = json.date;
    }

    toString = () => {
        return this.name;
    }
}