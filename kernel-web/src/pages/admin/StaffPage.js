import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import User from "../../data/models/User";
import Elevator from "../../data/models/Elevator";

export default class StaffPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h4>{instance.user.username}</h4>
                <p>{instance.user.getName()}</p>
                <p><a href={instance.user.email}>{instance.user.email}</a></p>
                <p>{instance.user.phone}</p>
                <p>{instance.user.address}</p>
                <h4>{instance.elevator.name}</h4>
                <p>{instance.elevator.address}</p>
                <h4>{instance.address}</h4>
            </div>
        );
    }

    render() {
        const {title, url, instanceClass} = this.props;
        return (
            <CRUDGrid
                title={title}
                url={url}
                instanceClass={instanceClass}
                reader={this.renderInstance}
                fields={[
                    {name: "user", search: true, url: server_routes.users_search, renderer: data => new User(data).toString()},
                    {name: "elevator", search: true, url: server_routes.elevators_search, renderer: data => new Elevator(data).toString()}
                ]}/>
        );
    }
}
