<?php require_once('header' . config_item('template', 'template_extension')); ?>

	<!-- BEGIN #main -->
	<div id="main" class="container">

		<!-- BEGIN .grid_12 -->
		<div class="grid_12 title_background">
			<h1>Order details</h1>
		</div>
		<!-- END .grid_12 -->
		
		<div class="clear">&nbsp;</div>
				
		<!-- BEGIN .grid_12 -->
		<div class="grid_12">
			
			<?php foreach ($order_details as $row): ?>

				<table class="table">
					<thead>
						<tr>
							<th>Shipping address</th>
							<th>Payment address</th>
							<th style="width: 130px;">Shipping method</th>
							<th style="width: 130px;">Payment method</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<p><?php echo $row['shipping_first_name']; ?> <?php echo $row['shipping_last_name']; ?></p>
								<p>
								<?php if ($row['shipping_company']): ?>
									<?php echo $row['shipping_company']; ?>
								<?php endif; ?>
								</p>
								<p><?php echo $row['shipping_address']; ?></p>
								<p><?php echo $row['shipping_city']; ?></p>
								<p><?php echo $row['shipping_post_code']; ?></p>
								<p>
								<?php foreach ($countries as $value): ?>
									<?php if ($value['country_id'] == $row['shipping_country_id']): ?>
										<?php echo $value['country_name']; ?>
									<?php endif; ?>
								<?php endforeach; ?>
								</p>
								<p><?php echo $row['shipping_zone']; ?></p>
							</td>
							<td>
								<p><?php echo $row['payment_first_name']; ?> <?php echo $row['payment_last_name']; ?></p>
								<p>
								<?php if ($row['payment_company']): ?>
									<?php echo $row['payment_company']; ?>
								<?php endif; ?>
								</p>
								<p><?php echo $row['payment_address']; ?></p>
								<p><?php echo $row['payment_city']; ?></p>
								<p><?php echo $row['payment_post_code']; ?></p>
								<p>
								<?php foreach ($countries as $value): ?>
									<?php if ($value['country_id'] == $row['payment_country_id']): ?>
										<?php echo $value['country_name']; ?>
									<?php endif; ?>
								<?php endforeach; ?>
								</p>
								<p><?php echo $row['payment_zone']; ?></p>					
							</td>
							<td><p><?php echo $row['shipping_method']; ?></p></td>
							<td><p><?php echo $row['payment_method']; ?></p></td>
						</tr>
					</tbody>
				</table>
												
			<?php endforeach; ?>

			<table class="table">
				<thead>
					<tr>
						<th>Product</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					
					<?php foreach ($order_details as $row): ?>
					
						<?php foreach ($row['order_products'] as $product): ?>
							<tr>
								<td>
									<?php echo $product['product_name']; ?> <br />
									<?php if (isset($product['options'])): ?>
										<?php foreach ($product['options'] as $option): ?>
											- <?php echo $option['option_value']; ?>
										<?php endforeach; ?>
									<?php endif; ?>
								</td>
								<td><?php echo $product['product_quantity']; ?></td>								
								<td><?php echo price($product['product_price'], $product['currency']); ?></td>
								<td><?php echo price($product['total_price'], $product['currency']); ?></td>
							</tr>
						<?php endforeach; ?>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><strong>Sub-Total:</strong></td>
							<td><?php echo price($row['subtotal'], $row['currency']); ?></td>
						</tr>
						<?php if ($row['shipping_cost'] != 0): ?>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><strong>Shipping cost:</strong></td>
								<td><?php echo price($row['shipping_cost'], $row['currency']); ?></td>
							</tr>
						<?php endif; ?>
						<?php if ($row['tax_rate'] != 0): ?>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><strong><?php echo $row['tax_description']; ?> <?php echo $row['tax_rate']; ?> %:</strong></td>
								<td><?php echo price($row['total_tax'], $row['currency']); ?></td>
							</tr>
						<?php endif; ?>
						<?php if ($row['coupon_discount'] != 0): ?>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><strong><?php echo $row['coupon_name']; ?></strong></td>
								<td><?php echo '- ' . price($row['coupon_discount'], $row['currency']); ?></td>
							</tr>
						<?php endif; ?>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><strong>Total:</strong></td>
							<td><?php echo price($row['total'], $row['currency']); ?></td>
						</tr>
					<?php endforeach; ?>
				</tbody>
			</table>

			<table class="table">
				<thead>
					<tr>
						<th>Date added</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
				
					<?php foreach ($order_status as $row): ?>				
						<tr>
							<td><?php echo date('d/m/Y H.i.s', $row['date_added']); ?></td>
							<td><?php echo $row['status_name']; ?></td>
						</tr>
					<?php endforeach; ?>
					
				</tbody>
			</table>
													
		</div>
		<!-- END .grid_12 -->
		
		<div class="clear">&nbsp;</div>
				
	</div>
	<!-- END #main -->

<?php require_once('footer' . config_item('template', 'template_extension')); ?>
