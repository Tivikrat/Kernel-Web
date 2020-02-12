import * as React from "react";
import DynamicForm from "../../abstract/DynamicForm";
import strings from "../../strings"

export default class RegisterPage extends React.Component {
    render() {
        return (
            <div className={"central"}>
                <DynamicForm
                    url={"/"}
                    method={"POST"}
                    process_text={strings["Registration"]}
                    confirm_text={strings["Register"]}
                    fields={[
                        {name: "username"},
                        [{name: "password1", type: "password"}, {name: "password2", type: "password"}],
                        [{name: "email", type: "email"}, {name: "phone", type: "phone"}],
                        [{name: "first_name"}, {name: "middle_name"}, {name: "last_name"}],
                    ]}
                />
            </div>
        );
    }
}