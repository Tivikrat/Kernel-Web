import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import strings from "../../strings";
import {Checkbox} from "@material-ui/core";
import Contract from "../../data/models/Contract";
import Waybill from "../../data/models/Waybill";
import User from "../../data/models/User";
import Elevator from "../../data/models/Elevator";
import Provider from "../../data/models/Provider";

export default class WaybillsPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h3>{instance.name}</h3>
                {/*<h4>{instance.contract.name}</h4>*/}
                {/*<p>{instance.contract.provider.name}</p>*/}
                {/*<p>{instance.contract.good.name}, {instance.contract.total_weight} {strings["kg"]}</p>*/}
                {/*<p>{instance.contract.date} <Checkbox checked={instance.contract.is_confirmed}/></p>*/}
                {/*<p>{strings["humidity"]}: {instance.humidity} %</p>*/}
                {/*<p>{strings["clogging"]}: {instance.clogging} %</p>*/}
                {/*<p>{strings["net_weight"]}: {instance.net_weight} {strings["kg"]}</p>*/}
                {/*<p>{strings["gross_weight"]}: {instance.gross_weight} {strings["kg"]}</p>*/}
                {/*<p>{instance.departure_time}-{instance.arrival_time}</p>*/}
                {/*<h4>{instance.elevator.name}</h4>*/}
                <h4>{instance.provider.name}</h4>
                <div style={{display: "flex", justifyContent: "space-evenly", alignItems: "center"}}>
                    {instance.date}
                    <div><Checkbox checked={instance.to_elevator} disabled/>{strings["to_elevator"]}</div>
                </div>
                {instance.weight_check ?
                    <div>
                        <h5>{strings["Weight check"]}</h5>
                        <p>{strings["Weighing"]}: {instance.weight_check.weighing.user.getName()}</p>
                        <p>{strings["net_weight"]}: {instance.weight_check.net_weight} {strings["kg"]}</p>
                        <p>{strings["gross_weight"]}: {instance.weight_check.gross_weight} {strings["kg"]}</p>
                    </div> : undefined}
                {instance.lab_analysis ?
                    <div>
                        <h5>{strings["Laboratory analysis"]}</h5>
                        {instance.lab_analysis.laboratory_assistant ?
                            <p>{strings["Laboratory assistant"]}: {instance.lab_analysis.laboratory_assistant.user.getName()}</p>
                            : undefined}
                        <p>{strings["humidity"]}: {instance.lab_analysis.humidity} %</p>
                        <p>{strings["clogging"]}: {instance.lab_analysis.clogging} %</p>
                    </div> : undefined}
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["LSD management"]}
                url={server_routes.weighing_waybills}
                instanceClass={Waybill}
                reader={this.renderInstance}
                fields={[
                    {name: "name", translation: "LSD name"},
                    {
                        name: "provider",
                        search: true,
                        url: server_routes.providers_search,
                        renderer: data => new Provider(data).toString()
                    },
                    {
                        name: "elevator",
                        search: true,
                        url: server_routes.elevators_search,
                        renderer: data => new Elevator(data).toString()
                    },
                    {name: "to_elevator", type: "checkbox"},
                    {name: "date", type: "date", shrink_label: true},
                ]}/>
        );
    }
}
