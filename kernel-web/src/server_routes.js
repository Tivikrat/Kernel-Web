const routes = {
    login: "/auth/login/",
    logout: "/logout/",
    user: "/auth/current/",
    goods : "/api/goods/",
    elevators: "/api/elevators/",
    users: "/auth/users/",
    labs: "/api/labs/",
    users_search: "/auth/users_search/",
    elevators_search: "/api/elevators_search/",
    providers_search: "/api/providers_search/",
    weighings: "/api/weighings/",
    guardians: "/api/guardians/",
    providers: "/api/providers/",
    weighing_waybills: "/api/weighing_deliveries/",
    weight_checks: "/api/weight_checks/",
    lab_analysis: "/api/lab_analysis/",
    statistics: "/statistics/"
};

const server_url = "http://127.0.0.1:8000";

let server_routes = {};
for (let route in routes) {
    if (routes.hasOwnProperty(route)) {
        server_routes[route] = server_url + routes[route];
    }
}
export default server_routes;