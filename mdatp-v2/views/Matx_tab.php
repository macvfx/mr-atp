<div id="Matx-tab"></div>
<h2 data-i18n="Matx.title"></h2>

<table>
    <tr>
        <th>Item 1</th>
        <td id="Matx_item1"></td>
    </tr>
    <tr>
        <th>Item 2</th>
        <td id="Matx_item2"></td>
    </tr>
    <tr>
        <th>Item 3</th>
        <td id="Matx_item3"></td>
    </tr>
    <tr>
        <th>Item 4</th>
        <td id="Matx_item4"></td>
    </tr>
    <tr>
        <th>Item 5</th>
        <td id="Matx_item5"></td>
    </tr>
</table>

<script>
$(document).on('appReady', function(){
    $.getJSON(appUrl + '/module/Matx/get_data/' + serialNumber, function(data){
        $('#Matx_item1').text(data['item1'])
        $('#Matx_item2').text(data['item2'])
        $('#Matx_item3').text(data['item3'])
        $('#Matx_item4').text(data['item4'])
        $('#Matx_item5').text(data['item5'])
    });
});
</script>
