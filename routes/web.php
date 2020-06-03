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

// show category wise product here
Route::get('/product_by_category/{category_id}','HomeController@show_product_by_category');
Route::get('/product_by_manufacture/{manufacture_id}','HomeController@show_product_by_manufacture');
Route::get('/view_product/{product_id}','HomeController@product_details_by_id');




//cart routes are here...........................
Route::post('/add-to-cart','CartController@add_to_cart');
Route::get('/show_cart','CartController@show_cart');
Route::get('/delete-to-cart/{rowId}','CartController@delete_to_cart');
Route::post('/update_cart','CartController@update_cart');


//customer login and logout
Route::get('/customer_logout/{customer_id}','CheckoutController@customer_logout');
Route::post('/customer_login','CheckoutController@customer_login');
Route::get('/search_result','HomeController@search_result');


//checkout routes are here..............

Route::get('/login-check','CheckoutController@login_check');
Route::post('/customer_registration','CheckoutController@customer_registration');
Route::get('/checkout','CheckoutController@checkout');
Route::post('/save-shipping-details','CheckoutController@save_shipping_details');
Route::get('/payment','CheckoutController@payment');
Route::post('/order-place','CheckoutController@order_place');



//about and contact page.............

Route::get('/about','HomeController@about');
Route::get('/contact','HomeController@contact');






//backendsite.................................
Route::get('/logout','SuperAdminController@logout');
Route::get('/admin','AdminController@index');
Route::get('/dashboard','SuperAdminController@index');
Route::post('/admin-dashboard','AdminController@dashboard');

Route::get('/manage-order','CheckoutController@manage_order');
Route::get('/view-order/{order_id}','CheckoutController@view_order');
Route::post('/update-total','CheckoutController@update_total');


Route::get('/unactive_order/{order_id}', 'CheckoutController@unactive_order');			//deactivate
Route::get('/active_order/{order_id}', 'CheckoutController@active_order');
Route::get('/add-promo-code', 'AdminController@add_promo_code');
Route::get('/show-promo-code', 'AdminController@show_promo_code');
Route::post('/save-promo-code', 'AdminController@save_promo_code');
Route::get('/delete-promo-code/{id}', 'AdminController@delete_promo_code');




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

Route::get('/all_shops', 'ManufactureController@all_shops');


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