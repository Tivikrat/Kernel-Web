import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import strings from "../../strings";
import User from "../../data/models/User";

export default class UsersPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h2>{instance.getName()}</h2>
                <h3>{instance.username}</h3>
                <p>{instance.address}</p>
                <p><a href={"mailto:" + instance.email}>{instance.email}</a></p>
                <p>{instance.phone}</p>
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["Users management"]}
                url={server_routes.users}
                instanceClass={User}
                reader={this.renderInstance}
                fields={[
                    {name: "username"},
                    [{name: "password1", type: "password"}, {name: "password2", type: "password"}],
                    [{name: "email", type: "email"}, /*{name: "phone", type: "phone"}*/],
                    [{name: "first_name"}, {name: "last_name"}],
                    {name: "is_superuser", type: "checkbox"},
                ]}/>
        );
    }
}
