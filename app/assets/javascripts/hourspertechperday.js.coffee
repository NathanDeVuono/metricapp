data = [
        $( new Date().getFullYear() + '.total_hours_sold').text().trim() / $('.2009 .work_days_per_tech').text().trim() / $('.2009 .number_of_techs').text().trim()
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
   .attr("y", (d, i) -> h - (d * 10000))
   .attr("width", (w * .075))
   .attr("height", (d) -> (d * 10000));