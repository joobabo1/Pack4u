<?php require_once('header' . config_item('template', 'template_extension')); ?>

<!-- BEGIN #main -->
<div id="main" class="container">

    <div>
        <!-- Start slideshow-carousel -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active" align="center">
                    <img src="<?php echo config_item('template', 'site_url'); ?>templates/images/image1.jpg" alt="">
                </div>
                <div class="item" align="center">
                    <img src="<?php echo config_item('template', 'site_url'); ?>templates/images/image2.jpg" alt="">
                </div>
                <div class="item" align="center">
                    <img src="<?php echo config_item('template', 'site_url'); ?>templates/images/image3.jpg" alt="">
                </div>
            </div>
        </div>

        <!-- Controls -->
        <!--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        </a>-->
        <!-- // end of slideshow-carousel -->
    </div>

    <br />
    <br />

    <div class="clear">
        &nbsp;
    </div>

    <!-- BEGIN .grid_12 -->
    <div class="page-header">
        <h1>Latest products</h1>
    </div>
    <!-- END .grid_12 -->

    <?php foreach ($products as $row): ?>

    <div class="col-xs-6 col-md-3">

        <span> <a href="product_details.php?product_id=<?php echo $row['product_id']; ?>"> <?php if (is_null($row['product_thumbnail'])): ?> <img src="<?php echo config_item('cart', 'site_url'); ?>uploads/images/no_image.png" alt="" /> <?php else: ?> <img src="<?php echo config_item('cart', 'site_url'); ?>uploads/images/<?php echo $row['product_thumbnail']; ?>" alt="" /> <?php endif; ?> </a> </span>

        <span class="price"> <?php echo price($row['product_price']); ?> </span>

        <span class="title"><?php echo $row['product_name']; ?></span>

        <div class="line"></div>

        <p>
            <a href="product_details.php?product_id=<?php echo $row['product_id']; ?>" class="button orange">Read more</a>
        </p>

    </div>

    <?php endforeach; ?>

    <div class="clear">
        &nbsp;
    </div>

</div>
<!-- END #main -->

<?php require_once('footer' . config_item('template', 'template_extension')); ?>
