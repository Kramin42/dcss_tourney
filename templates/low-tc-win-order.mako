<%
   import loaddb, query, html
   c = attributes['cursor']

   game_text = \
      html.games_table( query.low_turncount_win_order(c, limit = None),
                        first = 'turn', place_column = 1, skip = True )
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Lowest Turn-count Win Ranking</title>
    <link rel="stylesheet" type="text/css" href="tourney-score.css">
  </head>

  <body class="page_back">
    <div class="page">
      <%include file="toplink.mako"/>

      <div class="page_content">

        <h2>Lowest Turn-coun Win Ranking</h2>

		${game_text}
	  </div>

    ${html.update_time()}
  </body>
</html>