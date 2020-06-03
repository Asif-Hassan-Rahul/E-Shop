@extends('layout')
@section('content')


<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<p class="alert-danger">
					<?php
						$message = Session::get('message');
						
						if ($message) {
						 	# code...
						 	echo $message;
						 	Session::put('message',null);
						 } 
							
					 ?>
						</p>

						<h1>Your order has been placed.</h1>
						<h2>We will contact with you as soon as possible.</h2>
					</div><!--/login form-->
				</div>
				
			</div>
		</div>
	</section><!--/form-->



@endsection