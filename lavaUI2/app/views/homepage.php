<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Classes - Gym Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', Arial, sans-serif;
        }
        .sidebar {
            background-color: #343a40;
            height: 100vh;
            padding-top: 20px;
            position: fixed;
            width: 250px;
            color: #fff;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            color: #fff;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .sidebar a .icon {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        .table-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        table th {
            background-color: #f4f4f4;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a.btn-action {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="navbar-brand mx-3 mb-4">
            <strong>Perfect Fitness Gym</strong>
        </a>
        <a class="nav-link" href="#">
            <span class="icon"><i class="fas fa-user"></i></span>
            <?=html_escape(get_username(get_user_id()));?>
        </a>
        <a href="#">
            <span class="icon"><i class="fas fa-tachometer-alt"></i></span> Dashboard
        </a>
        <a href="user/display">
            <span class="icon"><i class="fas fa-users"></i></span> Members
        </a>
        <a href="#">
            <span class="icon"><i class="fas fa-clipboard-list"></i></span> Manage Membership Application
        </a>
        <a href="memberships/display">
            <span class="icon"><i class="fas fa-clipboard-list"></i></span> Manage Membership Plan
        </a>
        <a href="memberships/apply">
            <span class="icon"><i class="fas fa-plus-circle"></i></span> Add Membership Plan
        </a>
        <a href="class/display">
            <span class="icon"><i class="fas fa-dumbbell"></i></span> Manage Class
        </a>
        <a href="#">
            <span class="icon"><i class="fas fa-calendar-alt"></i></span> Scheduled Classes
        </a>
        <a href="#">
            <span class="icon"><i class="fas fa-money-bill-wave"></i></span> Received Payments
        </a>
        <a href="terms/display">
            <span class="icon"><i class="fas fa-clipboard-list"></i></span> Manage Terms & Conditions
        </a>
        <a href="<?=site_url('auth/logout');?>" class="mt-auto">
            <span class="icon"><i class="fas fa-sign-out-alt"></i></span> Logout
        </a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <div class="container">
            
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
