@extends('admin_layout')
@section('admin_content')

		<ul class="breadcrumb">
			<li>
				<i class="icon-home"></i>
				<a href="index.html">Home</a>
				<i class="icon-angle-right"></i> 
			</li>
			<li>
				<i class="icon-edit"></i>
				<a href="#">Add Manufacture</a>
			</li>
		</ul>
		
		<div class="row-fluid sortable">
			<div class="box span12">
				<div class="box-header" data-original-title>
					<h2><i class="halflings-icon edit"></i><span class="break"></span>Add Manufacture</h2>
					
				</div>
				<p class="alert-success">
					<?php
						$message = Session::get('message');
						
						if ($message) {
						 	# code...
						 	echo $message;
						 	Session::put('message',null);
						 } 
							
					 ?>
				</p>
				<div class="box-content">
					<form class="form-horizontal" action="{{ url('/save-promo-code') }}" method="POST" >
						{{ csrf_field() }}
					  <fieldset>
				
						<div class="control-group">
						  <label class="control-label" >How many?</label>
						  <div class="controls">
							<input type="number" class="input-xlarge" name="amount" required="" >
						  </div>
						</div>

						          
						<div class="control-group">
						  <label class="control-label" >How much?</label>
						  <div class="controls">
							<input type="number" class="input-xlarge" name="reward" required="" >
						  </div>
						</div>

						<div class="control-group">
						  <label class="control-label" for="fileInput">Expires in: </label>
						  <div class="controls">
							<input type="number" class="input-xlarge" name="expires_in" value="null" >
						  </div>
						</div>
						<div class="control-group">
						  <label class="control-label" for="fileInput">how many times it can be used? </label>
						  <div class="controls">
							<input type="number" class="input-xlarge" name="quantity" value="null" >
						  </div>
						</div>

						

						<div class="form-actions">
						  <button type="submit" class="btn btn-primary">Generate promo code</button>
						  <button type="reset" class="btn">Cancel</button>
						</div>
					  </fieldset>
					</form>   

				</div>
			</div><!--/span-->

		</div><!--/row-->	
	
@endsection