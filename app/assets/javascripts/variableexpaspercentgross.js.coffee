select_expense = $('.total_variable_expense')
select_gross = $('.total_gross')
data = []
for i in [ 1 .. select_expense.length ]
  expense = select_expense[(i - 1)].dataset
  gross = select_gross[(i - 1)].dataset
  
  data.push [ month: expense.month, value: (( expense.totalVariableExpense / gross.totalGross ) * 100).toFixed(2) ]...
  console.log(data)
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
chart = d3.select(".detail_charts").
  append('div').
  attr('class', 'variableexpaspercentgross').
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