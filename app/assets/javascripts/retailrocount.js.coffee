data = [
        $( '.' + new Date().getFullYear() + '.retail_ro_count').text().trim()
       ]

w = 288
h = 200

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
   .attr("y", (d, i) -> h - d)
   .attr("width", (w * .075))
   .attr("height", (d) -> d);