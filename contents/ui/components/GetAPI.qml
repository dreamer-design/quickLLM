// ui/GetAPI.qml
import QtQuick

Item {
    signal dataReceived(var data)

    function fetchData(url) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", url);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                // var json = JSON.parse(xhr.responseText);
                dataReceived(xhr.responseText);
            }
        }
        xhr.send();
    }
}
