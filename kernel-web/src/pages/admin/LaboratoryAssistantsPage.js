import * as React from "react";
import server_routes from "../../server_routes";
import LaboratoryAssistant from "../../data/models/LaboratoryAssistant";
import strings from "../../strings";
import StaffPage from "./StaffPage";

export default class LaboratoryAssistantsPage extends React.Component {
    render() {
        return (
            <StaffPage
                title={strings["Laboratory assistants management"]}
                url={server_routes.labs}
                instanceClass={LaboratoryAssistant}/>
        );
    }
}
