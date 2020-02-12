import * as React from "react";
import DynamicForm from "../../abstract/DynamicForm";
import strings from "../../strings"
import server_routes from "../../server_routes";
import AppData from "../../data/AppData";

export default class LoginPage extends React.Component {
    handle(data) {
        document.cookie = "token=" + data.token;
        AppData.app.setState({user: data});
        AppData.app.props.history.push('/');
    }

    render() {
        return (
            <div className={"central"}>
                <DynamicForm
                    url={server_routes.login}
                    handle={this.handle}
                    method={"POST"}
                    process_text={strings["Login"]}
                    confirm_text={strings["Log in"]}
                    fields={[
                        {name: "username"},
                        {name: "password", type: "password"},
                    ]}
                />
            </div>
        );
    }
}
