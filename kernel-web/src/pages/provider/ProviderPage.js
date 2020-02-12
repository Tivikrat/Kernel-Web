import * as React from "react";
import {Link} from "react-router-dom";
import client_routes from "../../client_routes";
import strings from "../../strings";
import server_routes from "../../server_routes";

export default class ProviderPage extends React.Component {
    render() {
        return (
        <div className="selector central">
            <a href={server_routes.statistics}>{strings["Motion report and balances"]}</a>
        </div>);
    }
}
