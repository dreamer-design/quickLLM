function fetchGem(prompt, callback) {
    if (!prompt) return;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:3000/generate");
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                // outputArea.text = response.text;
                console.log(xhr.responseText); console.log(response);
                // return response.text;  // dooesnt work because async
                callback(response.text); // ✅ pass result to callback
            } else {
                console.log("Error: " + xhr.responseText);
                callback(null);
            }
        }
    };

    // Create the full payload including the config
    var payload = {
        prompt: prompt,
        config: {
            // Using a clearer instruction (see suggestions below)
            systemInstruction: "You are a coding assistant. Provide only the specific code snippet requested. avoid excessive punctuation and only use tabs for formatting. where possible provide short quick answers"
        }
    };

    xhr.send(JSON.stringify({ prompt: prompt }));
}
