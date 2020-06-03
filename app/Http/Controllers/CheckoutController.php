<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use Session;
use Cart;

use Illuminate\Support\Facades\Redirect;

class CheckoutController extends Controller
{
    public function login_check()
    {
    	return view('pages.login');
    }
    public function customer_registration(Request $request)
    {
    	$data = array();
    	$data['customer_name'] = $request->customer_name;
    	$data['customer_email'] = $request->customer_email;
    	$data['password'] = md5($request->password);
    	$data['mobile_number'] = $request->mobile_number;

    	$customer_id = DB::table('tbl_customer')
    					->insertGetId($data);

    			Session::put('customer_id',$customer_id);
    			Session::put('customer_name',$request->customer_name);

    			return Redirect('/');
    }

    public function checkout()
    {
    	return view('pages.checkout');
    }

    public function save_shipping_details(Request $request)
    {
        $data = array();
        $data['shipping_email']             = $request->shipping_email;
        $data['shipping_first_name']        = $request->shipping_first_name;
        $data['shipping_last_name']         = $request->shipping_last_name;
        $data['shipping_address']           = $request->shipping_address;
        $data['shipping_mobile_number']     = $request->shipping_mobile_number;
        $data['shipping_city']              = $request->shipping_city;

        // echo "<pre>";
        // print_r($data);
        // echo "</pre>";
        $shipping_id = DB::table('tbl_shipping')
                            ->insertGetId($data);
                        Session::put('shipping_id', $shipping_id);
                        return Redirect::to('/payment');

    }


    public function customer_login(Request $request)
    {
        $customer_email = $request->customer_email;
        $password = md5($request->password);

        $result = DB::table('tbl_customer')
                        ->where('customer_email',$customer_email)
                        ->where('password',$password)
                        ->first();

                        if($result)
                        {
                            Session::put('customer_id',$result->customer_id);
                            return Redirect::to('/');
                        }else{
                            Session::put('message','Email or password does not match!');
                            return Redirect::to('/login-check');
                        }
    }

    public function customer_logout($customer_id)
    {
        Session::flush();
        Cart::destroy();
        return Redirect::to('/');
    }

    public function payment()
    {
        $all_published_category = DB::table('tbl_category')
                                    ->where('publication_status',1)
                                    ->get();
        $manage_published_category = view('pages.payment')
                                    ->with('all_published_category', $all_published_category);
        return view('layout')
            ->with('pages.payment', $manage_published_category);
    }

    public function order_place(Request $request)
    {
        $payment_method = $request->payment_method;
        $pdata = array();
        $pdata['payment_method'] = $payment_method;
        $pdata['payment_status'] = 'Pending';

        $payment_id = DB::table('tbl_payment')
                    ->insertGetId($pdata);

        $final_total = Session::get('final_cart_total');
        

        $odata = array();
        $odata['customer_id'] = Session::get('customer_id');
        $odata['shipping_id'] = Session::get('shipping_id');
        $odata['payment_id'] = $payment_id;
        $odata['order_total'] = $final_total;
        $odata['order_status'] = 'Pending';

        $order_id = DB::table('tbl_order')
                ->insertGetId($odata);

        $contents = Cart::content();
        $oddata = array();

        foreach ($contents as $key ) {
            $oddata['order_id'] = $order_id;
            $oddata['product_id'] = $key->id;
            $oddata['product_name'] = $key->name;
            $oddata['product_price'] = $key->price;
            $oddata['product_sales_quantity'] = $key->qty;

            DB::table('tbl_order_details')
            ->insert($oddata);
        }

        if($payment_method == 'handcash')
        {
            Cart::destroy();
            return view('pages.handcash');

        }
        elseif ($payment_method == 'debitcard') {
            echo "Order placed success with debitcard";
        }elseif($payment_method == 'bkash'){
            echo "Order placed success with bkash";
        }else{
            echo "NOT SELECTED";
        }

    }


    public function manage_order()
    {
        $all_order_info   = DB::table('tbl_order')
                                ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id') 
                                ->select('tbl_order.*','tbl_customer.customer_name')                      
                                ->get();
        $manage_order     = view('admin.manage_order')
                ->with('all_order_info',$all_order_info);

        return view('admin_layout')
                ->with('admin.manage_order',$manage_order);
    }


