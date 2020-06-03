@extends('layout')

@section('content')

<section id="cart_items">
		<div class="container col-sm-12">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<?php
                     $contents=Cart::content();

				?>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Image</td>
							<td class="description">Name</td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td>Action</td>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($contents as $v_contents) {?>
						<tr>
							<td class="cart_product">
								<a href=""><img src="{{URL::to($v_contents->options->image)}}" height="80px" width="80px" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">{{$v_contents->name}}</a></h4>
								
							</td>
							<td class="cart_price">
								<p>{{$v_contents->price}}</p>
							</td>
							<td class="cart_quantity">
							<div class="cart_quantity_button">
								<form action="{{url('/update-cart')}}" method="post">
									{{ csrf_field()}}
									<input class="cart_quantity_input" type="text" name="qty" value="{{$v_contents->qty}}" autocomplete="off" size="2">
									<input  type="hidden" name="rowId" value="{{$v_contents->rowId}}"  >
									<input type="submit" name="submit" value="update" class="btn btn-sm btn-default">
								</form>
							</div>
							</td>
							<td >
								<p class="cart_total_price">{{$v_contents->total}}</p>
							</td>
							<td class="cart_delete">

								<a class="cart_quantity_delete" href="{{URL::to('/delete-to-cart/'.$v_contents->rowId)}}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
                       <?php }?>
						<tr>
							<td><h2>Promo Code: </h2></td>
							<form action="{{'/update-total'}}" method="post">
								{{csrf_field()}}
								<td><input type="text" name="promo_code"></td>
								<td><input type="submit" name="Update" value="update"></td>
								<?php Session::put('cart_total', Cart::total(2,'.','')); ?>
							</form>
							<td><h2>Total</h2></td>
							<td class="cart_total_price" colspan="6" ><h2>{{ Cart::total() }} </h2></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h2>Final Total: </h2></td>
							<td class="cart_total_price" colspan="6"><h2><?php $final_total = Session::get('final_cart_total'); echo $final_total; ?></h2></td>
						</tr>
					</tbody>
					<tfoot>

					</tfoot>
				</table>
			</div>
		</div>
	</section> 
<section id="do_action">
	<div class="container">
		<div class="heading">
			
		</div>
		<div class="breadcrumbs">
			<ol class="breadcrumb">
			  <li><a href="#">Home</a></li>
			  <li class="active">Payment method</li>
			</ol>
		</div>
		<div class="paymentCont col-sm-9">
					<div class="headingWrap">
							<h3 class="headingTop text-center">Select Your Payment Method</h3>	
							<p class="text-center">Created with bootsrap button and using radio button</p>
					</div>
					<form action="{{url('/order-place')}}" method="post">
					{{ csrf_field() }}
					<div class="paymentWrap">
						<div class="btn-group paymentBtnGroup btn-group-justified" data-toggle="buttons">
				            <label class="btn paymentMethod active">
				            	<div class="method visa"></div>
				                <input type="radio" name="payment_method" value="handcash" checked> 
				            </label>
				            <label class="btn paymentMethod">
				            	<div class="method master-card"></div>
				                <input type="radio" name="payment_method" value="debitcard"> 
				            </label>
				            <label class="btn paymentMethod">
			            		<div class="method amex"></div>
				                <input type="radio" name="payment_method" value="bkash">
				            </label>
				       		{{-- <label class="btn paymentMethod">
			             		<div class="method vishwa"></div>
				                <input type="radio" name="payment_gateway" value="payza"> 
				            </label> --}}
				            
				         
				        </div>  
				        <div class="footerNavWrap clearfix" style="width: 100px;height: 100px;margin: 0 auto;">
							<input type="submit" class="btn btn-light" name="submit" value="Submit">
						</div>      
					</div>
					</form>
					
				</div>
	</div>
</section><!--/#do_action-->

@endsection