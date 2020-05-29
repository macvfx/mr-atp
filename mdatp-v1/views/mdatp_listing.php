<?php

$this->view('listings/default',
[
	"i18n_title" => 'mdatp.listing.title',
	"table" => [
		[
			"column" => "machine.computer_name",
			"i18n_header" => "listing.computername",
			"formatter" => "clientDetail",
			"tab_link" => "mdatp-tab",
		],
		[
			"column" => "reportdata.serial_number",
			"i18n_header" => "serial",
		],
		[
			"column" => "mdatp.item1",
			"i18n_header" => "mdatp.listing.item1",
		],
		[
			"column" => "mdatp.item2",
			"i18n_header" => "mdatp.listing.item2",
		],
	]
]);