    public function unactive_order($order_id)
    {
        DB::table('tbl_order')
                ->where('order_id',$order_id)
                ->update(['order_status'=>'Successful']);
                Session::put('message','Order deactivation successful.');
                return Redirect::to('/manage-order');
    }
    public function active_order($order_id)
    {
        DB::table('tbl_order')
                ->where('order_id',$order_id)
                ->update(['order_status'=>'Pending']);
                Session::put('message','Order activation successful.');
                return Redirect::to('/manage-order');
    }


    public function view_order($order_id)
    {
        $order_by_id   = DB::table('tbl_order')

                                ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')

                                ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')

                                ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
                                ->where('tbl_order.order_id',$order_id)

                                ->select('tbl_order.*','tbl_order_details.*','tbl_shipping.*','tbl_customer.*')
                                
                                ->get();
        $view_order     = view('admin.view_order')
                ->with('order_by_id',$order_by_id);

        return view('admin_layout')
                ->with('admin.view_order',$view_order);
        

        
        // $order_details = DB::table('tbl_order')
        //                 ->select('tbl_order.*')
        //                 ->where('order_id',$order_id)
        //                 ->first();

        // $customer_details = DB::table('tbl_customer')
        //                 ->select('tbl_customer.*')
        //                 ->where('customer_id',$order_details->customer_id)
        //                 ->first();
        // $full_order_details = DB::table('tbl_order_details')
        //                 ->select('tbl_order_details.*')
        //                 ->where('order_id',$order_details->order_id)
        //                 ->get();
        // $shipping_details = DB::table('tbl_shipping')
        //                 ->select('tbl_shipping.*')
        //                 ->where('shipping_id',$order_details->shipping_id)
        //                 ->first();
        

        // $order_by_id = array();
        // $order_by_id['customer_name'] = $customer_details->customer_name;
        // $order_by_id['customer_mobile'] = $customer_details->mobile_number;

        // $order_by_id['shipping_first_name'] = $shipping_details->shipping_first_name;
        // $order_by_id['shipping_address'] = $shipping_details->shipping_address;
        // $order_by_id['shipping_mobile_number'] = $shipping_details->shipping_mobile_number;
        // $order_by_id['shipping_email'] = $shipping_details->shipping_email;

        // $order_by_id['order_id'] = $order_details->order_id;
        

        // // echo "<pre>";
        // // print_r($order_details);
        // // print_r($customer_details);
        // // print_r($full_order_details);
        // // print_r($shipping_details);
        // // print_r($order_by_id);
        
        // $view_order = view('admin.view_order')
        //         ->with('order_by_id',$order_by_id);


        // return view('admin_layout')
        //         ->with('admin.view_order', $view_order);          

    }

    public function update_total(Request $request)
    {
        $promo_code = $request->promo_code;

        $all_promo_info  = DB::table('promocodes')
                            ->where('code',$promo_code)
                            ->first();
        $data = array();
        $data['quantity'] = $all_promo_info->quantity;
        $reward = $all_promo_info->reward;
        $coupon_quantity = $all_promo_info->quantity;

        $cart_total = Session::get('cart_total');

        $cart_total_int = (double)$cart_total;

        if($all_promo_info->quantity > 0){
            $percentage_value = $cart_total_int * $reward / 100;
            $final_cart_total = $cart_total_int - $percentage_value;
            $coupon_quantity = $coupon_quantity - 1;
            $data['quantity'] = $coupon_quantity;
            DB::table('promocodes')->where('code',$promo_code)->update($data);
        }else{
            $final_cart_total = $cart_total_int * 1;
        }

        Session::put('final_cart_total', $final_cart_total);
        Return Redirect::to('/payment');

        // Cart::total() = Cart::total() * $all_promo_info->reward;
        // $manage_category    = view('admin.show_promo_code')
        //         ->with('all_promo_info',$all_promo_info);

        // return view('admin_layout')
        //         ->with('admin.show_promo_code',$manage_category);

        // echo "<pre>";
        // print_r($all_promo_info);
        // echo "<br>";
        // echo $cart_total;
        // echo "<br>";
        // echo "Final Total is: ".$final_cart_total;
        // echo "<br>";
        // echo $cart_total_int;
        // exit();


    }
}
