import Model from "./Model";

export default class Elevator extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.name = json.name;
        this.address = json.address;
    }

    toString = () => {
        return this.name;
    }
}