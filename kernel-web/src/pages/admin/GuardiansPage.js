import * as React from "react";
import server_routes from "../../server_routes";
import Guardian from "../../data/models/Guardian";
import strings from "../../strings";
import StaffPage from "./StaffPage";

export default class GuardiansPage extends StaffPage {
    render() {
        return (
            <StaffPage
                title={strings["Guardians management"]}
                url={server_routes.guardians}
                instanceClass={Guardian}/>
        );
    }
}
