import * as React from "react";
import CRUDGrid from "../../abstract/CRUDGrid";
import server_routes from "../../server_routes";
import strings from "../../strings";
import {Checkbox} from "@material-ui/core";
import Contract from "../../data/models/Contract";

export default class ContractsPage extends React.Component {
    // constructor(json) {
    //     super(json);
    //     this.id = json.contract_id;
    //     this.good = new Good(json.good);
    //     this.provider = new Provider(json.provider);
    //     this.name = json.name;
    //     this.total_weight = json.total_weight;
    //     this.is_confirmed = json.is_confirmed;
    //     this.date = json.date;
    // }
    renderInstance(instance) {
        return (
            <div>
                <h2>{instance.name}</h2>
                <p>{instance.good.name}, {instance.total_weight} {strings["kg"]}</p>
                {instance.date ?
                    <p style={{display: "flex", justifyContent: "space-evenly", alignItems: "center"}}>
                            {instance.date}
                            <Checkbox checked={instance.is_confirmed} disabled/>
                    </p> : undefined}
                {/*<h4>{instance.provider.name}</h4>*/}
            </div>
        );
    }

    instanceChangeable(instance) {
        return !(instance.is_confirmed);
    }

    render() {
        const instances = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(id => {
            const is_confirmed = Math.random() < 0.5;
            return new Contract({
                contract_id: id,
                good: {good_id: 0, name: "Corn"},
                provider: {
                    provider_id: 0,
                    user: {
                        username: "vasyliy",
                        last_name: "Васильов",
                        first_name: "Василь",
                        middle_name: "Васильович",
                        email: "vasyliy@kernel.ua",
                        phone: "+380950000000",
                        address: "м. Дніпро, вул. Жовтнева, 50",
                    },
                    name: "Kernel corn production LTD",
                    is_confirmed: true,
                },
                name: "ЕЛ20-190927-019",
                total_weight: "250000",
                is_confirmed: is_confirmed,
                date: is_confirmed ? "21.08.2019" : undefined,
            })
        });
        return (
            <CRUDGrid
                title={strings["Contracts management"]}
                instances={instances}
                instanceChangeable={this.instanceChangeable}
                url={server_routes.contracts}
                instanceClass={Contract}
                reader={this.renderInstance}
                fields={[{name: "name"}, {name: "good"}, {name: "total_weight", type: "number"}, {
                    name: "date",
                    type: "date",
                    shrink_label: true
                }]}/>
        );
    }
}
