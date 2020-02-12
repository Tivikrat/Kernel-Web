import * as React from "react";
import {Button} from "@material-ui/core";
import strings from "../../strings";

export default class AdminConfirmPage extends React.Component {
    render() {
        const testContent = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(index => {
            const name = "Kernel corn production LTD";
            const userName = "Васильов Василій Васильович";
            const address = "м. Дніпро, вул. Жовтнева, 65";
            const email = "kernel.corn@kernel.ua";
            return (
                <div className="grid-element" key={index}>
                    <h3>{name}</h3>
                    <h4>{userName}</h4>
                    <h4>{address}</h4>
                    <h4><a href={"mailto:" + email}>{email}</a></h4>
                    <div style={{display: "flex", justifyContent: "space-evenly"}}>
                        <Button variant="contained">{strings["Confirm"]}</Button>
                        <Button variant="contained">{strings["Cancel"]}</Button>
                    </div>
                </div>
            );
        });
        return (
            <div>
                <h1>{strings["Confirm provider registration"]}</h1>
                <div className="grid">
                    {testContent}
                </div>
            </div>
        );
    }
}