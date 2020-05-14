<section id="slider"><!--slider-->
<div class="container">
    <div class="row">
        <div class="col-sm-9">
            <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#slider-carousel" data-slide-to="4" class="active"></li>
                    <li data-target="#slider-carousel" data-slide-to="1"></li>
                    <li data-target="#slider-carousel" data-slide-to="2"></li>
                </ol>
                
                <div class="carousel-inner">
                    <?php
                        $all_published_slider = DB::table('tbl_slider')
                                                ->where('publication_status',1)
                                                ->get();
                                            $i = 1;
                                            foreach ($all_published_slider as $key ) {
                                                if($i == 1){
                                            
                     ?>
                    <div class="item active">
                        <?php }else{ ?>
                        <div class="item">
                            <?php } ?>
                        {{-- <div class="col-sm-4">
                            <h1><span>E</span>-SHOP</h1>
                            <h2>GET THIS ITEM RIGHT NOW</h2>
                            <p>DONT MISS OUT!</p>
                            <button type="button" class="btn btn-default get">Get it now</button>
                        </div> --}}
                        <div class="col-sm-8">
                            <img src="{{URL::to($key->slider_image)}}" class="girl img-responsive" alt="" />
                            
                        </div>
                    </div>
                    
                    <?php $i++; } ?>
                </div>
                
                <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
            
        </div>
    </div>
</div>
</section><!--/slider-->