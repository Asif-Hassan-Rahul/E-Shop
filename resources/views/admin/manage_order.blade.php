@extends('admin_layout')
@section('admin_content')
<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="index.html">Home</a> 
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#">Orders</a></li>
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
			<h2><i class="halflings-icon user"></i><span class="break"></span>All Orders</h2>
			
		</div>
		<div class="box-content">
			<table class="table table-striped table-bordered bootstrap-datatable datatable">
			  <thead>
				  <tr>
					  <th>Order ID</th>
					  <th>Customer Name</th>
					  <th>Order Total</th>
					  <th>Status</th>
					  <th>Actions</th>
				  </tr>
			  </thead> 
		
		@foreach ($all_order_info as $key ) 
			<tbody>
				<tr>
					<td>{{ $key->order_id }}</td>
					<td class="center">{{ $key->customer_name }}</td>
					<td class="center">{{ $key->order_total }}</td>
					<td class="center">{{ $key->order_status }}</td>
					{{-- <td class="center">
						@if($key->publication_status == 1)
						<span class="label label-success">Active</span>
						@else
						<span class="label label-danger">Not Active</span>
						@endif
					</td> --}}
					<td class="center">
						@if($key->order_status == "Pending")
						<a class="btn btn-success" href="{{URL::to('/unactive_order/'.$key->order_id)}}">
							<i class="">Done</i>  
						</a>
						@else
						
						<a class="btn btn-danger" href="{{URL::to('/active_order/'.$key->order_id)}}">
							<i class="">Not Done</i>  
						</a>
						@endif
						<a class="btn btn-info" href="{{URL::to('/view-order/'.$key->order_id)}}">
							<i class="halflings-icon white edit"></i>  
						</a>
						<a class="btn btn-danger" href="{{URL::to('/delete/'.$key->order_id)}}" id="delete">
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