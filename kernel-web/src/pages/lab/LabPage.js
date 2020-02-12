import * as React from "react";
import {Link} from "react-router-dom";
import client_routes from "../../client_routes";
import strings from "../../strings";

export default class AdminPage extends React.Component {
    render() {
        return (
        <div className="selector central">
            <Link to={client_routes.lab.lab_analysis}>{strings["Laboratory analysis"]}</Link>
        </div>);
    }
}
