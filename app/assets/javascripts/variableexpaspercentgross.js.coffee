select_expense = $('.total_variable_expense')
select_gross = $('.total_gross')
data = []
for i in [ 1 .. select_expense.length ]
  expense = select_expense[(i - 1)].dataset
  gross = select_gross[(i - 1)].dataset
  
  data.push [ month: expense.month, value: (( expense.totalVariableExpense / gross.totalGross ) * 100).toFixed(2) ]...

width = 320 
height = 240
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
  attr('class', 'variableexpaspercentgross col-xs-12 col-md-4').
  append("svg:svg").
  attr("width", width).
  attr("height", height).
  attr('viewBox','-60 -30 '+ (width + 100) + ' ' + height ).
  attr('preserveAspectRatio','xMinYMin')

chart.selectAll('path.line').
  data([value]).
  enter().
  append("svg:path").
  attr('d', d3.svg.line().
    x( (d, i) ->  x(i) ).
    y( y )
    ).
  attr('class', 'path')

chart.selectAll('.point').
  data(value).
  enter().
  append('svg:circle').
    attr('class', 'point').
    attr('cx', (d,i) -> x(i)).
    attr('cy', (d) -> y(d)).
    attr('r', 4)

ticks = chart.selectAll('.tick').
  data(y.ticks( 5 )).
  enter().
  append('svg:g').
  attr('class', 'tick')

ticks.append('svg:text').
  text( (d) -> d ).
  attr('text-anchor', 'end').
  attr('y', (d) -> y(d)).
  attr('x', -30)

chart.selectAll("text.xAxis").
  data(data).
  enter().append("svg:text").
  attr("x", (d, i) -> x(i)).
  attr("y", height + 20).
  attr("text-anchor", "middle").
  text((d) -> d.month).
  attr("class", "xAxis")

select_goals = $('.goals[data-other-as-percent-gross]').data()
goal = select_goals.otherAsPercentGross

chart.selectAll('path.line').
  data([goal]).
  enter().
  append('svg:line').
  attr('y1', (d) -> y(d)).
  attr('y2', (d) -> y(d)).
  attr('x1', 0).
  attr('x2', width).
  attr('class', 'goal')