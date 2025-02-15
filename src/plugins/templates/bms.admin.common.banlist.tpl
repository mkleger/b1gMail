<form action="{$pageURL}&action=common&do=banlist&sid={$sid}" method="post" onsubmit="spin(this)" name="f1">
	<input type="hidden" name="page" id="page" value="{$pageNo}" />

	<fieldset>
		<legend>{lng p="bms_failban"}</legend>

		<div class="card">
			<div class="table-responsive">
				<table class="table table-vcenter table-striped">
					<thead>
					<tr>
						<th>{lng p="bms_ip"}</th>
						<th style="width: 160px;">{lng p="bms_fb_banneduntil"}</th>
						<th style="width: 160px;">{lng p="bms_fb_lastupdate"}</th>
						<th style="width: 160px;">{lng p="bms_fb_type"}</th>
						<th style="width: 70px;">{lng p="delete"}</th>
					</tr>
					</thead>
					<tbody>
					{foreach from=$banlist item=item key=key}
						{cycle name=class values="td1,td2" assign=class}
						<tr class="{$class}">
							{if $item.ip6}
								<td><span id="ip_{$item.ip6}"><a href="javascript:bms_lookupIP('{$item.ip6}');">{$item.ip6}</a></span></td>
							{else}
								<td><span id="ip_{$item.ip}"><a href="javascript:bms_lookupIP('{$item.ip}');">{$item.ip}</a></span></td>
							{/if}
							<td>{date timestamp=$item.banned_until}</td>
							<td>{date timestamp=$item.last_update}</td>
							<td>{$item.type_text}</td>
							<td><input type="checkbox" class="form-check-input" name="delete[]" value="{$key}" /></td>
						</tr>
					{/foreach}
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<div class="text-end">
					{lng p="pages"}: {pageNav page=$pageNo pages=$pageCount on=" <span class=\"pageNav\"><b>[.t]</b></span> " off=" <span class=\"pageNav\"><a href=\"javascript:updatePage(.s);\">.t</a></span> "}&nbsp;
				</div>
			</div>
		</div>
	</fieldset>

	<div class="row">
		<div class="col-md-6">
			<input class="btn btn-primary" type="button" value=" &laquo; {lng p="back"} " onclick="document.location.href='{$pageURL}&action=common&sid={$sid}';" />
		</div>
		<div class="col-md-6 text-end">
			<input class="btn btn-primary" type="submit" value=" {lng p="save"} " />
		</div>
	</div>
</form>

<script>
	{literal}<!--
	function _bms_lookupIP(e)
	{
		if(e.readyState == 4)
		{
			var text = e.responseText;
			text = text.split('/');

			if(text.length == 2)
			{
				var ip = text[0], hostName = text[1];
				if(EBID('ip_'+ip))
					EBID('ip_'+ip).innerHTML = hostName + ' (' + ip + ')';
			}
		}
	}

	function bms_lookupIP(ip)
	{
		MakeXMLRequest('{/literal}{$pageURL}{literal}&sid=' + currentSID
				+ '&action=lookupIP'
				+ '&ip=' + escape(ip),
				_bms_lookupIP);
	}
	//-->{/literal}
</script>
