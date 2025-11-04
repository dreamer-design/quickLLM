const url = "https://bible-api.com/data/web/random"

function changeLabel(newText) {
    txt.text = newText;
}

function formatLength(text) {
    const words = text.split(' '); // Split the text into words
    let formattedText = [];

    // Loop through the words and add a newline after every 6th word
    for (let i = 0; i < words.length; i++) {
        formattedText.push(words[i]);
        // Add a newline after every X word
        if ((i + 1) % 7 === 0) {
            formattedText.push('\n');
        }
    }
    return formattedText.join(' ');
}

// JSON.stringify(json)
function fetch() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);

    // The onload function is triggered once the request completes successfully
    xhr.onload = function() {
        if (xhr.status === 200) {
            var jsonResponse = JSON.parse(xhr.responseText);
            // console.log(xhr.responseText);
            changeLabel( formatLength( jsonResponse.random_verse.text ) );
        } else {
            console.error("Failed to fetch: Status " + xhr.status);
        }
    };

    // Send the request
    xhr.send();
}
