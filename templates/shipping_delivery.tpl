<?php require_once('header' . config_item('template', 'template_extension')); ?>

<script type="text/javascript">
// <![CDATA[
$(document).ready(function() {

    //qTip
    $('span[title]').qtip({
        style: {
            classes: 'ui-tooltip-shadow ui-tooltip-plain'
        },
        position: {
            my: 'bottom center',
            at: 'top center'
        }
    });
        
    //Check form fields
    $("form#shipping_delivery").validate({
        rules: {
            weight: "required",
            contents: "required",
            telephone: {
                required: true,
                number: true
            }            
        },
        messages: {
            weight: "Enter your weight of parcel.",
            contents: "Enter your content of parcel.",
            telephone: {
                required: "Enter your telephone number.", 
                number: "Please enter a valid number."
            }
        },
        success: function(label) {
            label.html("&nbsp;").addClass("success");
        }
    });
            
});
// ]]>
</script>

<div class="container">
  <form action="" class="form-horizontal" method="post" role="form">
    <fieldset>
      <legend>Shipping information</legend>
      
      <div class="form-group">
        <label class="col-sm-3 control-label" for="Telephone">Telephone<span class="required">*</span></label>
        <div class="col-sm-8">
          <input type="text" class="form-control" name="telephone" id="telephone" placeholder="01012341234">
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-sm-3 control-label" for="Weight">Weight of box(kg)<span class="required">*</span></label>
        <div class="col-sm-8">
          <input type="text" class="form-control" name="weight" id="weight" placeholder="1.5">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="Contents">Contents of box<span class="required">*</span></label>
        <div class="col-sm-8">
          <input type="text" class="form-control" name="contents" id="contents" placeholder="Books">
          <hr>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="details">Delivery details<span class="required">*</span></label>
        
        <!-- Start existing shipping address-->
        <div class="col-sm-8">
              <?php if($customer_addresses) { ?>    
              <input type="radio" name="shipping_address" value="existing" id="shipping-address-existing" checked="checked"/>
              <label for="shipping-address-existing">I want to use an existing address</label>
              
              <div id="shipping-existing" class="col-sm-8">
                  <select name="address_id" style=" width: 120%; margin-bottom: 15px;">
                      <?php foreach($customer_addresses as $row) { ?>
                      <?php if($row['address_id'] == $address_id) { ?>
                      <option value="<?php echo $row['address']; ?>" selected="selected"><?php echo $row['first_name']; ?>,<?php echo $row['last_name']; ?>,<?php echo $row['address']; ?>,<?php echo $row['city']; ?>,<?php echo $row['post_code']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $row['address']; ?>"><?php echo $row['first_name']; ?>&nbsp;<?php echo $row['last_name']; ?>,&nbsp;<?php echo $row['address']; ?>&nbsp;<?php echo $row['city']; ?>,&nbsp;<?php echo $row['post_code']; ?></option>
                                            
                      <!--Input hidden value(existing)-->
                            <input type="hidden" name="first_name_existing" id="first_name_existing" value="<?php echo $row['first_name']; ?>" />
                            <input type="hidden" name="last_name_existing" id="last_name_existing" value="<?php echo $row['last_name']; ?>" />
                            <input type="hidden" name="address_existing" id="address_existing" value="<?php echo $row['address']; ?>" />
                            <input type="hidden" name="post_code_existing" id="post_code_existing" value="<?php echo $row['post_code']; ?>" />
                            <input type="hidden" name="city_existing" id="city_existing" value="<?php echo $row['city']; ?>" />
                            <input type="hidden" name="country_id_existing" id="country_id_existing" value="<?php echo $row['country_id']; ?>" />
                            <input type="hidden" name="zone_existing" id="zone_existing" value="<?php echo $row['zone']; ?>" />
                                                                        
                          <?php } ?>
                      <?php } ?>        
                  </select>
              </div><br/><br/><br/>
              
        <!-- new shipping address-->
            <p>        
            <input type="radio" name="shipping_address" value="new" id="shipping-address-new"/>
            <label for="shipping-address-new">I want to use a new address</label>
            </p>
            <?php } ?>
                      
              <div class="col-sm-12" id="shipping-new">
                  <!--Start new address form-->
                  <form action="" id="shipping_create_account" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">First name<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="first_name_new" name="first_name_new" />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Last name<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="last_name_new" name="last_name_new" />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Company</label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="company_name_new" name="company_name_new" />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Address<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="address_new" name="address_new" />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">City<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="city_new" name="city_new" />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Post Code<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="post_code_new" name="post_code_new"  />
                        </div>    
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Country<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <select id="country_id_new" name="country_id_new" class="selectpicker">
                            <?php foreach ($countries as $row): ?>
                                <option value="<?php echo $row['country_id']; ?>"><?php echo $row['country_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                        </div>    
                    </div>
    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Region/State<span class="required">*</span></label>
                        <div class="col-sm-8">    
                            <input type="text" class="form-control" id="zone_new" name="zone_new"  />
                        </div>    
                    </div><br/>
                    
                      <div class="form-group" id="#submit-new">
                        <div class="col-sm-9">
                          <button type="submit" name="submit2" class="btn btn-success">Order Now-new</button>
                        </div>
                      </div><br/>
                                    
                </form><!--End new address form-->
            </div>
                            
             <!-- pick up shipping-->
             <input type="radio" name="shipping_address" value="pickup" id="shipping-address-pickup"/>
             <label for="shipping-address-pickup">I want to pick it up</label><br/><br/>
             
             <div class="form-group" id="submit-pickup">
                <div class="col-sm-9">
                  <button type="submit" name="submit3" class="btn btn-success">Order Now-pick it up</button>
                </div>
             </div>
           
        </div>     
      </div>
      
      
      <div class="form-group" id="submit-existing">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" name="submit" class="btn btn-success">Order Now-existing</button>
        </div>
      </div>
      
    </fieldset>
  </form>
</div>


<script type="text/javascript">

    $('#shipping-new').hide();
    $('#submit-new').hide();
    $('#submit-pickup').hide();
        
    $('#shipping-address-new').live('change',function() {
        $('#shipping-new').show();
        $('#shipping-existing').hide();
        
        $('#submit-new').show();
        $('#submit-existing').hide();
        $('#submit-pickup').hide();
        });
        
    $('#shipping-address-existing').live('change',function() {
        $('#shipping-existing').show();
        $('#shipping-new').hide();
        
        $('#submit-new').hide();
        $('#submit-existing').show();
        $('#submit-pickup').hide();
        });
        
    $('#shipping-address-pickup').live('change',function() {
        $('#shipping-existing').hide();
        $('#shipping-new').hide();
        
        $('#submit-pickup').show();
        $('#submit-existing').hide();
        });
        /*if(this.value == 'new'){
           $('#shipping-existing').hide();
           $('#shipping-new').show();
       }else if(this.value == 'existing'){
           $('#shipping-existing').show();
           $('#shipping-new').hide();
       }else{
           $('#shipping-existing').hide();
           $('#shipping-new').hide();
       }*/
    
</script>

<?php require_once('footer' . config_item('template', 'template_extension')); ?>