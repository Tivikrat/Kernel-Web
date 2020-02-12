import * as React from "react";
import DynamicForm from "./DynamicForm";
import strings from "../strings";
import {Button} from "@material-ui/core";

export default class CRUDElement extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            managing: false,
            deleting: false,
            instance: props.instance,
        }
    }

    create(data) {
        const {parent} = this.props;
        parent.create(data);
    }

    patch(data) {
        const {parent} = this.props;
        const old_instance = this.state.instance;
        const new_instance = new parent.props.instanceClass(data);
        this.setState({managing: false, instance: new_instance});
        parent.patch(old_instance, new_instance);
    }

    delete() {
        this.props.parent.delete(this.state.instance);
    }

    render() {
        const {fields, url, reader, instanceChangeable} = this.props;
        const {managing, deleting, instance} = this.state;
        return (
            <div className="grid-element">{
                !instance ? (
                    <DynamicForm
                        parent={this}
                        url={url}
                        method={"POST"}
                        fields={fields}/>
                ) : (deleting ? (
                    <DynamicForm
                        parent={this}
                        url={url}
                        method={"DELETE"}
                        instance={instance}
                        fields={fields}/>
                ) : (managing ? (
                    <DynamicForm
                        parent={this}
                        url={url}
                        method={"PATCH"}
                        instance={instance}
                        fields={fields}/>
                ) : (
                    <div style={{display: "flex", flexDirection: "column", height: "100%"}}>
                        <div style={{flexGrow: 1}}>
                            {reader(instance)}
                        </div>
                        {!instanceChangeable || instanceChangeable(instance) ?
                            <div className="form_actions">
                                <Button variant="contained" onClick={() => this.setState({managing: true})}>
                                    {strings["Edit"]}
                                </Button>
                                <Button variant="contained" onClick={() => this.setState({deleting: true})}>
                                    {strings["Delete"]}
                                </Button>
                            </div> : undefined}
                    </div>
                )))
            }</div>);
    }
}