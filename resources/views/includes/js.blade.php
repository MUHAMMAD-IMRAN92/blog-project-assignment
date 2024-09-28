<script>
    $(document).ready(function() {
        // $('#bsp').dataTable({
        //     "order": [
        //         [2, "desc"]
        //     ]
        // });
        $('#systems-dropdown-id').on('change', function() {
            var selectedOption = $(this).find('option:selected');
            if (selectedOption.data('name') == 'NetSuite') {
                $('#netsuite-form').css("display", "block");
            } else {
                $('#netsuite-form').css("display", "none");
            }
        });
    });
</script>
