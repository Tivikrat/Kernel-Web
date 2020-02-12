import Model from "./Model";
import User from "./User";

export default class Provider extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.user = new User(json.user);
        this.name = json.name;
        this.is_confirmed = json.is_confirmed;
    }

    toString() {
        return this.name;
    }
}