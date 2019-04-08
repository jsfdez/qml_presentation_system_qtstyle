import QtQml 2.12
import QtHttpServer 1.0
import "Promise.qml.js" as Promise

HttpServer {
    id: server
    port: 8080

    function makeRequest(urls) {
        var promise = new Promise(function(resolve, reject) {
            var doc = new XMLHttpRequest();
            doc.onloadend = function() {
                resolve({
                            'text' : doc.responseText,
                            'headers' : doc.getAllResponseHeaders(),
                            'urls' : urls,
                        })
            }
            doc.onerror = function() {
                console.log("Error: " + doc.status)
            }
            doc.open("GET", urls[0]);
            doc.send();
            return doc;
        }).then(function(response) {
            console.log(response.headers)
            if (response.text.length)
                console.log(response.text)
            var urls = response.urls
            urls.shift()
            if (urls.length)
                makeRequest(urls)
        });
    }

    Handler {
        path: "/quit"
        function get(_) { Qt.quit() }
    }

    Handler {
        id: handler
        path: "/greeter/<version>/<userId>"

        function get(_, userId, version) {
            console.log("Answering version: " + version)
            switch (parseInt(version)) {
            case 0:
                return "Hello " + userId;
            case 1:
                return { "Hello" : userId }
            case 2:
                return responseText.createObject(this, { "userId" : userId })
            case 3:
                return responseJson.createObject(this, { "userId" : userId })
            case 4:
                return responseJsonX10.createObject(this, { "userId" : userId })
            case 5:
                return responseText.createObject(this, {
                                                     "userId" : userId,
                                                     "status" : Response.Gone
                                                 })
            }

            return "Hello " + userId;
        }

        Component {
            id: responseText
            Response {
                property string userId
                payload: "Hello " + userId
                headers: {
                    "header_key" : "header_value"
                }
            }
        }

        Component {
            id: responseJson
            Response {
                property string userId
                payload: {
                    "message" : "Hello " + userId
                }
            }
        }

        Component {
            id: responseJsonX10
            Response {
                property string userId
                payload: {
                    var ret = []
                    for (var i = 0; i < 10; ++i)
                        ret.push("Hello " + userId)
                    return { "messages" : ret }
                }
            }
        }
    }

    Component.onCompleted: makeRequest([
                                           "http://localhost:8080/greeter/0/jefernan",
                                           "http://localhost:8080/greeter/1/jefernan",
                                           "http://localhost:8080/greeter/2/jefernan",
                                           "http://localhost:8080/greeter/3/jefernan",
                                           "http://localhost:8080/greeter/4/jefernan",
                                           "http://localhost:8080/greeter/5/jefernan",
                                           "http://localhost:8080/quit",
                                        ])
}
