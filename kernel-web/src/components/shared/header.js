import * as React from "react";
import AppData from "../../data/AppData"
import {Link} from "react-router-dom";
import routes from "../../client_routes";
import strings from "../../strings"

export default class Header extends React.Component {
    render() {
        const {is_superuser, is_lab, is_weighing, is_provider, token} = AppData.app.state.user;
        return (
            <header>
                <div style={{float: "left"}}>
                    <Link to="/">
                        {/*<img src="/kernel-logo-header-01.svg" alt="Kernel logo" style={{height: "100%"}}/>*/}
                        KERNEL
                    </Link>
                </div>
                <div style={{float: "right"}}>
                    {is_superuser ? (
                        <Link to={routes.admin.cabinet}>{strings["Administration"]}</Link>
                    ) : undefined}
                    {is_lab ? (
                        <Link to={routes.lab.cabinet}>{strings["Laboratory"]}</Link>
                    ) : undefined}
                    {is_weighing ? (
                        <Link to={routes.weighing.cabinet}>{strings["Weighing"]}</Link>
                    ) : undefined}
                    {is_provider ? (
                        <Link to={routes.provider.cabinet}>{strings["Providing"]}</Link>
                    ) : undefined}
                    {token ? (
                        <Link to={routes.user.profile}>{strings["Profile"]}</Link>
                    ) : <Link to={routes.user.register}>{strings["Register"]}</Link>}
                    {token ? (
                        <Link to={routes.user.logout}>{strings["Log out"]}</Link>
                    ) : <Link to={routes.user.login}>{strings["Log in"]}</Link>}
                </div>
            </header>
        );
    }
}