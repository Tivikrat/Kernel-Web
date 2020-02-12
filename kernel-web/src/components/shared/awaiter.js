import React from "react";
import strings from "../../strings"

export default class Awaiter extends React.Component {
    render() {
        let {error, message} = this.props;
        if (error) {
            error = strings[error] ? strings[error] : error;
        }
        return (
            <div className="loading_reporter">
                <div className="loading_animation"/>
                <div>
                    <p>{message}</p>
                    <p className="error_message">{error}</p>
                </div>
            </div>
        );
    }
}
