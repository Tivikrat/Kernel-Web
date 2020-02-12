import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import Good from "../../data/models/Good";
import strings from "../../strings";

export default class ElevatorsPage extends React.Component {
    renderInstance(instance) {
        console.log(instance);
        return (
            <div>
                <h2>{instance.name}</h2>
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["Goods management"]}
                url={server_routes.goods}
                instanceClass={Good}
                reader={this.renderInstance}
                fields={[{name: "name"}]}/>
        );
    }
}
