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
Route::get('/dashboard','AdminController@show_dashboard');
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

