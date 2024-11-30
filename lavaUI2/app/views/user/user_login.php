<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Login - Fitness Gym Administrator</title>
    <link rel="icon" type="image/png" href="<?=base_url();?>public/img/favicon.ico"/>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">
    <!-- Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?=base_url();?>public/css/main.css" rel="stylesheet">
    <link href="<?=base_url();?>public/css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.1);
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: 600;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-md navbar-light bg-white">
        <div class="container">
            <a class="navbar-brand" href="<?=site_url();?>">
                Fitness Gym Administrator
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav me-auto">
                </ul>
                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ms-auto">
                    <!-- Authentication Links -->
                    <li class="nav-item">
                        <a class="nav-link" href="<?=site_url('user/user_login');?>">Login</a>
                    </li>                       
                    <li class="nav-item">
                        <a class="nav-link" href="<?=site_url('user/user_register');?>">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="py-4 flex-grow-1">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">User Login</div>
                        <div class="card-body">
                            <?php flash_alert(); ?>
                            <form id="logForm" method="POST" action="<?=site_url('user/user_login');?>">
                                <?php csrf_field(); ?>
                                <div class="row mb-3">
                                    <label for="username" class="col-md-4 col-form-label text-md-end">Username</label>
                                    <div class="col-md-6">
                                        <input id="username" type="text" class="form-control" name="uname" minlength="5" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="email" class="col-md-4 col-form-label text-md-end">Email Address</label>
                                    <div class="col-md-6">
                                        <?php $LAVA =& lava_instance(); ?>
                                        <input id="email" type="email" class="form-control <?=$LAVA->session->flashdata('is_invalid');?>" name="email" value="" required autocomplete="email" autofocus>
                                        <span class="invalid-feedback" role="alert">
                                            <strong><?php echo $LAVA->session->flashdata('err_message'); ?></strong>
                                        </span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="password" class="col-md-4 col-form-label text-md-end">Password</label>
                                    <div class="col-md-6">
                                        <input id="password" type="password" class="form-control" name="password" minlength="8" required autocomplete="current-password">
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Login
                                        </button>
                                        <a href="<?=site_url('user/user_password-reset');?>" class="btn btn-link">
                                            Forgot Your Password?
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="mt-auto">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Fitness Gym Administrator</h5>
                    <p>Manage your gym efficiently with our administrator tools.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Home</a></li>
                        <li><a href="#" class="text-white">About</a></li>
                        <li><a href="#" class="text-white">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Contact Us</h5>
                    <address>
                        123 Gym Street<br>
                        Fitness City, FC 12345<br>
                        Phone: (123) 456-7890
                    </address>
                </div>
            </div>
            <hr class="bg-white">
            <div class="text-center">
                <p>&copy; 2023 Fitness Gym Administrator. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
    <script>
        $(function() {
            var logForm = $("#logForm")
            if(logForm.length) {
                logForm.validate({
                    rules: {
                        email: {
                            required: true,
                        },
                        password: {
                            required: true,
                        }
                    },
                    messages: {
                        email: {
                            required: "Please input your email address.",                            
                        },
                        password: {
                            required: "Please input your password.",  
                        }
                    },
                })
            }
        })
    </script>
</body>
</html>