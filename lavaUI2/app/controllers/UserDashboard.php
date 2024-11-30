<?php
defined('PREVENT_DIRECT_ACCESS') OR exit('No direct script access allowed');

class UserDashboard extends Controller {

    public function __construct() {
        parent::__construct();
        
        if(! logged_in()) {
            redirect('user');
        }
    }

	public function index() {
        
        $this->call->view('user_dashboard');
    }
}
?>
