<?php require_once('header' . config_item('template', 'template_extension')); ?>

	<div class="row"><!-- start nav -->
				<div class="col-sm-12 col-xs-12">
					<nav class="navbar navbar-inverse" role="navigation" >
					<div class="navbar-inner">
					  <!-- Brand and toggle get grouped for better mobile display -->
					  <div class="navbar-header">
					    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					      <span class="sr-only">Toggle navigation</span>
					      <span class="icon-bar"></span>
					      <span class="icon-bar"></span>
					      <span class="icon-bar"></span>
					      </button>
					    <a class="navbar-brand visible-xs" href="#">Menu</a>
					  </div>
	
					  <!-- Collect the nav links, forms, and other content for toggling -->
					  <div class="collapse navbar-collapse navbar-ex1-collapse">
					    <ul class="nav navbar-nav">
							<li><a href="index.php" class="first">Home</a></li>
							<li><a href="aboutus.php">About us</a></li>
							
								<li class="dropdown">
									<a href="general.php" class="dropdown-toggle" data-toggle="dropdown">Shopping<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="general.php"></a><?php echo get_categories(0); ?></li>
										<!--<li class="divider"></li>
										<li><a href="#">Rental car</a></li>
										<li><a href="#">Weather</a></li>
										<li><a href="#">Transport</a></li>
										<li><a href="#">Insurance</a></li>-->
									</ul>
								</li>
							
							<li><a href="shipping_delivery.php">Shipping delivery</a></li>
							
							<li><a href="assisted_purchasing.php">Assisted purchasing</a></li>
							
							<li><a href="contact.php">Contact</a></li>
							
						</ul>
					    
					     <ul class="nav navbar-nav pull-right" style="margin-top: 13px">
					      <li>
					      	<form action="search.php" method="post">
								<input type="text" name="filter_product_name" size="25" />
								<input type="submit" name="filter" value="Go" class="btn-primary" />
							</form>
						  </li>
					    </ul>
					    
					  </div><!-- /.navbar-collapse -->
					</div>
					</nav>
	
				</div>
			</div><!-- end nav -->			