import * as React from "react";
import server_routes from "../../server_routes";
import Weighing from "../../data/models/Weighing";
import strings from "../../strings";
import StaffPage from "./StaffPage";

export default class WeighingsPage extends React.Component {
    render() {
        return (
            <StaffPage
                title={strings["Weighings management"]}
                url={server_routes.weighings}
                instanceClass={Weighing}/>
        );
    }
}
