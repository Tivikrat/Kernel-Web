function getCookie(name) {
    const v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return v ? v[2] : null;
}

export class Response {
    constructor(error, response, data) {
        this.error = error;
        this.response = response;
        this.data = data;
    }
}

export class Network {
    static sleep(ms = 2000) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    static get_send_header() {
        let headers = {
            "Content-Type": "application/json",
            'X-CSRFToken': getCookie('csrftoken'),
        };
        if (getCookie('token')) {
            headers = {...headers, "Authorization": "Token " + getCookie('token'),}
        }
        return headers;
    }

    static async get(url) {
        return this.process_response(fetch(url, {
            method: "GET",
            headers: this.get_send_header(),
            credentials: 'include',
        }));
    }

    static async send(url, json, method) {
        return this.process_response(fetch(url, {
            method: method,
            headers: this.get_send_header(),
            credentials: 'include',
            body: JSON.stringify(json),
        }));
    }

    static async process_response(fetch_promise) {
        let result = {};
        await fetch_promise.then(response => {
            result.response = response;
            return response.text();
        }).then(data => {
            try {
                result.data = JSON.parse(data);
            } catch (event) {
            }
        }).catch(event => {
            result.error = event.message;
        });
        return new Response(result.error, result.response, result.data);
    }
}