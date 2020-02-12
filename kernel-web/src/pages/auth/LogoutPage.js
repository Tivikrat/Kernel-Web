import * as React from "react";
import DynamicForm from "../../abstract/DynamicForm";
import strings from "../../strings"
import server_routes from "../../server_routes";
import AppData from "../../data/AppData";
import {Redirect} from "react-router-dom";
import Awaiter from "../../components/shared/awaiter";
import {Network} from "../../network";
import App from "../../App";

export default class LogoutPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {ready: false, error: ''};
        this.logout();
    }

    async logout() {
        let result = await Network.get(server_routes.logout);
        while (!result.response.ok) {
            this.setState({error: result.error ? result.error : result.response.statusText});
            await Network.sleep();
            result = await Network.get(server_routes.logout);
        }
        AppData.app.setState({user: {}});
        document.cookie = "token=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
        this.setState({ready: true});
    }

    render() {
        const {ready, error} = this.state;
        return (
            ready ?
                <Redirect to="/"/> :
                <Awaiter message={strings["Logging out"]} error={error}/>
        )
    }
}
