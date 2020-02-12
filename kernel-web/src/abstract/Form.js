import * as React from "react";
import {Network} from "../network";

export class Form extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            request_data: {},
            ready: true,
            error: '',
            url: '',
            errors: {},
        };
        this.handleTextFieldChange = event => {
            const {name, value} = event.target;
            this.setState(prevState => ({
                request_data: {
                    ...prevState.request_data,
                    [name]: value
                }
            }));
        };

        this.handleSubmit = async (event) => {
            event.preventDefault();
            this.setState({ready: false});
            const {url, request_data, method} = this.state;
            const {parent, handle} = this.props;
            const result = await Network.send(url, request_data, method);
            if (result.error) {
                this.setState({error: result.error});
            } else if (result.response.ok) {
                if (parent) {
                    if (method === "POST") {
                        parent.create(result.data);
                    } else if (method === "PATCH") {
                        parent.patch(result.data);
                    } else if (method === "DELETE") {
                        parent.delete();
                    }
                }
                if (handle) {
                    handle(result.data);
                }
            } else {
                this.setState({errors: result.data});
            }
            this.setState({ready: true});
        }
    }
}
