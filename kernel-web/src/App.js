import React from 'react';
import Header from "./components/shared/header";
import {Route, Switch, withRouter} from "react-router-dom";
import routes from "./client_routes";
import './css/white/main.css'
import RegisterPage from "./pages/auth/RegisterPage";
import LoginPage from "./pages/auth/LoginPage";
import AdminPage from "./pages/admin/AdminPage";
import AdminConfirmPage from "./pages/admin/AdminConfirmPage";
import ElevatorsPage from "./pages/admin/ElevatorsPage";
import GoodsPage from "./pages/admin/GoodsPage";
import LaboratoryAssistantsPage from "./pages/admin/LaboratoryAssistantsPage";
import WeighingsPage from "./pages/admin/WeighingsPage";
import GuardiansPage from "./pages/admin/GuardiansPage";
import ProviderPage from "./pages/provider/ProviderPage";
import ContractsPage from "./pages/provider/ContractsPage";
import WaybillsPage from "./pages/weighing/WaybillsPage";
import WeighingPage from "./pages/weighing/WeighingPage";
import AppData from "./data/AppData";
import LogoutPage from "./pages/auth/LogoutPage";
import Awaiter from "./components/shared/awaiter";
import strings from "./strings";
import {Network} from "./network";
import server_routes from "./server_routes";
import UsersPage from "./pages/admin/UsersPage";
import ProvidersPage from "./pages/admin/ProvidersPage";
import WeightCheckPage from "./pages/weighing/WeightCheckPage";
import LabAnalysisPage from "./pages/lab/LabAnalysisPage";
import LabPage from "./pages/lab/LabPage";

class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            ready: false,
            user: {},
        };
        AppData.app = this;
        this.get_current_user();
    }

    async get_current_user() {
        let result = await Network.get(server_routes.user);
        while (!result.response || !result.response.ok || result.error) {
            console.log(result);
            if(result.response && result.response.status === 401) {
                document.cookie = "token=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
            } else {
                this.setState({error: result.error ? result.error : result.response.statusText});
                await Network.sleep();
                result = await Network.get(server_routes.user);
            }
        }
        if (result.data.length) {
            AppData.app.setState({user: result.data[0]});
        }
        this.setState({ready: true});
    }

    render() {
        const {ready, user, error} = this.state;
        return (
            ready ?
                <div className="App" style={{display: "flex", flexDirection: "column"}}>
                    <Header user={user}/>
                    <Switch>
                        <Route exact path={routes.user.login}><LoginPage/></Route>
                        <Route exact path={routes.user.logout}><LogoutPage/></Route>
                        <Route exact path={routes.user.register}><RegisterPage/></Route>
                        <Route exact path={routes.admin.cabinet}><AdminPage/></Route>
                        <Route exact path={routes.admin.confirm_provider_registration}><AdminConfirmPage/></Route>
                        <Route exact path={routes.admin.elevators}><ElevatorsPage/></Route>
                        <Route exact path={routes.admin.goods}><GoodsPage/></Route>
                        <Route exact path={routes.admin.laboratory_assistants}><LaboratoryAssistantsPage/></Route>
                        <Route exact path={routes.admin.weighings}><WeighingsPage/></Route>
                        <Route exact path={routes.admin.guardians}><GuardiansPage/></Route>
                        <Route exact path={routes.admin.providers}><ProvidersPage/></Route>
                        <Route exact path={routes.admin.users}><UsersPage/></Route>
                        <Route exact path={routes.provider.cabinet}><ProviderPage/></Route>
                        <Route exact path={routes.provider.contracts}><ContractsPage/></Route>
                        <Route exact path={routes.weighing.cabinet}><WeighingPage/></Route>
                        <Route exact path={routes.weighing.waybills}><WaybillsPage/></Route>
                        <Route exact path={routes.weighing.check}><WeightCheckPage/></Route>
                        <Route exact path={routes.lab.cabinet}><LabPage/></Route>
                        <Route exact path={routes.lab.lab_analysis}><LabAnalysisPage/></Route>
                    </Switch>
                </div>
                : <div className="central">
                    <Awaiter message={strings["Connecting to server..."]} error={error}/>
                </div>
        );
    }
}

export default withRouter(App);
