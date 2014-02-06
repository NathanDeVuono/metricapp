var year = new Date().getFullYear()

function retailhoursperro (year) {
  data =  for i in [1 .. 12]
          $( '.' + year + '.' + i + ' .retail_hours_sold').text().trim() / $( '.' + year + '.' + i + ' .retail_ro_count').text().trim()


w = 4.32
h = 3

chart = d3.select(".splash_charts")
  .append('div')
  .attr('class', 'retailhoursperro')
    .append("svg")
    .attr('class', 'chart')
    .attr('viewBox','0 0 '+ w + ' ' + h )
    .attr('preserveAspectRatio','xMinYMin')

chart.selectAll("rect").data(data).enter()
  .append("rect")
   .attr("x", (d, i) -> i * (w * .083))
   .attr("y", (d, i) -> h - d)
   .attr("width", (w * .075))
   .attr("height", (d) -> d)
   .append('svg:title').text('Retail Hours Per RO')
}