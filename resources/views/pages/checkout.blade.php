@extends('layout')
@section('content')


<section id="cart_items">
<div class="container">


<div class="register-req">
	<p>Please provide the information.</p>
</div><!--/register-req-->

<div class="shopper-informations">
	<div class="row">
		
		<div class="col-sm-12 clearfix">
			<div class="bill-to">
				<p>SHIPPING DETAILS</p>
				<div class="form-one">
					<form action="{{url('/save-shipping-details')}}" method="post">
						{{ csrf_field() }}
						<input type="text" name="shipping_email" placeholder="Email*">

						<input type="text" name="shipping_first_name" placeholder="First Name *">

						<input type="text" name="shipping_last_name" placeholder="Last Name *">
						<input type="text" name="shipping_address" placeholder="Address  *">
						<input type="text" name="shipping_mobile_number" placeholder="Mobile Number">
						<input type="text" name="shipping_city" placeholder="City">
						
						<input type="submit" class="btn btn-default" value="Done">
					</form>
				</div>
				
			</div>
		</div>
							
	</div>
</div>




</div>
</section> <!--/#cart_items-->



@endsection