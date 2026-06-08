<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<!-- CHAT BUTTON -->
<div id="chat-toggle">
    <i class="fas fa-robot"></i> AI Assistant
</div>

<!-- CHAT BOX -->
<div id="chat-container">

    <div id="chat-header">

        <div>
            <i class="fas fa-robot"></i>
            AI Assistant
        </div>

        <div class="chat-icons">

            <i class="fas fa-expand"
               id="expandBtn"
               onclick="maximizeChat()"></i>

            <i class="fas fa-minus"
               onclick="minimizeChat()"></i>

            <i class="fas fa-trash"
               onclick="clearChat()"></i>

            <i class="fas fa-times"
               onclick="toggleChat()"></i>

        </div>

    </div>

    <div id="chat-body">

        <div class="bot-msg">
            <strong>Bot:</strong>
            Hello! How can I help you today?
        </div>

    </div>

    <div id="chat-footer">

        <input
                type="text"
                id="userInput"
                placeholder="Ask something..."
        >

        <button onclick="sendMsg()">
            Send
        </button>

    </div>

</div>

<style>

    #chat-toggle{
        position:fixed;
        bottom:20px;
        right:20px;
        background:linear-gradient(135deg,#5b21b6,#2563eb);
        color:white;
        padding:14px 22px;
        border-radius:30px;
        cursor:pointer;
        font-weight:bold;
        z-index:99999;
        box-shadow:0 10px 25px rgba(0,0,0,.25);
    }

    #chat-container{
        position:fixed;
        bottom:85px;
        right:20px;
        width:380px;
        height:550px;
        background:white;
        border-radius:20px;
        overflow:hidden;
        display:none;
        z-index:99999;
        box-shadow:0 15px 35px rgba(0,0,0,.25);
    }

    #chat-header{
        height:60px;
        background:linear-gradient(135deg,#5b21b6,#2563eb);
        color:white;
        display:flex;
        justify-content:space-between;
        align-items:center;
        padding:0 15px;
        font-weight:bold;
    }

    .chat-icons i{
        margin-left:15px;
        cursor:pointer;
    }

    #chat-body{
        height:430px;
        overflow-y:auto;
        background:#f5f7fb;
        padding:12px;
    }

    .user-msg{
        background:#2563eb;
        color:white;
        padding:10px;
        border-radius:15px 15px 0 15px;
        margin:10px 0;
        max-width:80%;
        margin-left:auto;
        word-wrap:break-word;
    }

    .bot-msg{
        background:white;
        color:#333;
        padding:10px;
        border-radius:15px 15px 15px 0;
        margin:10px 0;
        max-width:80%;
        box-shadow:0 2px 8px rgba(0,0,0,.08);
        word-wrap:break-word;
    }

    #chat-footer{
        height:60px;
        display:flex;
        border-top:1px solid #ddd;
    }

    #chat-footer input{
        flex:1;
        border:none;
        outline:none;
        padding:12px;
    }

    #chat-footer button{
        border:none;
        padding:0 20px;
        background:linear-gradient(135deg,#5b21b6,#2563eb);
        color:white;
        cursor:pointer;
    }

    .typing{
        font-style:italic;
        color:#777;
    }

    .maximized{
        width:700px !important;
        height:85vh !important;
    }

</style>

<script>

    let minimized = false;

    document.addEventListener("DOMContentLoaded", function () {

        document.getElementById("chat-toggle")
            .addEventListener("click", toggleChat);

        document.getElementById("userInput")
            .addEventListener("keypress", function(e){

                if(e.key === "Enter"){
                    sendMsg();
                }

            });

    });

    function toggleChat(){

        let box =
            document.getElementById("chat-container");

        if(box.style.display === "block"){
            box.style.display = "none";
        }else{
            box.style.display = "block";
        }
    }

    function minimizeChat(){

        let body =
            document.getElementById("chat-body");

        let footer =
            document.getElementById("chat-footer");

        if(!minimized){

            body.style.display="none";
            footer.style.display="none";

            document.getElementById("chat-container")
                .style.height="60px";

            minimized=true;

        }else{

            body.style.display="block";
            footer.style.display="flex";

            document.getElementById("chat-container")
                .style.height="550px";

            minimized=false;
        }
    }

    function maximizeChat(){

        document.getElementById("chat-container")
            .classList.toggle("maximized");
    }

    function clearChat(){

        document.getElementById("chat-body").innerHTML=
            '<div class="bot-msg"><strong>Bot:</strong> Chat cleared.</div>';
    }

    function sendMsg(){

        let input =
            document.getElementById("userInput");

        let msg =
            input.value.trim();

        if(msg===""){
            return;
        }

        let chatBody =
            document.getElementById("chat-body");

        chatBody.innerHTML +=
            '<div class="user-msg"><strong>You:</strong> '
            + msg +
            '</div>';

        chatBody.innerHTML +=
            '<div id="typing" class="bot-msg typing"><strong>Bot:</strong> Typing...</div>';

        chatBody.scrollTop =
            chatBody.scrollHeight;

        input.value="";

        fetch("/api/chat",{

            method:"POST",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify({
                message:msg
            })

        })
            .then(response => response.json())
            .then(data => {

                let typing =
                    document.getElementById("typing");

                if(typing){
                    typing.remove();
                }

                chatBody.innerHTML +=
                    '<div class="bot-msg"><strong>Bot:</strong> '
                    + data.reply +
                    '</div>';

                chatBody.scrollTop =
                    chatBody.scrollHeight;
            })
            .catch(error => {

                let typing =
                    document.getElementById("typing");

                if(typing){
                    typing.remove();
                }

                chatBody.innerHTML +=
                    '<div class="bot-msg"><strong>Bot:</strong> Server Error</div>';

                console.error(error);
            });
    }

</script>