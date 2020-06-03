@extends('admin_layout')
@section('admin_content')
<ul class="breadcrumb">
<li>
	<i class="icon-home"></i>
	<a href="index.html">Home</a> 
	<i class="icon-angle-right"></i>
</li>
<li><a href="#">Tables</a></li>
</ul>
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
<div class="row-fluid sortable">		
<div class="box span12">
	<div class="box-header" data-original-title>
		<h2><i class="halflings-icon user"></i><span class="break"></span>All Manufacture</h2>
		
	</div>
	<div class="box-content">
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
		  <thead>
			  <tr>
				  <th>Promo ID</th>
				  <th>Promo Code</th>
				  <th>Reward</th>
				  <th>How many times it can be used</th>
				  <th>Expired at</th>
				  <th>Actions</th>
			  </tr>
		  </thead> 
	
	@foreach ($all_promo_info  as $key ) 
		<tbody>
			<tr>
				<td>{{ $key->id }}</td>
				<td>{{ $key->code }}</td>
				<td class="center">{{ $key->reward }}%</td>
				<td class="center">{{ $key->quantity }}</td>
				<td class="center">{{ $key->expires_at }}</td>
				<td class="center">
					
					 
					
					<a class="btn btn-danger" href="{{'/delete-promo-code/'.$key->id}}" id="delete">
						<i class="halflings-icon white trash"></i> 
					</a>
				</td>
			</tr>

		  </tbody>
		
	@endforeach
	  </table>            
	</div>
</div><!--/span-->

</div><!--/row-->
@endsection