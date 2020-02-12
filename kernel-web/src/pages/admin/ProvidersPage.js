import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import strings from "../../strings";
import Provider from "../../data/models/Provider";
import User from "../../data/models/User";

export default class ProvidersPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h4>{instance.name}</h4>
                <p>{instance.user.username}</p>
                <p>{instance.user.getName()}</p>
                <p><a href={instance.user.email}>{instance.user.email}</a></p>
                <p>{instance.user.phone}</p>
                <p>{instance.user.address}</p>
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["Providers management"]}
                url={server_routes.providers}
                instanceClass={Provider}
                reader={this.renderInstance}
                fields={[
                    {name: "name"},
                    {name: "user", search: true, url: server_routes.users_search, renderer: data => new User(data).toString()},
                ]}/>
        );
    }
}
