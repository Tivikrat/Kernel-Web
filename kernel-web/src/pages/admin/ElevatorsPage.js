import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import Elevator from "../../data/models/Elevator";
import strings from "../../strings";

export default class ElevatorsPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h2>{instance.name}</h2>
                <h4>{instance.address}</h4>
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["Elevators management"]}
                url={server_routes.elevators}
                instanceClass={Elevator}
                reader={this.renderInstance}
                fields={[{name: "name"}, {name: "address"}]}/>
        );
    }
}
