<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
session_start();

class SliderController extends Controller
{
    public function index()
    {
    	return view('admin.add_slider');
    }
    public function save_slider(Request $request)
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
    	$data['publication_status'] 		= $request->publication_status;

    	$image = $request->file('slider_image');
    	if ($image) {
    		$image_name 	 = generate_string($permitted_chars, 20);
    		$ext 			 = strtolower($image->getClientOriginalExtension());
    		$image_full_name = $image_name. '.' .$ext;
    		$upload_path	 = 'slider/';
    		$image_url		 = $upload_path . $image_full_name;
    		$success		 = $image->move($upload_path, $image_full_name);
    		if ($success) {
    			$data['slider_image'] = $image_url;

    			DB::table('tbl_slider')->insert($data);
    			Session::put('message','Slider added successfully.');
    			return Redirect::to('/add-slider');
    		}
    	}
    	$data['slider_image'] = '';
    				DB::table('tbl_slider')->insert($data);
    				SSession::put('message','Slider added successfully without image.');
    				return Redirect::to('/add-slider');
    }

    public function all_slider()
    {
    	$all_slider	= DB::table('tbl_slider')->get();
    	$manage_slider 	= view('admin.all_slider')
    			->with('all_slider',$all_slider);

    	return view('admin_layout')
    			->with('admin.all_slider',$manage_slider);

    }
    public function unactive_slider($slider_id)
    {
    	DB::table('tbl_slider')
    			->where('slider_id',$slider_id)
    			->update(['publication_status'=>0]);
    			Session::put('message','slider deactivation successful.');
    			return Redirect::to('/all-slider');
    }
    public function active_slider($slider_id)
    {
    	DB::table('tbl_slider')
    			->where('slider_id',$slider_id)
    			->update(['publication_status'=>1]);
    			Session::put('message','slider activation successful.');
    			return Redirect::to('/all-slider');
    }
    public function delete_slider($slider_id)
    {
    	DB::table('tbl_slider')
    				->where('slider_id', $slider_id)
    				->delete();
    				Session::put('message','slider deleted successfully.');
    				return Redirect::to('/all-slider');
    }
}
