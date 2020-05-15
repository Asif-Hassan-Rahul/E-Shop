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
					<form class="form-horizontal" action="{{ url('/save-manufacture') }}" method="POST" enctype="multipart/form-data">
						{{ csrf_field() }}
					  <fieldset>
				
						<div class="control-group">
						  <label class="control-label" for="date01">Manufacture Name</label>
						  <div class="controls">
							<input type="text" class="input-xlarge" name="manufacture_name" required="" >
						  </div>
						</div>

						          
						<div class="control-group hidden-phone">
						  <label class="control-label" for="textarea2">Manufacture Desctription</label>
						  <div class="controls">
							<textarea class="form-control" name="manufacture_description" rows="3" required=""></textarea>
						  </div>
						</div>

						<div class="control-group">
						  <label class="control-label" for="fileInput">Manufacturer Logo</label>
						  <div class="controls">
							<input class="input-file uniform_on" id="fileInput" name="manufacture_logo" type="file">
						  </div>
						</div>

						<div class="control-group hidden-phone">
						  <label class="control-label" for="textarea2">Publication Status</label>
						  <div class="controls">
							<input type="hidden" name="publication_status" value="0" />
							<input type="checkbox" name="publication_status" value="1">
						  </div>
						</div>

						<div class="form-actions">
						  <button type="submit" class="btn btn-primary">Add Manufacture</button>
						  <button type="reset" class="btn">Cancel</button>
						</div>
					  </fieldset>
					</form>   

				</div>
			</div><!--/span-->

		</div><!--/row-->

@endsection()