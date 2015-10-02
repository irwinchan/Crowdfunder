$(document).on('ready page:load', function(){
  $(window).on('scroll', function(){
    if($(this).scrollTop() > ($(document).height() - $(window).height() -50)){
      var nextPage = $('.pagination .next a').attr('href');
      $.getScript(nextPage);
      // $.ajax({
      //   url: nextPage,
      //   datatype:'script',
      //   type: 'GET'
      // })
      // .done(function(result){

      // });
    }
  });
});
