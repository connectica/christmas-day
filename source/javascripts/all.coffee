#= require jquery
#= require bootstrap
#= require underscore
#= require segment

$(document).ready ->
  reebonz = 
    class: 'reebonz'
    link: 'http://www.reebonz.co.th'
    popup: "<a href='http://www.reebonz.co.th'><img src='/images/reebonz-popup.jpg' width='256' height='256' /></a>"

  moxy = 
    class: 'moxy'
    link: 'http://www.moxy.co.th'

  sanoga =
    class: 'sanoga'
    link: 'http://www.sanoga.com'
    popup: "<a href='http://www.sanoga.com'><img src='/images/sanoga-popup.jpg' width='256' height='256' /></a>"

  rakuten = 
    class: 'rakuten'
    link: 'http://www.tarad.com'

  pomelo = 
    class: 'pomelo'
    link: 'http://www.pomelofashion.com/'

  priceza = 
    class: 'priceza'
    link: 'http://www.priceza.com'

  sanook = 
    class: 'sanook'
    link: 'http://superdeal.sanook.com'

  petloft = 
    class: 'petloft'
    link: 'http://www.petloft.com'
    popup: "<a href='http://www.petloft.com'><img src='/images/petloft-popup.jpg' width='256' height='256' /></a>"

  thaimega = 
    class: 'thaimega'
    link: 'http://www.thailandmegasale.com'

  wearyouwant = 
    class: 'wearyouwant'
    link: 'https://www.wearyouwant.com'

  shopspot = 
    class: 'shopspot'
    link: 'http://www.shopspotapp.com/'

  venbi = 
    class: 'venbi'
    link: 'http://www.venbi.com'
    popup: "<a href='http://www.venbi.com'><img src='/images/venbi-popup.jpg' width='256' height='256' /></a>"

  luxola = 
    class: 'luxola'
    link: 'http://www.luxola.com'

  guruwan = 
    class: 'guruwan'
    link: 'http://www.guruwan.com'

  lafema =
    class: 'lafema'
    link: 'http://www.lafema.com'
    popup: "<a href='http://www.lafema.com'><img src='/images/lafema-popup.jpg' width='256' height='256' /></a>"

  shops = [reebonz, moxy, sanoga, rakuten, pomelo, 
           priceza, sanook, petloft, thaimega, wearyouwant, 
           shopspot, venbi, luxola, guruwan, lafema]

  randomized = _.shuffle(_.shuffle(shops))

  $('a.shop-link').click (e) ->
    window.analytics.track 'Clicked Shop',
      link: $(this).attr('href')

  $('a.shop-link').popover
    placement: 'top'
    trigger: 'manual'
    html: true

  $('a.shop-link').on 'mouseenter', (e) ->
    $('.popover').popover('hide')
    $(this).popover('show')


  $('#shops a.shop-link').each (index) ->
    $(this).attr('href', randomized[index].link)
    $(this).attr('data-content', randomized[index].popup)
    $(this).find('div').addClass(randomized[index].class)

  

