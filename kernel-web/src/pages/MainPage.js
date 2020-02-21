import * as React from "react";
import AppData from "../data/AppData"
import {Link, Redirect} from "react-router-dom";
import routes from "../client_routes";
import strings from "../strings"
import AdminPage from "./admin/AdminPage";
import LabPage from "./lab/LabPage";
import WeighingPage from "./weighing/WeighingPage";
import ProviderPage from "./provider/ProviderPage";

export default class MainPage extends React.Component {
    render() {
        const {is_superuser, is_lab, is_weighing, is_provider, token} = AppData.app.state.user;
        return (
            <div className="central">
                <div style={{float: "right"}}>
                    {is_superuser ? (
                        <AdminPage basic/>
                    ) : undefined}
                    {is_lab ? (
                        <LabPage basic/>
                    ) : undefined}
                    {is_weighing ? (
                        <WeighingPage basic/>
                    ) : undefined}
                    {is_provider ? (
                        <ProviderPage basic/>
                    ) : undefined}
                    {token ? undefined : <Redirect to={routes.user.login}/>}
                </div>
            </div>
        );
    }
}