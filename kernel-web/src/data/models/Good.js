import Model from "./Model";

export default class Good extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.name = json.name;
    }

    toString() {
        return this.name;
    }
}
