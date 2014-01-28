data = [
            413,234,314,243,523,143,233,312,413,234
          ]
chartHeight = 500

# w = document.getElementsByClassName("chart").clientWidth
# h = document.getElementsByClassName("chart").clientHeight

w = 720
h = 500

chart = d3.select(".chart")
  .append("svg")
  .attr("width", '100%')
  .attr("height", '100%')
  .attr('viewBox','0 0 '+ w + ' ' + h )
  .attr('preserveAspectRatio','xMinYMin')

chart.selectAll("rect").data(data).enter()
  .append("rect")
   .attr("x", (d, i) -> i * (w * .1))
   .attr("y", (d, i) -> h - d)
   .attr("width", (w * .08))
   .attr("height", (d) -> d);