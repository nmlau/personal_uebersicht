# Created by Sam Roach 1/21/2016
# Modified by Nick Lau 6/11/2016
# Bing's photo of the day backgroud without a fade to black at the bottom of the screen to make a more usable space for other widgets.

command: """
curl -s 'http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US' | grep -E -m 1 -o '<url>(.*)</url>'
"""

# Set the refresh frequency.
refreshFrequency: '1h'

style: """
  top: 0%
  left: 0%
  width: 100%
  height: 100%
  
  .wallpaper
    width: 100%
    height: 100%
    position: absolute

  .myimage
    width: 100%
    height: 100%
    position: absolute

"""

render: -> """
<div id='screen'></div>

"""

# Update the rendered output.
update: (output, domEl) ->
  mydiv = $(domEl).find('#screen')
  image = output.replace("<url>", "").replace("</url>", "").replace(/(?:\r\n|\r|\n)/g, '').trim()
  html = ''
  html += "<div class='wallpaper'> "
  html += "<img src='http://www.bing.com" + image + "' class='myimage' >"
  html += "</div>"
  
  # Set the output
  mydiv.html(html)
