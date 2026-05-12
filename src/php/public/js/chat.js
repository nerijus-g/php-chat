let conn = new WebSocket("ws://localhost:8081");

conn.onopen = () => {
    console.log("Connected to WebSocket");
};

conn.onmessage = e => {
    let box = document.getElementById("chat-box");
    box.innerHTML += "<div>" + e.data + "</div>";
    box.scrollTop = box.scrollHeight;
};

function sendMsg() {
    let msg = document.getElementById("msg").value;
    conn.send(msg);
    document.getElementById("msg").value = "";
}
