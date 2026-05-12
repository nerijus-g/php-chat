import { useEffect, useState } from "react";

export default function App() {
  const [ws, setWs] = useState<WebSocket | null>(null);
  const [messages, setMessages] = useState<string[]>([]);
  const [input, setInput] = useState("");

  useEffect(() => {
    // Connect to Ratchet WebSocket server
    const socket = new WebSocket("ws://127.0.0.1:8080");

    socket.onopen = () => {
      console.log("Connected to Ratchet WebSocket");
    };

    socket.onmessage = (event) => {
      setMessages((prev) => [...prev, event.data]);
    };

    socket.onerror = (err) => {
      console.error("WebSocket error", err);
    };

    socket.onclose = () => {
      console.log("WebSocket closed");
    };

    setWs(socket);

    // Cleanup on unmount
    return () => socket.close();
  }, []);

  const sendMessage = () => {
    if (!ws || ws.readyState !== WebSocket.OPEN) return;
    ws.send(input);
    setMessages((prev) => [...prev, `You: ${input}`]);
    setInput("");
  };

  return (
    <div style={{ padding: 20 }}>
      <h2>React + PHP Ratchet Chat</h2>

      <div style={{ border: "1px solid #ccc", padding: 10, height: 300, overflowY: "auto" }}>
        {messages.map((msg, i) => (
          <div key={i}>{msg}</div>
        ))}
      </div>

      <input
        value={input}
        onChange={(e) => setInput(e.target.value)}
        placeholder="Type a message..."
        style={{ width: "80%", marginTop: 10 }}
      />
      <button onClick={sendMessage} style={{ marginLeft: 10 }}>
        Send
      </button>
    </div>
  );
}

