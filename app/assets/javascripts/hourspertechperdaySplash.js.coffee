select_ths = $('.total_hours_sold')
select_wdpt = $('.work_days_per_tech')
select_numtechs = $('.number_of_techs')
data = []
for i in [ 1 .. select_ths.length ]
  ths = select_ths[(i - 1)].dataset
  wdpt = select_wdpt[(i - 1)].dataset
  numtechs = select_numtechs[(i - 1)].dataset
  
  data.push [ month: ths.month, value: ( ths.totalHoursSold / wdpt.workDaysPerTech / numtechs.numberOfTechs ).toFixed(2) ]...

barWidth = 50;
width = (barWidth + 5) * data.length;
height = 100;

x = d3.scale.linear()
  .domain([0, data.length])
  .range([0, width])
y = d3.scale.linear().
  domain([0, d3.max(data, (d) ->
    d.value
    )]).
  range([0, height])

# add the canvas to the DOM
chart = d3.select(".splash_charts").
  append('div').
  attr('class', 'hourspertechperday').
  append("svg:svg").
  attr("width", width).
  attr("height", height).
  attr('viewBox','0 0 '+ width + ' ' + height ).
  attr('preserveAspectRatio','xMinYMin')

chart.selectAll("rect").
  data(data).
  enter().
  append("svg:rect").
  attr("x", (d, i) -> 
    x(i)
    ).
  attr("y", (d) ->  
    (height - y(d.value))
    ).
  attr("height", (d) -> 
    y(d.value)
    ).
  attr("width", barWidth).
  attr("fill", "#2d578b");

chart.selectAll("text").
  data(data).
  enter().
  append("svg:text").
  attr("x", (d, i) -> 
    x(i)
    ).
  attr("y", (d) ->  
    (height - y(d.value))
    ).
  attr("dx", barWidth/2).
  attr("dy", "1.2em").
  attr("text-anchor", "middle").
  text((d) -> d.value).
  attr("fill", "white");

chart.selectAll("text.xAxis").
  data(data).
  enter().append("svg:text").
  attr("x", (d, i) -> 
    x(i)
    ).
  attr("y", height).
  attr("dx", barWidth/2).
  attr("text-anchor", "middle").
  attr("style", "font-size: 10px; font-family: Helvetica, sans-serif;").
  text((d) -> d.month).
  attr("transform", "translate(0, 12)").
  attr("class", "xAxis");