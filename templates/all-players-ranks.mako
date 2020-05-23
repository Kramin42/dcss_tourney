<%
   import loaddb, query, crawl_utils, html, scoring_data

   c = attributes['cursor']

   stats = query.get_all_player_ranks(c)
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
          "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Players</title>
    <link rel="stylesheet" type="text/css" href="tourney-score.css">
  </head>


  <body class="page_back">
    <div class="page">
      <%include file="toplink.mako"/>

      <div class="page_content">
        <div class="heading_left">
          <h1>All Players</h1>
        </div>

        <hr>

        <div class="content">
          ${html.table_text( [ 'Player', 'Clan', 'Overall Score' ]
	                    + [ ic.name for ic in
			    scoring_data.INDIVIDUAL_CATEGORIES ],
                             stats,
                             place_column=2, skip=True )}
        </div>
      </div>
    </div>
    ${html.update_time()}
  </body>
</html>
