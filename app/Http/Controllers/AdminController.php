<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
use Promocodes;
session_start();
class AdminController extends Controller
{
    public function index(){
    	return view('admin_login');
    }
    
    public function dashboard(Request $request)
    {
    	$admin_email = $request->admin_email;
    	$admin_password = md5($request->admin_password);
    	$result =DB::table('tbl_admin')
    	            ->where('admin_email', $admin_email)
    	            ->where('admin_password', $admin_password)
    	            ->first();
    				if ($result){
    					Session::put('admin_name', $result->admin_name);
    					Session::put('admin_id', $result->admin_id);
    					return Redirect::to('/dashboard');
    				}else{
    					Session::put('message','Email or Password Invalid');
    					return Redirect::to('/admin');
    				}
    }

    public function add_promo_code()
    {
        return view('admin.add_promo_code');
    }
    public function save_promo_code(Request $request)
    {
        $data = array();
        $promo_data = array();
        $promo_data['amount'] = $request->amount;
        $promo_data['reward'] = $request->reward;
        $promo_data['expires_in'] = $request->expires_in;
        $promo_data['quantity'] = $request->quantity;

        $done = Promocodes::create($amount = $promo_data['amount'], $reward = $promo_data['reward'],  $data = ['null'], $expires_in = $promo_data['expires_in'], $quantity = $promo_data['quantity'], $is_disposable = false);
        if ($done){
                        Session::put('message','Promocodes Generated');
                        return Redirect::to('/add-promo-code');
                    }else{
                        Session::put('message','Some error occured.');
                        return Redirect::to('/add-promo-code');
                    }
    }

    public function show_promo_code()
    {
        $all_promo_info  = Promocodes::all();
        $manage_category    = view('admin.show_promo_code')
                ->with('all_promo_info',$all_promo_info);

        return view('admin_layout')
                ->with('admin.show_promo_code',$manage_category);
    }

    public function delete_promo_code($id)
    {
        DB::table('promocodes')
                    ->where('id', $id)
                    ->delete();
                    Session::put('message','Promo code deleted successfully.');
                    return Redirect::to('/show-promo-code');
    }
}