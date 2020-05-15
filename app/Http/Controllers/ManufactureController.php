<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class ManufactureController extends Controller
{
    public function index()
    {
    	return view('admin.add_manufacture'); 
    }

    public function save_manufacture(Request $request)
    {
    	$permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
         function generate_string($input, $strength = 16) {
            $input_length = strlen($input);
            $random_string = '';
            for($i = 0; $i < $strength; $i++) {
            $random_character = $input[mt_rand(0, $input_length - 1)];
            $random_string .= $random_character;
            }
 
            return $random_string;
        }



        $data = array();
    			$data['manufacture_id'] = $request->manufacture_id;
    			$data['manufacture_name'] = $request->manufacture_name;
    			$data['manufacture_description'] = $request->manufacture_description;
    			$data['publication_status'] = $request->publication_status;

    			
    			
                $image = $request->file('manufacture_logo');
                if ($image) {
                    $image_name      = generate_string($permitted_chars, 20);
                    $ext             = strtolower($image->getClientOriginalExtension());
                    $image_full_name = $image_name. '.' .$ext;
                    $upload_path     = 'image/';
                    $image_url       = $upload_path . $image_full_name;
                    $success         = $image->move($upload_path, $image_full_name);
                    if ($success) {
                        $data['manufacture_logo'] = $image_url;

                        DB::table('tbl_manufacture')->insert($data);
            			Session::put('message','Manufacture added successfully.');
            			return Redirect::to('/add-manufacture'); 
                }

                
            }
            $data['manufacture_logo'] = '';
                DB::table('tbl_manufacture')->insert($data);
                Session::put('message','Manufacture added without logo successfully.');
                return Redirect::to('/add-manufacture'); 

    }


    public function all_manufacture()
    {
    	
    	$all_manufacture_info	= DB::table('tbl_manufacture')->get();
    	$manage_manufacture 	= view('admin.all_manufacture')
    			->with('all_manufacture_info',$all_manufacture_info);

    	return view('admin_layout')
    			->with('admin.all_manufacture',$manage_manufacture);

    			

    	// return view('admin.all_category');
    }

    public function all_shops()
    {
        
        $all_manufacture_info   = DB::table('tbl_manufacture')->get();
        $manage_manufacture     = view('pages.all_shops')
                ->with('all_manufacture_info',$all_manufacture_info);

        return view('layout')
                ->with('pages.all_shops',$manage_manufacture);

                

        // return view('admin.all_category');
    }

    public function delete_manufacture($manufacture_id)
    {
    	DB::table('tbl_manufacture')
    				->where('manufacture_id', $manufacture_id)
    				->delete();
    				Session::put('message','Manufacture deleted successfully.');
    				return Redirect::to('/all-manufacture');
    }

    public function unactive_manufacture($manufacture_id)
    {
    	DB::table('tbl_manufacture')
    			->where('manufacture_id',$manufacture_id)
    			->update(['publication_status'=>0]);
    			Session::put('message','manufacture deactivation successful.');
    			return Redirect::to('/all-manufacture');
    }

    public function active_manufacture($manufacture_id)
    {
    	DB::table('tbl_manufacture')
    			->where('manufacture_id',$manufacture_id)
    			->update(['publication_status'=>1]);
    			Session::put('message','manufacture activation successful.');
    			return Redirect::to('/all-manufacture');
    }

    public function edit_manufacture($manufacture_id)
    {
    	$manufacture_info = DB::table('tbl_manufacture')
    				->where('manufacture_id',$manufacture_id)
    				->first();
    	$manufacture_info 	= view('admin.edit_manufacture')
    			->with('manufacture_info',$manufacture_info);
    	return view('admin_layout')
    			->with('admin.edit_manufacture',$manufacture_info);

    	// return view('admin.edit_category');
    }

    public function update_manufacture(Request $request,$manufacture_id)
    {
    	$data = array();
    	$data['manufacture_name'] = $request->manufacture_name;
    	$data['manufacture_description'] = $request->manufacture_description;

    	DB::table('tbl_manufacture')
    				->where('manufacture_id',$manufacture_id)
    				->update($data);

    				Session::put('message','manufacture updated successfully.');
    				return Redirect::to('/all-manufacture');
    }

  
}
