<?php
/**
 * Liqpay Payment Module
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 *
 * @category        Liqpay
 * @package         Payment
 * @version         0.0.1
 * @author          Liqpay
 * @copyright       Copyright (c) 2014 Liqpay
 * @license         http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 *
 * EXTENSION INFORMATION
 *
 * OpenCart         1.5.6
 * LiqPay API       https://www.liqpay.com/ru/doc
 *
 */
?>

<?=$header?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb): ?>
            <?=$breadcrumb['separator']?><a href="<?=$breadcrumb['href']?>"><?=$breadcrumb['text']?></a>
        <?php endforeach ?>
    </div>

    <?php if ($error_warning): ?><div class="warning"><?=$error_warning?></div><?php endif ?>

    <div class="box">
        <div class="heading">
            <h1><img src="view/image/payment.png" alt="" /> <?=$heading_title?></h1>
            <div class="buttons">
                <a onclick="$('#form').submit();" class="button"><?=$button_save?></a>
                <a href="<?=$cancel?>" class="button"><?=$button_cancel?></a>
            </div>
        </div>
        <div class="content">
            <form action="<?=$action?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><span class="required">*</span> <?=$entry_public_key?></td>
                        <td><input type="text" name="liqpay_public_key" value="<?=$liqpay_public_key?>" />
                            <?php if ($error_public_key):?><span class="error"><?=$error_public_key?></span><?php endif?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?=$entry_private_key?></td>
                        <td><input type="text" name="liqpay_private_key" value="<?=$liqpay_private_key?>" />
                            <?php if ($error_private_key):?><span class="error"><?=$error_private_key?></span><?php endif?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?=$entry_action?></td>
                        <td><input type="text" name="liqpay_action" value="<?=$liqpay_action?>" />
                            <?php if ($error_action):?><span class="error"><?=$error_action?></span><?php endif?>
                        </td>
                    </tr>
                    <tr>
                        <td><?=$entry_total?></td>
                        <td><input type="text" name="liqpay_total" value="<?=$liqpay_total?>" /></td>
                    </tr>
                    <tr>
                        <td><?=$entry_order_status?></td>
                        <td>
                            <select name="liqpay_order_status_id">
                                <?php
                                    foreach ($order_statuses as $order_status):
                                        $order_status_id = $order_status['order_status_id'];
                                        $sel = ($order_status_id == $liqpay_order_status_id);
                                ?>
                                    <option <?php if ($sel):?>selected="selected"<?php endif?> value="<?=$order_status_id?>">
                                        <?=$order_status['name']?>
                                    </option>
                                <?php endforeach?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><?=$entry_geo_zone?></td>
                        <td>
                            <select name="liqpay_geo_zone_id">
                                <option value="0"><?=$text_all_zones?></option>
                                <?php
                                    foreach ($geo_zones as $geo_zone):
                                        $geo_zone_id = $geo_zone['geo_zone_id'];
                                        $sel = ($geo_zone_id == $liqpay_geo_zone_id);
                                ?>
                                    <option <?php if ($sel):?>selected="selected"<?php endif?> value="<?=$geo_zone_id?>">
                                        <?=$geo_zone['name']?>
                                    </option>
                                <?php endforeach?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><?=$entry_status?></td>
                        <td>
                            <select name="liqpay_status">
                                <option <?php if ($liqpay_status): ?>selected="selected"<?php endif?> value="1">
                                    <?=$text_enabled?>
                                </option>
                                <option <?php if (!$liqpay_status): ?>selected="selected"<?php endif?> value="0">
                                    <?=$text_disabled?>
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                      <td><?=$entry_sort_order?></td>
                      <td><input type="text" name="liqpay_sort_order" value="<?=$liqpay_sort_order?>" size="1" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<?=$footer?>