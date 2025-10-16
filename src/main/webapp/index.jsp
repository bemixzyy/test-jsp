<%@ page import="java.util.*,com.t2404.test.entity.Player" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Player Management</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: "Segoe UI", sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .table-container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>🏆 Player Management</h3>
            <a href="views/add-player.jsp" class="btn btn-primary">+ Add Player</a>
        </div>

        <table id="playerTable" class="table table-striped table-bordered">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Full Name</th>
                <th>Age</th>
                <th>Index ID</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Player> players = (List<Player>) request.getAttribute("players");
                if (players != null && !players.isEmpty()) {
                    for (Player p : players) {
            %>
            <tr>
                <td><%=p.getPlayerId()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getFullName()%></td>
                <td><%=p.getAge()%></td>
                <td><%=p.getIndexId()%></td>
                <td>
                    <a href="edit-player.jsp?id=<%=p.getPlayerId()%>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="delete-player?id=<%=p.getPlayerId()%>" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this player?');">
                        Delete
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="6" class="text-center">No players found</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#playerTable').DataTable({
            responsive: true,
            pageLength: 5,
            lengthChange: false,
            ordering: true,
            language: {
                search: "🔍 Search:",
                paginate: { previous: "Prev", next: "Next" },
                info: "Showing _START_ to _END_ of _TOTAL_ players"
            }
        });
    });
</script>
</body>
</html>
