@extends('layout')

@section('content')

	 
		<div class="container">
		<div class="row" style="width: 100%">
		@foreach ($all_manufacture_info as $key )
		<a href="{{URL::to('/product_by_manufacture/'.$key->manufacture_id)}}">
		 <div class="col-sm-4">
			<div class="card" style="width: 18rem;  padding: 15px; margin: 15px">
			  <img src="{{URL::to($key->manufacture_logo)}}" class="card-img-top " alt="..." style="height: 80px; width: 80px; display: block; margin-left: auto; margin-right: auto; width: 50%;">
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center;">{{$key->manufacture_name}}</h5>
			    <p class="card-text" style="text-align: center;">{{$key->manufacture_description}}</p>
			    
			  </div>
			</div>
		 </div>
		 </a>
		 @endforeach
		 </div>
		</div>

		
		
	

@endsection