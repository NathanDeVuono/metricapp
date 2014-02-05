year = new Date().getFullYear()
data = for i in [1 .. 12]
          $('.' + year + '.' + i + ' .total_hours_sold').text().trim() / $('.' + year + '.' + i + ' .work_days_per_tech').text().trim() / $('.' + year + '.' + i + ' .number_of_techs').text().trim()

w = 14.4000
h = 10.0000

chart = d3.select(".splash_charts")
  .append("svg")
  .attr('class', 'chart')
  .attr("width", '40%')
  .attr("height", '40%')
  .attr('viewBox','0 0 '+ w + ' ' + h )
  .attr('preserveAspectRatio','xMinYMin')

chart.selectAll("rect").data(data).enter()
  .append("rect")
   .attr("x", (d, i) -> i * (w * .083))
   .attr("y", (d, i) -> h - (d))
   .attr("width", (w * .075))
   .attr("height", (d) -> (d));