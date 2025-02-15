<form action="{$pageURL}&sid={$sid}&action=smtp&do=subnetRules&save=true" method="post" onsubmit="spin(this)">
	<fieldset>
		<legend>{lng p="bms_subnet_rules"}</legend>

		<div class="card">
			<div class="table-responsive">
				<table class="table table-vcenter table-striped">
					<thead>
					<tr>
						<th>{lng p="bms_subnet"}</th>
						<th>{lng p="bms_classification"}</th>
						<th>{lng p="delete"}</th>
					</tr>
					</thead>
					<tbody>
					{foreach from=$subnets item=subnet}
						{cycle name=class values="td1,td2" assign=class}
						<tr class="{$class}">
							<td>
								<div class="input-group">
									<input type="text" class="form-control" name="subnets[{$subnet.id}][ip]" value="{$subnet.ip}" size="18" />
									<span class="input-group-text">/</span>
									<input type="text" class="form-control" name="subnets[{$subnet.id}][mask]" value="{$subnet.mask}" size="18" />
								</div>
							</td>
							<td>
								<select name="subnets[{$subnet.id}][classification]" class="form-select">
									<option value="1"{if $subnet.classification==1} selected="selected"{/if}>{lng p="bms_origin_default"}</option>
									<option value="2"{if $subnet.classification==2} selected="selected"{/if}>{lng p="bms_origin_trusted"}</option>
									<option value="3"{if $subnet.classification==3} selected="selected"{/if}>{lng p="bms_origin_dialup"}</option>
									<option value="4"{if $subnet.classification==4} selected="selected"{/if}>{lng p="bms_origin_reject"}</option>
									<option value="5"{if $subnet.classification==5} selected="selected"{/if}>{lng p="bms_origin_nogrey"}</option>
									<option value="6"{if $subnet.classification==6} selected="selected"{/if}>{lng p="bms_origin_nogreyandban"}</option>
								</select>
							</td>
							<td><input type="checkbox" class="form-check-input" name="subnets[{$subnet.id}][delete]" /></td>
						</tr>
					{/foreach}

					{cycle name=class values="td1,td2" assign=class}
					<tr class="{$class}">
						<td>
							<div class="input-group">
								<input type="text" class="form-control" name="subnets[0][ip]" value="" size="18" />
								<span class="input-group-text">/</span>
								<input type="text" class="form-control" name="subnets[0][mask]" value="" size="18" />
							</div>
						</td>
						<td>
							<select name="subnets[0][classification]" class="form-select">
								<option value="1">{lng p="bms_origin_default"}</option>
								<option value="2">{lng p="bms_origin_trusted"}</option>
								<option value="3">{lng p="bms_origin_dialup"}</option>
								<option value="4">{lng p="bms_origin_reject"}</option>
								<option value="5">{lng p="bms_origin_nogrey"}</option>
								<option value="6">{lng p="bms_origin_nogreyandban"}</option>
							</select>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>

	<div class="row">
		<div class="col-md-6">
			<input class="btn btn-primary" type="button" value=" &laquo; {lng p="back"} " onclick="document.location.href='{$pageURL}&action=smtp&sid={$sid}';" />
		</div>
		<div class="col-md-6 text-end">
			<input class="btn btn-primary" type="submit" value=" {lng p="save"} " />
		</div>
	</div>
</form>
