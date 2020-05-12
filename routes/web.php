<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//frontend site..............................
Route::get('/','HomeController@index');











//backendsite.................................
Route::get('/logout','SuperAdminController@logout');
Route::get('/admin','AdminController@index');
Route::get('/dashboard','SuperAdminController@index');
Route::post('/admin-dashboard','AdminController@dashboard');

//category related routes
Route::get('/add-category', 'CategoryController@index');
Route::get('/all-category', 'CategoryController@all_category');
Route::post('/save-category', 'CategoryController@save_category');
Route::get('/unactive_category/{category_id}', 'CategoryController@unactive_category');			//deactivate
Route::get('/active_category/{category_id}', 'CategoryController@active_category');				//activate
Route::get('/edit_category/{category_id}', 'CategoryController@edit_category');					//edit
Route::post('/update_category/{category_id}', 'CategoryController@update_category');				//update
Route::get('/delete_category/{category_id}', 'CategoryController@delete_category');				//delete



//manufacture or brands route are here
Route::get('/add-manufacture', 'ManufactureController@index');
Route::post('/save-manufacture', 'ManufactureController@save_manufacture');
Route::get('/all-manufacture', 'ManufactureController@all_manufacture');
Route::get('/delete_manufacture/{manufacture_id}', 'ManufactureController@delete_manufacture');	

Route::get('/unactive_manufacture/{manufacture_id}', 'ManufactureController@unactive_manufacture');			//deactivate
Route::get('/active_manufacture/{manufacture_id}', 'ManufactureController@active_manufacture');				//activate
Route::get('/edit_manufacture/{manufacture_id}', 'ManufactureController@edit_manufacture');					//edit

Route::post('/update_manufacture/{manufacture_id}', 'ManufactureController@update_manufacture');



//products routes are here
Route::get('/add-product', 'ProductController@index');
Route::post('/save-product', 'ProductController@save_product');
Route::get('/all-product', 'ProductController@all_product');
Route::get('/unactive_product/{product_id}', 'ProductController@unactive_product');	
Route::get('/active_product/{product_id}', 'ProductController@active_product');
Route::get('/delete_product/{product_id}', 'ProductController@delete_product');	


//slider route are here
Route::get('/add-slider', 'SliderController@index');
Route::get('/all-slider', 'SliderController@all_slider');
Route::post('/save-slider', 'SliderController@save_slider');
Route::get('/unactive_slider/{slider_id}', 'SliderController@unactive_slider');	
Route::get('/active_slider/{slider_id}', 'SliderController@active_slider');
Route::get('/delete_slider/{slider_id}', 'SliderController@delete_slider');	