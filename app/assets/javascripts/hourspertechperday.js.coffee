year = new Date().getFullYear()
data = [
        $('.' + year + ' .total_hours_sold').text().trim() / $('.' + year + ' .work_days_per_tech').text().trim() / $('.' + year + ' .number_of_techs').text().trim()
       ]
chartHeight = 500

# w = document.getElementsByClassName("chart").clientWidth
# h = document.getElementsByClassName("chart").clientHeight

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