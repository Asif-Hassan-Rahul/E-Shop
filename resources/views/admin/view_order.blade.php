@extends('admin_layout')

@section('admin_content')

<div class="row-fluid sortable">
	<div class="box span4">
		<div class="box-header">
			<h2><i class="halflings-icon align-justify"></i><span class="break"></span>Customer Details</h2>
		</div>
		<div class="box-content">
			<table class="table">
				<thead>
					<tr>
						<th>Username</th>
						<th>Mobile</th>
					</tr>
				</thead>
				<tbody>
					<tr>

						@foreach($order_by_id as $key)
						@endforeach
						<td>{{ $key->customer_name }}</td>
						<td>{{ $key->mobile_number }}</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="box span8">
		<div class="box-header">
			<h2><i class="halflings-icon align-justify"></i><span class="break"></span>Shipping Details</h2>
		</div>
		<div class="box-content">
			<table class="table table-striped">
				<thead>
					<tr>
						
						<th>First Name</th>
						<th>Last Name</th>
						<th>Address</th>
						<th>Mobile</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						@foreach($order_by_id as $key)
						@endforeach
						<td>{{ $key->shipping_first_name }} </td>
						<td>{{ $key->shipping_last_name }}</td>
						<td>{{ $key->shipping_address }}</td>
						<td>{{ $key->shipping_mobile_number }}</td>
						<td>{{ $key->shipping_email }}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header" data-original-title>
			<h2><i class="halflings-icon user "></i><span class="break"></span>Order Details</h2>
		</div>
		<div class="box-content">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Product Sales Quantity</th>
						<th>Subtotal</th>
					</tr>
				</thead>

				<tbody>
					@foreach($order_by_id as $key)
					<tr>
						<td>{{ $key->order_id }}</td>
						<td>{{ $key->product_name }}</td>
						<td>{{ $key->product_price }}</td>
						<td>{{ $key->product_sales_quantity }}</td>
						<td>{{ $key->product_price * $key->product_sales_quantity }}</td>
					</tr>
					@endforeach
				</tbody>

				<tfoot>
					<tr>
						<td colspan="4">Total with Vat: </td>
						<td><strong>= {{ $key->order_total }} BDT</strong></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

@endsection