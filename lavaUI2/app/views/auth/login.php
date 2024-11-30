<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>  
    <link rel="icon" type="image/png" href="<?=base_url();?>public/img/favicon.ico"/>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <!-- Styles -->
    <link href="<?=base_url();?>public/css/main.css" rel="stylesheet">
    <link href="<?=base_url();?>public/css/style.css" rel="stylesheet">
</head>
<style>
    /* Full-height layout */
    body, html {
        height: 100%;
        margin: 0;
    }

    /* Left column with navbar styling */
    .left-column {
        background-color: #f8f9fa;
        padding: 20px;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    /* Right column styling */
    .right-column {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    /* Card styling */
    .card {
        width: 100%;
        max-width: 500px;
        border-radius: 8px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    }
</style>
<body><nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
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
                    <a class="nav-link" href="<?=site_url('auth/login');?>">Login</a>
                </li>                       
                <li class="nav-item">
                    <a class="nav-link" href="<?=site_url('auth/register');?>">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <main class="py-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Login</div>
                        <div class="card-body">
                          	<?php flash_alert() ;?>
                            <form id="logForm" method="POST" action="<?=site_url('auth/login');?>">
                                <?php csrf_field(); ?>
                                <div class="row mb-3">
                                    <label for="email" class="col-md-4 col-form-label text-md-end">Email Address</label>
                                    <div class="col-md-6">
                                        <?php $LAVA =& lava_instance(); ?>
                                        <input id="email" type="email" class="form-control <?=$LAVA->session->flashdata('is_invalid');?>" name="email" value="" required autocomplete="email" autofocus>
                                        <span class="invalid-feedback" role="alert">
                                            <strong> <?php echo $LAVA->session->flashdata('err_message'); ?></strong>
                                        </span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="password" class="col-md-4 col-form-label text-md-end">Password</label>

                                    <div class="col-md-6">
                                        <input id="password" type="password" class="form-control " name="password" minlength="8" required autocomplete="current-password">
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Login
                                        </button><br><br>
                                        
                                        
                                        <a href="<?=site_url('auth/password-reset');?>">
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
