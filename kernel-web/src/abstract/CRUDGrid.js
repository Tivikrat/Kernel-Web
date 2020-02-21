import * as React from "react";
import CRUDElement from "./CRUDElement";
import Awaiter from "../components/shared/awaiter";
import strings from "../strings";
import {Network} from "../network";
import server_routes from "../server_routes";

export default class CRUDGrid extends React.Component {
    constructor(props) {
        super(props);
        if (props.instances) {
            this.state = {
                instances: props.instances,
            };
            console.log(props.instances, "was placed");
        } else {
            this.state = {};
            this.load();
        }
        this.maxIndex = 0;
    }

    async load() {
        const {url, instanceClass} = this.props;
        let result = await Network.get(url);
        while (result.error || !result.response || !result.response.ok) {
            this.setState({error: result.error ? result.error : result.response.statusText});
            await Network.sleep();
            result = await Network.get(url);
        }
        this.setState({
            instances: result.data.map(instance_data => {
                return new instanceClass(instance_data);
            })
        });
    }

    create(data) {
        const {instanceClass} = this.props;
        this.setState(prevState => ({
            instances: [new instanceClass(data), ...prevState.instances]
        }));
    }

    patch(old_instance, new_instance) {
        for (let index = 0; index < this.state.instances.length; ++index) {
            if (this.state.instances[index] === old_instance) {
                this.state.instances[index] = new_instance;
                break;
            }
        }
    }

    delete(instance) {
        this.setState(prevState => ({
            instances: prevState.instances.filter(element => element !== instance)
        }));
    }

    render() {
        const {fields, url, reader, instanceChangeable, title, nocreate} = this.props;
        const {instances, error} = this.state;
        if (instances) {
            const elements = instances.map(instance => {
                if (this.maxIndex < instance.id) {
                    this.maxIndex = instance.id;
                }
                return <CRUDElement
                    parent={this}
                    instance={instance}
                    key={instance.id}
                    reader={reader}
                    fields={fields}
                    url={url}
                    instanceChangeable={instanceChangeable}/>;
            });
            const creation_element = <CRUDElement
                parent={this}
                key={this.maxIndex + 1}
                reader={reader}
                fields={fields}
                url={url}/>;
            return (
                <div>
                    <h1>{title}</h1>
                    <div className="grid">
                        {nocreate ? undefined : creation_element}
                        {elements}
                    </div>
                </div>
            );
        } else {
            return <Awaiter message={strings["Loading data from server..."]} error={error}/>;
        }
    }
}