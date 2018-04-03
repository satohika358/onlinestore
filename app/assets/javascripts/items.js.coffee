$ ->
  $('#items-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#items-table').data('source')
    pagingType: 'full_numbers'