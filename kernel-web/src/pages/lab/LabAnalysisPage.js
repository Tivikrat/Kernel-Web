import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import strings from "../../strings";
import {Checkbox} from "@material-ui/core";
import Waybill from "../../data/models/Waybill";

export default class LabAnalysisPage extends React.Component {
    renderInstance(instance) {
        return (
            <div>
                <h3>{instance.name}</h3>
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
                        <p>{strings["Laboratory assistant"]}: {instance.lab_analysis.lab_assistant.user.getName()}</p>
                        <p>{strings["humidity"]}: {instance.lab_analysis.humidity} %</p>
                        <p>{strings["clogging"]}: {instance.lab_analysis.clogging} %</p>
                    </div> : undefined}
            </div>
        );
    }

    render() {
        return (
            <CRUDGrid
                title={strings["Laboratory analysis"]}
                url={server_routes.lab_analysis}
                instanceClass={Waybill}
                reader={this.renderInstance}
                fields={[
                    {name: "humidity", type: "number"},
                    {name: "clogging", type: "number"}
                ]}
                nocreate/>
        );
    }
}
