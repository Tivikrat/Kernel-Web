import Model from "./Model";

export default class User extends Model {
    constructor(json) {
        super(json);
        this.id = json.id;
        this.username = json.username;
        this.first_name = json.first_name;
        this.last_name = json.last_name;
        this.address = json.address;
        this.phone = json.phone;
        this.email = json.email;
        this.is_superuser = json.is_superuser;
    }

    toString() {
        return this.username;
    }

    getName() {
        return this.last_name + " " + this.first_name;
    }
}