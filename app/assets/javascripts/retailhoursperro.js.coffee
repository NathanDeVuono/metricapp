select_rhs = $('.retail_hours_sold')
select_rocount = $('.retail_ro_count')
data = []
for i in [ 1 .. select_rhs.length ]
  rhs = select_rhs[(i - 1)].dataset
  rocount = select_rocount[(i - 1)].dataset
  
  data.push [ month: rhs.month, value: ( rhs.retailHoursSold / rocount.retailRoCount ).toFixed(2) ]...
console.log(data)
width = 30 * data.length;
height = 100;
max_value = d3.max(data, (d) -> d.value)

value = []
for i in [0 .. data.length - 1]
  value.push data[i].value

month = []
for i in [0 .. data.length - 1]
  month.push data[i].month

x = d3.scale.linear()
  .domain([0, data.length - 1])
  .range([0, width])
y = d3.scale.linear().
  domain([0, max_value * 1.25]).
  range([height, 0])

chart = d3.select(".detail_charts").
  append('div').
  attr('class', 'retailhoursperro').
  append("svg:svg").
  attr("width", width).
  attr("height", height).
  attr('viewBox','0 0 '+ width + ' ' + height ).
  attr('preserveAspectRatio','xMinYMin')

chart.selectAll('path.line').
  data([value]).
  enter().
  append("svg:path").
  attr('d', d3.svg.line().
    x( (d, i) ->  x(i) ).
    y( y )
    )

ticks = chart.selectAll('.tick').
  data(y.ticks( data.length )).
  enter().
  append('svg:g').
  attr('transform', (d) -> "translate(0, #{y(d)}").
  attr('class', 'tick')

ticks.append('svg:line').
  attr('y1', 0).
  attr('y2', 0).
  attr('x1', 0).
  attr('x2', width)

ticks.append('svg:text').
  text(month, (d) -> d ).
  attr('text-anchor', 'end').
  attr('dy', 2).
  attr('dx', -4)
