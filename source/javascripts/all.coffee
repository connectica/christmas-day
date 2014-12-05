#= require jquery
#= require bootstrap
#= require underscore
#= require segment
#= require flipclock

$(document).ready ->
  reebonz = 
    class: 'reebonz'
    link: 'http://www.reebonz.co.th'
    popup: "<a href='http://www.reebonz.co.th/rbzinvite/supersaleth?language=th&utm_source=supersaleth&utm_medium=display&utm_campaign=novblackout'><img src='/images/reebonz-popup.jpg' width='256' height='256' /></a>"

  sanoga =
    class: 'sanoga'
    link: 'http://www.sanoga.com'
    popup: "<a href='http://www.sanoga.com/supersale.html/?utm_source=web&utm_medium=banner&utm_campaign=supersale'><img src='/images/sanoga-popup.jpg' width='256' height='256' /></a>"

  petloft = 
    class: 'petloft'
    link: 'http://www.petloft.com'
    popup: "<a href='http://www.petloft.com/supersale.html/?utm_source=web&utm_medium=banner&utm_campaign=supersale'><img src='/images/petloft-popup.jpg' width='256' height='256' /></a>"

  venbi = 
    class: 'venbi'
    link: 'http://www.venbi.com'
    popup: "<a href='http://www.venbi.com/supersale.html/?utm_source=web&utm_medium=banner&utm_campaign=supersale'><img src='/images/venbi-popup.jpg' width='256' height='256' /></a>"

  luxola = 
    class: 'luxola'
    link: 'http://www.luxola.com'
    popup: "<a href='http://www.luxola.co.th'><img src='/images/luxola-popup.jpg' width='256' height='256' /></a>"

  guruwan = 
    class: 'guruwan'
    link: 'http://www.guruwan.com'
    popup: "<a href='http://www.guruwan.com'><img src='/images/guruwan-popup.jpg' width='256' height='256' /></a>"

  lafema =
    class: 'lafema'
    link: 'http://www.lafema.com'
    popup: "<a href='http://www.lafema.com/supersale.html/?utm_source=web&utm_medium=banner&utm_campaign=supersale'><img src='/images/lafema-popup.jpg' width='256' height='256' /></a>"

  wearyouwant =
    class: 'wearyouwant'
    link: 'http://www.wearyouwant.com'
    popup: "<a href='http://www.lafema.com'><img src='/images/wearyouwant-popup.jpg' width='256' height='256' /></a>"

  moxy = 
    class: 'moxy'
    link: 'http://www.moxy.ch.th'
    #www.moxyst.com/[whatever the name of the url - i.e. supersaleth.com

  pomelo = 
    class: 'pomelo'
    link: 'http://www.pomelo.com'

  thaimega = 
    class: 'thaimega'
    link: 'http://www.thailandmegasale.com'

  priceza = 
    class: 'priceza'
    link: 'http://www.priceza.com'

  sanook = 
    class: 'sanook'
    link: 'http://superdeal.sanook.com'

  shopspot = 
    class: 'shopspot'
    link: 'http://www.shopspotapp.com/'
    #http://shopspotapp.com/user/supersaleth?utm_source=toms&utm_medium=banner&utm_campaign=supersale&utm_content=ss




  shops = [reebonz,sanoga,petloft,venbi,luxola,guruwan,lafema,shopspot,moxy,pomelo]

  randomized = _.shuffle(_.shuffle(shops))

  $('a.shop-link').click (e) ->
    window.analytics.track 'Clicked Shop',
      link: $(this).attr('href')

  $('a.shop-link').popover
    placement: 'top'
    trigger: 'manual'
    html: true

  $('a.shop-link').on 'mouseenter', (e) ->
#    $('.popover').popover('hide')
#    $(this).popover('show')

  currentDate = new Date()
  futureDate  = new Date(2014, 11, 15, 11, 11)

  console.log futureDate

  diff  = futureDate.getTime() / 1000 - currentDate.getTime() / 1000

  clock = $('.clock').FlipClock(diff,
    clockFace: 'DailyCounter',
    countdown: true
  )


  $('#shops a.shop-link').each (index) ->
    $(this).attr('href', randomized[index].link)
    $(this).attr('data-content', randomized[index].popup)
    $(this).find('div').addClass(randomized[index].class)

  

