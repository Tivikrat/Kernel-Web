import * as React from "react";
import {TextField} from "@material-ui/core";

export default class SearchTextField extends React.Component {
    constructor(props) {
        super(props);
        const {value} = props;
        if (value) {
            this.id = value.id;
        }
    }

    handleChange() {

    }

    render() {
        const {index, name, error, label, value, multiline, shrink_label} = this.props;
        return <TextField
            autoFocus={!index}
            name={name + "_name"}
            error={null != error}
            helperText={error}
            label={label}
            type="text"
            defaultValue={value}
            multiline={multiline}
            className="form_text_field"
            margin="dense"
            variant="outlined"
            onChange={this.handleChange}
            key={index}
            style={{margin: "5px"}}
            fullWidth
            InputLabelProps={{
                shrink: shrink_label,
            }}
        />;
    }
}