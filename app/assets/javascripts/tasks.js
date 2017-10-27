$(document).ready(function() {
  $('form.js-task-create').submit(function(event){
    event.preventDefault();
    const form = $(this);
    const url = event.target.action;
    const data = $(this).serializeJSON();
    $.post(url, data)
      .done(function(response){
        $('#tasks_new').append(response);
        $(form)[0].reset();
        $('input:submit', form).removeAttr('disabled');
      })
  })

  $( "#tasks_new, #tasks_in_progress, #tasks_done" ).sortable({
    connectWith: ".connectedSortable",
    receive: function( event, ui ) {
      const authenticityToken = $('meta[name=csrf-token]').attr('content');
      const data = {
        authenticity_token: authenticityToken,
        task: { status: event.target.dataset['status'] }
      };
      $.ajax(`/tasks/${ui.item.data('id')}`, {
        method: 'PATCH',
        data: data
      });
    }
  }).disableSelection();
});
