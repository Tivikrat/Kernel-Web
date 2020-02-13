import {TextField, Button, Checkbox} from "@material-ui/core";
import {Autocomplete} from '@material-ui/lab';
import {Form} from "./Form";
import React from "react";
import strings from "../strings"
import Awaiter from "../components/shared/awaiter";
import {Network} from "../network";

export default class DynamicForm extends Form {
    constructor(props) {
        super(props);
        const instance = this.state.instance = props.instance;
        this.state.url = props.url + (instance ? instance.id + "/" : "");
        this.state.method = this.parse_method(props.method);
        this.searchURLs = {};
        this.searchRenderers = {};
        this.autocompleteNames = {};
    }

    getDataListByName(name) {
        return (this.state.instance ? this.state.instance.id : undefined) + ":" + name;
    }

    async handleSearchFieldChange(event) {
        const target = event.target;
        const {name, value} = target;
        const renderer = this.searchRenderers[name];
        if (value.trim && value.trim() !== "") {
            let result = await Network.get(this.searchURLs[name] + value + "/");
            if (result.response && result.response.ok) {
                this.setState({
                    [this.getDataListByName(name)]: result.data.map(element => {
                        return {...element, __field_name: name, __renderer: renderer}
                    })
                });
            }
        }
    }

    handleAutocompleteChange = (event, value) => {
        if (value && value.__field_name && value.__renderer) {
            this.setState(prevState => ({
                request_data: {
                    ...prevState.request_data,
                    [value.__field_name]: value.__renderer(value)
                }
            }));
        }
    };

    handleCheck = (event) => {
        if (event) {
            let {name, checked} = event.target;
            this.setState(prevState => ({
                request_data: {
                    ...prevState.request_data,
                    [name]: checked
                }
            }));
        }
    };

    parse_method(method) {
        if (method.trim().toUpperCase() === "POST") {
            return "POST";
        }
        if (method.trim().toUpperCase() === "PATCH") {
            return "PATCH";
        }
        if (method.trim().toUpperCase() === "DELETE") {
            return "DELETE";
        }
    }

    get_text_field(field, errors, index, instance) {
        const {name, type, multiline, shrink_label, search, url, renderer, translation} = field;
        const label = (translation ? strings[translation] : strings[name]);
        if (label === undefined) {
            console.log("Untranslated: " + name);
        }
        const error = errors[name + (search ? "_name" : "")];
        const value = instance ? (/*instance.initial_json ? instance.initial_json[name] : */instance[name]) : undefined;
        if (search) {
            this.searchURLs[name + "_name"] = url;
            this.searchRenderers[name + "_name"] = renderer;
            this.autocompleteNames[name] = name + "_name";
        }
        return (
            search ?
                <Autocomplete
                    key={index}
                    autoHighlight
                    autoSelect
                    options={this.state[this.getDataListByName(name + "_name")]}
                    getOptionLabel={this.searchRenderers[name + "_name"]}
                    onChange={this.handleAutocompleteChange}
                    defaultValue={value}
                    name={name}
                    renderInput={params => (
                        <TextField {...params}
                                   autoFocus={!index}
                                   name={name + (search ? "_name" : "")}
                                   error={null != error}
                                   helperText={error}
                                   label={label}
                                   type={type}
                                   multiline={multiline}
                                   className="form_text_field"
                                   margin="dense"
                                   variant="outlined"
                                   onChange={this.handleSearchFieldChange.bind(this)}
                                   style={{margin: "5px"}}
                                   fullWidth
                                   InputLabelProps={{
                                       shrink: shrink_label,
                                   }}/>
                    )}
                />
                //     <SearchTextField
                //         index={index}
                //         name={name}
                //         error={error}
                //         label={label}
                //         value={value}
                //         multiline={multiline}
                //         shrink_label={shrink_label}
                //         onChange={this.handleTextFieldChange}/>
                :
                type === "checkbox" ?
                    <div>
                        <Checkbox
                            defaultChecked={value}
                            name={name}
                            onChange={this.handleCheck}
                        />
                        {label}
                    </div>
                    :
                    <TextField
                        autoFocus={!index}
                        name={name + (search ? "_name" : "")}
                        error={null != error}
                        helperText={error}
                        label={label}
                        type={type}
                        defaultValue={value}
                        multiline={multiline}
                        className="form_text_field"
                        margin="dense"
                        variant="outlined"
                        onChange={search ? this.handleSearchFieldChange.bind(this) : this.handleTextFieldChange}
                        key={index}
                        style={{margin: "5px"}}
                        fullWidth
                        inputProps={{min: "0", max: "100", step: "0.01"}}
                        InputLabelProps={{
                            shrink: shrink_label,
                        }}/>);
    }

    get_form_fields(fields, errors, instance) {
        let field_index = 0;
        return fields.map((element, index) => {
            return (
                <div key={index} className="form_text_field">
                    {Array.isArray(element) ?
                        element.map(field => {
                            return this.get_text_field(field, errors, field_index++, instance);
                        })
                        :
                        this.get_text_field(element, errors, field_index++, instance)}
                </div>);
        });
    }

    get_form_actions(ready, method, confirm_text, process_text, error) {
        return ready ? (
            <div className="form_actions">
                <Button variant="contained" type="submit">{confirm_text}</Button>
                {method === "PATCH" ?
                    <Button variant="contained" onClick={() => {
                        const {parent} = this.props;
                        if (parent) {
                            parent.setState({managing: false});
                        }
                    }}>{strings["Cancel"]}</Button> : undefined}
                {method === "DELETE" ?
                    <Button variant="contained" onClick={() => {
                        const {parent} = this.props;
                        if (parent) {
                            parent.setState({deleting: false});
                        }
                    }}>{strings["Cancel"]}</Button> : undefined}
            </div>
        ) : (
            <div className="form_actions">
                <Awaiter message={process_text} error={error}/>
            </div>
        );
    }

    render() {
        let {confirm_text, process_text, fields} = this.props;
        const {error, errors, ready, method, instance} = this.state;
        if (!confirm_text) {
            confirm_text = instance ? (method === "PATCH" ? strings["Edit"] : strings["Delete"]) : strings["Create"];
        }
        if (!process_text) {
            process_text = instance ? (method === "PATCH" ? strings["Editing"] : strings["Deletion"]) : strings["Creation"];
        }
        fields = fields ? fields : this.fields;
        if (method === "DELETE") {
            return (
                <form onSubmit={this.handleSubmit}>
                    {strings["Are you sure you want to delete"] + " " + instance.toString()}?
                    {this.get_form_actions(ready, method, confirm_text, process_text, error)}
                </form>
            )
        } else {
            return (
                <form onSubmit={this.handleSubmit}>
                    <h2>
                        {process_text}
                    </h2>
                    <p className="error_message"
                       style={{maxWidth: "400px", overflowWrap: "break-word"}}>{errors['non_field_errors']}</p>
                    {this.get_form_fields(fields, errors, instance)}
                    {this.get_form_actions(ready, method, confirm_text, process_text, error)}
                </form>
            )
        }
    }
}