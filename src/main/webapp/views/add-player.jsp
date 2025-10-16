<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm người chơi mới</title>

    <!-- CKEditor -->
    <script src="https://cdn.ckeditor.com/ckeditor5/41.1.0/classic/ckeditor.js"></script>

    <style>
        body {
            background-color: #0f172a;
            color: #e2e8f0;
            font-family: Arial, sans-serif;
        }
        main {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background: rgba(30, 41, 59, 0.8);
            border-radius: 16px;
            border: 1px solid #334155;
        }
        h1 {
            color: #f1f5f9;
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 6px;
            color: #cbd5e1;
            font-weight: 500;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #475569;
            background: #1e293b;
            color: white;
        }
        button {
            margin-top: 25px;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #3b82f6;
            color: white;
        }
        .btn-secondary {
            background-color: #64748b;
            color: white;
        }
        .btn-group {
            display: flex;
            gap: 10px;
        }
        .msg-error {
            color: #f87171;
            font-size: 13px;
            margin-top: 4px;
        }
    </style>
</head>
<body>
<main>
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
            <h1>Thêm người chơi mới</h1>
            <p>Nhập thông tin chi tiết về người chơi trong BattleGame</p>
        </div>
        <a href="index.jsp" style="color: #60a5fa; text-decoration: none;">⬅ Quay lại</a>
    </div>

    <form id="playerForm" action="add-player" method="post">
        <label for="playerName">Tên người chơi *</label>
        <input type="text" id="playerName" name="name" placeholder="Nhập tên người chơi...">
        <div class="msg-error" id="error-playerName"></div>

        <label for="level">Cấp độ *</label>
        <input type="number" id="level" name="level" placeholder="Nhập cấp độ (VD: 1)" min="1">
        <div class="msg-error" id="error-level"></div>

        <label for="experience">Kinh nghiệm *</label>
        <input type="number" id="experience" name="experience" placeholder="Nhập điểm kinh nghiệm" min="0">
        <div class="msg-error" id="error-experience"></div>

        <label for="description">Mô tả</label>
        <textarea id="description" name="description" rows="4" placeholder="Mô tả thêm về người chơi..."></textarea>

        <div class="btn-group">
            <button type="submit" class="btn-primary">Thêm người chơi</button>
            <button type="button" class="btn-secondary" onclick="resetForm()">Làm mới</button>
        </div>
    </form>
</main>

<script>
    const form = document.getElementById("playerForm");

    function setError(id, msg) {
        const input = document.getElementById(id);
        const errorMsg = document.getElementById("error-" + id);
        if (input) input.classList.add("error");
        if (errorMsg) {
            errorMsg.textContent = msg;
            errorMsg.style.display = "block";
        }
    }

    function clearError(id) {
        const input = document.getElementById(id);
        const errorMsg = document.getElementById("error-" + id);
        if (input) input.classList.remove("error");
        if (errorMsg) {
            errorMsg.textContent = "";
            errorMsg.style.display = "none";
        }
    }

    form.addEventListener("submit", function (e) {
        let valid = true;

        const name = document.getElementById("playerName").value.trim();
        const level = document.getElementById("level").value.trim();
        const exp = document.getElementById("experience").value.trim();

        ["playerName", "level", "experience"].forEach(clearError);

        if (name.length < 3) {
            valid = false;
            setError("playerName", "Tên người chơi phải có ít nhất 3 ký tự.");
        }

        if (level === "" || isNaN(level) || Number(level) < 1) {
            valid = false;
            setError("level", "Cấp độ phải lớn hơn hoặc bằng 1.");
        }

        if (exp === "" || isNaN(exp) || Number(exp) < 0) {
            valid = false;
            setError("experience", "Kinh nghiệm phải là số không âm.");
        }

        if (!valid) e.preventDefault();
    });

    function resetForm() {
        form.reset();
        ["playerName", "level", "experience"].forEach(clearError);
    }
</script>
</body>
</html>
