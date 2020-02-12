import * as React from "react";
import {Link} from "react-router-dom";
import client_routes from "../../client_routes";
import strings from "../../strings";

export default class AdminPage extends React.Component {
    render() {
        return (
        <div className="selector central">
            <Link to={client_routes.admin.elevators}>{strings["Elevators management"]}</Link>
            <Link to={client_routes.admin.goods}>{strings["Goods management"]}</Link>
            <Link to={client_routes.admin.laboratory_assistants}>{strings["Laboratory assistants management"]}</Link>
            <Link to={client_routes.admin.weighings}>{strings["Weighings management"]}</Link>
            <Link to={client_routes.admin.providers}>{strings["Providers management"]}</Link>
            <Link to={client_routes.admin.guardians}>{strings["Guardians management"]}</Link>
            <Link to={client_routes.admin.users}>{strings["Users management"]}</Link>
        </div>);
    }
}