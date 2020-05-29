<div id="mdatp-tab"></div>
<h2 data-i18n="mdatp.title"></h2>

<table>
    <tr>
        <th>Item 1</th>
        <td id="mdatp_item1"></td>
    </tr>
    <tr>
        <th>Item 2</th>
        <td id="mdatp_item2"></td>
    </tr>
</table>

<script>
$(document).on('appReady', function(){
    $.getJSON(appUrl + '/module/mdatp/get_data/' + serialNumber, function(data){
        $('#mdatp_item1').text(data['item1'])
        $('#mdatp_item2').text(data['item2'])
    });
});
</script>
