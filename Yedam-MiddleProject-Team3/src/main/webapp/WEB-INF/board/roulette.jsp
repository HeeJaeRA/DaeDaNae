<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Roulette Event</title>
  <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

    * {
      font-family: Pretendard;
    }

    body {
      background: #f7f8fc;
      height: 960px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    canvas {
      margin-top: 100px;
      transition: 2s;
    }

    button {
      z-index: 1000;
      background: #febf00;
      margin-top: 1rem;
      padding: .8rem 1.8rem;
      border: none;
      font-size: 1.5rem;
      font-weight: bold;
      border-radius: 5px;
      transition: .2s;
      cursor: pointer;
    }

    button:active {
      background: #444;
      color: #f9f9f9;
    }

    #menu {
      display: flex;
      align-items: center;
      text-align: center;
      flex-direction: column;
      position: relative;
    }

    #menu::before {
      content: "";
      position: absolute;
      width: 10px;
      height: 50px;
      border-radius: 5px;
      background: #000;
      top: -20px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 22;
    }

    #addDiv {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <!-- Roulette UI -->
  <div id="menu">
    <canvas width="600" height='600'></canvas>
    <button onclick="rotate()">돌려돌려 돌림판</button>
    <div id="addDiv">
      <input type="text" id="menuAdd">
      <button onclick="add()">쿠폰 추가</button>
    </div>
  </div>

  <!-- JavaScript for roulette logic -->
  <script>
    const $c = document.querySelector("canvas");
    const ctx = $c.getContext('2d');
    const menuAdd = document.querySelector('#menuAdd');
    const product = ["쿠폰A", "쿠폰B", "쿠폰C"];
    const colors = [];

    const newMake = () => {
      const [cw, ch] = [$c.width / 2, $c.height / 2];
      const arc = Math.PI / (product.length / 2);

      for (let i = 0; i < product.length; i++) {
        ctx.beginPath();
        if (colors.length == 0) {
          for (var l = 0; l < product.length; l++) {
            let r = Math.floor(Math.random() * 256);
            let g = Math.floor(Math.random() * 256);
            let b = Math.floor(Math.random() * 256);
            colors.push("rgb(" + r + "," + g + "," + b + ")");
          }
        }
        ctx.fillStyle = colors[i % (colors.length)];
        ctx.moveTo(cw, ch);
        ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
        ctx.fill();
        ctx.closePath();
      }

      ctx.fillStyle = "#fff";
      ctx.font = "18px Pretendard";
      ctx.textAlign = "center";

      for (let i = 0; i < product.length; i++) {
        const angle = (arc * i) + (arc / 2);

        ctx.save();

        ctx.translate(
          cw + Math.cos(angle) * (cw - 50),
          ch + Math.sin(angle) * (ch - 50)
        );

        ctx.rotate(angle + Math.PI / 2);

        product[i].split(" ").forEach((text, j) => {
          ctx.fillText(text, 0, 30 * j);
        });

        ctx.restore();
      }
    }

    const rotate = () => {
      $c.style.transform = `initial`;
      $c.style.transition = `initial`;
      const alpha = Math.floor(Math.random() * 100);

      setTimeout(() => {
        const ran = Math.floor(Math.random() * product.length);
        const arc = 360 / product.length;
        const rotate = (ran * arc) + 3600 + (arc * 3) - (arc / 4) + alpha;
        $c.style.transform = `rotate(-${rotate}deg)`;
        $c.style.transition = `2s`;
      }, 1);
    };

    function add() {
      if (menuAdd.value != undefined && menuAdd.value != "") {
        product.push(menuAdd.value);
        let r = Math.floor(Math.random() * 256);
        let g = Math.floor(Math.random() * 256);
        let b = Math.floor(Math.random() * 256);
        colors.push("rgb(" + r + "," + g + "," + b + ")");
        newMake();
        menuAdd.value = "";
      } else {
        alert("쿠폰을 입력한 후 버튼을 클릭 해 주세요");
      }
    }

    newMake();
  </script>
</body>
</html>
