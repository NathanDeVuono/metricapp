year = new Date().getFullYear()
months = $('.' + year + '.total_hours_sold').length
data = for i in [1 .. months]
          $('.' + year + '.' + i + ' .total_hours_sold').text().trim() / $('.' + year + '.' + i + ' .work_days_per_tech').text().trim() / $('.' + year + '.' + i + ' .number_of_techs').text().trim()

w = 14.4000
h = 10.0000



chart = d3.select(".splash_charts")
  .append('div')
  .attr('class', 'hourspertechperday')
    .append("svg")
    .attr('class', 'chart')
    .attr('viewBox','0 0 '+ w + ' ' + h )
    .attr('preserveAspectRatio','xMinYMin')

chart.selectAll("rect").data(data).enter()
  .append("rect")
   .attr("x", (d, i) -> i * (w * .083))
   .attr("y", (d, i) -> h - (d))
   .attr("width", (w * .075))
   .attr("height", (d) -> (d))
   .append('svg:title').text('Hours Per Tech, Per Day')

chart.append('text')
  .attr('class', 'x label')
  .attr('text-anchor', 'end')
  .attr('x', w)
  .attr('y', h - 6)
  .text('Month')