<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    overflow: hidden;
}

section {
    display: flex;
    min-height: 100vh;
    align-items: center;
    justify-content: center;
    background: linear-gradient(to bottom, #f7f7fe, #dff1ff);
}

section .colour {
    position: absolute;
    filter: blur(150px);
}

section .colour:nth-child(1) {
    top: -350px;
    width: 600px;
    height: 600px;
    background: #bf4ad4;
}

section .colour:nth-child(2) {
    left: 100px;
    width: 500px;
    height: 500px;
    bottom: -150px;
    background: #ffa500;
}

section .colour:nth-child(3) {
    right: 100px;
    bottom: 50px;
    width: 300px;
    height: 300px;
    background: #2b67f3;
}

.box {
    position: relative;
}

.box .square {
    position: absolute;
    border-radius: 10px;
    backdrop-filter: blur(5px);
    background: rgba(255, 255, 255, 0.1);
    animation-delay: calc(-1s * var(--i));
    animation: animate 10s linear infinite;
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-right: 1px solid rgba(255, 255, 255, 0.2);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

@keyframes animate {

    0%,
    100% {
        transform: translateY(-40px);
    }

    50% {
        transform: translateY(40px);
    }
}

.box .square:nth-child(1) {
    top: -50px;
    left: -60px;
    width: 100px;
    height: 100px;
}

.box .square:nth-child(2) {
    z-index: 2;
    top: 150px;
    left: -100px;
    width: 120px;
    height: 120px;
}

.box .square:nth-child(3) {
    z-index: 2;
    width: 80px;
    height: 80px;
    right: -50px;
    bottom: -60px;
}

.box .square:nth-child(4) {
    left: 100px;
    width: 50px;
    height: 50px;
    bottom: -80px;
}

.box .square:nth-child(5) {
    top: -80px;
    left: 140px;
    width: 60px;
    height: 60px;
}

.container {
    width: 400px;
    display: flex;
    min-height: 400px;
    position: relative;
    border-radius: 10px;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(5px);
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-right: 1px solid rgba(255, 255, 255, 0.2);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.form {
    width: 100%;
    height: 100%;
    padding: 40px;
    position: relative;
}

.form h2 {
    color: #fff;
    font-size: 24px;
    font-weight: 600;
    position: relative;
    letter-spacing: 1px;
    margin-bottom: 40px;
}

.form h2::before {
    left: 0;
    width: 80px;
    height: 4px;
    content: "";
    bottom: -10px;
    background: #fff;
    position: absolute;
}

.form .input__box {
    width: 100%;
    margin-top: 20px;
}

.form .input__box input {
    width: 100%;
    color: #fff;
    border: none;
    outline: none;
    font-size: 16px;
    padding: 10px 20px;
    letter-spacing: 1px;
    border-radius: 35px;
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.5);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    border-right: 1px solid rgba(255, 255, 255, 0.2);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.form::placeholder {
    color: #fff;
}

.form .input__box input[type="submit"] {
    color: #666;
    cursor: pointer;
    background: #fff;
    max-width: 100px;
    font-weight: 600;
    margin-bottom: 20px;
}

.forget {
    color: #fff;
    margin-top: 5px;
}

.forget a {
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.form .input__box button {
    color: #000000;
    cursor: pointer;
    background: #ffffff;
    max-width: 100px;
    font-weight: 600;
    margin-bottom: 20px;
    padding: 10px 20px;
    border: none;
    border-radius: 35px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: background 0.3s ease;

}
    </style>
    <section>
        <div class="colour"></div>
        <div class="colour"></div>
        <div class="colour"></div>
            <div class="square" style="--i: 0"></div>
            <div class="square" style="--i: 1"></div>
            <div class="square" style="--i: 2"></div>
            <div class="square" style="--i: 3"></div>
            <div class="square" style="--i: 4"></div>
            <div class="container">
                <div class="container">
                    <div class="form">
                        <h2>Login Form</h2>
                        <form id="loginForm">
                            <div class="input__box">
                                <input type="text" id="username" name="username" placeholder="Username" required />
                            </div>
                            <div class="input__box">
                                <input type="password" id="password" name="password" placeholder="Password" required />
                            </div>
                            <div class="input__box">
                                <button type="button" onclick="validateAndRedirect()">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    
        <script>
            function validateAndRedirect() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
    
                if (username === "admin@gmail.com" && password === "admin123") {
                    alert("Admin Logged in Successfully!!!");
                    window.location.href = "admindash.jsp";
                } else {
                    alert("Invalid username or password. Please try again.");
                }
            }
        </script>
</body>
</html>