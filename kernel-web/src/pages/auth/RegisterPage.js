import * as React from "react";
import DynamicForm from "../../abstract/DynamicForm";
import strings from "../../strings"
import CRUDGrid from "../../abstract/CRUDGrid";

export default class RegisterPage extends React.Component {
    render() {
        return (
            <div className={"central"}>
                <DynamicForm
                    url={"/"}
                    method={"POST"}
                    fields={[
                        {name: "username"},
                        [{name: "password1", type: "password"}, {name: "password2", type: "password"}],
                        {name: "email", type: "email"},
                        [{name: "first_name"}, {name: "last_name"}],
                        {name: "is_superuser", type: "checkbox"},
                    ]}/>
                />
            </div>
        );
    }
}