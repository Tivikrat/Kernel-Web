import * as React from "react";
import {Link} from "react-router-dom";
import client_routes from "../../client_routes";
import strings from "../../strings";
import server_routes from "../../server_routes";
import {Network} from "../../network";

function downloadFile(url) {
    fetch(url, {
        method: "GET",
        headers: Network.get_send_header(),
        credentials: 'include',
    })
        .then(response => response.blob())
        .then(blob => {
            const a = document.createElement("a");
            let objectUrl = window.URL.createObjectURL(blob);
            a.href = objectUrl;
            a.download = 'report';
            a.click();

            window.URL.revokeObjectURL(objectUrl);
        });
}

export default class ProviderPage extends React.Component {


    render() {
        return (
            <div className="selector central">
                <a onClick={() => downloadFile(server_routes.statistics)}>{strings["Motion report and balances"]}</a>
            </div>);
    }
}
