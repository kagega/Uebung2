<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page import="java.util.List" %>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Question" %>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Category" %>
<%@page import="at.ac.tuwien.big.we15.lab2.servlet.jeopardyServlet" %>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Business Informatics Group Jeopardy! - Fragenauswahl</title>
        <link rel="stylesheet" type="text/css" href="style/base.css" />
        <link rel="stylesheet" type="text/css" href="style/screen.css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/framework.js" type="text/javascript"></script>
   </head>
   <body id="selection-page">
      <a class="accessibility" href="#question-selection">Zur Fragenauswahl springen</a>
      <!-- Header -->
      <header role="banner" aria-labelledby="bannerheading">
         <h1 id="bannerheading">
            <span class="accessibility">Business Informatics Group </span><span class="gametitle">Jeopardy!</span>
         </h1>
      </header>
      
      <!-- Navigation -->
		<nav role="navigation" aria-labelledby="navheading">
			<h2 id="navheading" class="accessibility">Navigation</h2>
			<ul>
				<li><a class="orangelink navigationlink" id="logoutlink" title="Klicke hier um dich abzumelden" href="#" accesskey="l">Abmelden</a></li>
			</ul>
		</nav>
      
      <!-- Content -->
      <div role="main"> 
         <!-- info -->
         <section id="gameinfo" aria-labelledby="gameinfoinfoheading">
            <h2 id="gameinfoinfoheading" class="accessibility">Spielinformationen</h2>
            <section id="firstplayer" class="playerinfo leader" aria-labelledby="firstplayerheading">
               <h3 id="firstplayerheading" class="accessibility">F&uuml;hrender Spieler</h3>
               <img class="avatar" src="img/avatar/black-widow_head.png" alt="Spieler-Avatar Black Widow" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername">Black Widow (Du)</td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">2000 &euro;</td>
                  </tr>
               </table>
            </section>
            <section id="secondplayer" class="playerinfo" aria-labelledby="secondplayerheading">
               <h3 id="secondplayerheading" class="accessibility">Zweiter Spieler</h3>
               <img class="avatar" src="img/avatar/deadpool_head.png" alt="Spieler-Avatar Deadpool" />
               <table>
                  <tr>
                     <th class="accessibility">Spielername</th>
                     <td class="playername">Deadpool</td>
                  </tr>
                  <tr>
                     <th class="accessibility">Spielerpunkte</th>
                     <td class="playerpoints">400 &euro;</td>
                  </tr>
               </table>
            </section>
            <p id="round">Fragen: 2 / 10</p>
         </section>

         <!-- Question -->
         <section id="question-selection" aria-labelledby="questionheading">
            <h2 id="questionheading" class="black accessibility">Jeopardy</h2>
            <p class="user-info positive-change">Du hast richtig geantwortet: +1000 &euro;</p>
            <p class="user-info negative-change">Deadpool hat falsch geantwortet: -500 &euro;</p>
            <p class="user-info">Deadpool hat TUWIEN f&uuml;r &euro; 1000 gew&auml;hlt.</p>
            <form id="questionform" action="question.jsp" method="post">
               <fieldset>
               <legend class="accessibility">Fragenauswahl</legend>
               <section class="questioncategory" aria-labelledby="tvheading">
                  <h3 id="tvheading" class="tile category-title"><span class="accessibility">Kategorie: </span>TV</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_1" value="1" type="radio" disabled="disabled" /><label class="tile clickable" for="question_1">&euro; 100</label></li>
                     <li><input name="question_selection" id="question_2" value="2" type="radio"/><label class="tile clickable" for="question_2">&euro; 200</label></li>
                     <li><input name="question_selection" id="question_3" value="3" type="radio"/><label class="tile clickable" for="question_3">&euro; 500</label></li>
                     <li><input name="question_selection" id="question_4" value="4" type="radio"/><label class="tile clickable" for="question_4">&euro; 750</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="ssdheading">
                  <h3 id="ssdheading" class="tile category-title"><span class="accessibility">Kategorie: </span>SSD</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_5" value="5" type="radio" /><label class="tile clickable" for="question_5">&euro; 100</label></li>
                     <li><input name="question_selection" id="question_6" value="6" type="radio" /><label class="tile clickable" for="question_6">&euro; 200</label></li>
                     <li><input name="question_selection" id="question_7" value="7" type="radio" /><label class="tile clickable" for="question_7">&euro; 500</label></li>
                     <li><input name="question_selection" id="question_8" value="8" type="radio" /><label class="tile clickable" for="question_8">&euro; 750</label></li>
                     <li><input name="question_selection" id="question_9" value="9" type="radio" /><label class="tile clickable" for="question_9">&euro; 1000</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="webheading">
                  <h3 id="webheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Web</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_10" value="10" type="radio" /><label class="tile clickable" for="question_10">&euro; 100</label></li>
                     <li><input name="question_selection" id="question_11" value="11" type="radio" /><label class="tile clickable" for="question_11">&euro; 200</label></li>
                     <li><input name="question_selection" id="question_12" value="12" type="radio" disabled="disabled" /><label class="tile clickable" for="question_12">&euro; 500</label></li>
                     <li><input name="question_selection" id="question_13" value="13" type="radio" /><label class="tile clickable" for="question_13">&euro; 750</label></li>
                     <li><input name="question_selection" id="question_14" value="14" type="radio" /><label class="tile clickable" for="question_14">&euro; 1000</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="sportheading">
                  <h3 id="sportheading" class="tile category-title"><span class="accessibility">Kategorie: </span>Sport</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_15" value="15" type="radio" /><label class="tile clickable" for="question_15">&euro; 100</label></li>
                     <li><input name="question_selection" id="question_16" value="16" type="radio" disabled="disabled" /><label class="tile clickable" for="question_16">&euro; 200</label></li>
                     <li><input name="question_selection" id="question_17" value="17" type="radio" /><label class="tile clickable" for="question_17">&euro; 500</label></li>
                     <li><input name="question_selection" id="question_18" value="18" type="radio" /><label class="tile clickable" for="question_18">&euro; 750</label></li>
                  </ol>
               </section>
               <section class="questioncategory" aria-labelledby="tuwienheading">
                  <h3 id="tuwienheading" class="tile category-title"><span class="accessibility">Kategorie: </span>TUWIEN</h3>
                  <ol class="category_questions">
                     <li><input name="question_selection" id="question_19" value="19" type="radio" /><label class="tile clickable" for="question_19">&euro; 100</label></li>
                     <li><input name="question_selection" id="question_20" value="20" type="radio" /><label class="tile clickable" for="question_20">&euro; 200</label></li>
                     <li><input name="question_selection" id="question_21" value="21" type="radio" /><label class="tile clickable" for="question_21">&euro; 500</label></li>
                     <li><input name="question_selection" id="question_22" value="22" type="radio" /><label class="tile clickable" for="question_22">&euro; 750</label></li>
                     <li><input name="question_selection" id="question_23" value="23" type="radio" disabled="disabled" /><label class="tile clickable" for="question_23">&euro; 1000</label></li>
                  </ol>
               </section> 
               </fieldset>               
               <input class="greenlink formlink clickable" name="question_submit" id="next" type="submit" value="w&auml;hlen" accesskey="s" />
            </form>
         </section>
         
         <section id="lastgame" aria-labelledby="lastgameheading">
            <h2 id="lastgameheading" class="accessibility">Letztes Spielinfo</h2>
            <p>Letztes Spiel: Nie</p>
         </section>
		</div>
		
      <!-- footer -->
      <footer role="contentinfo">&copy; 2015 BIG Jeopardy!</footer>
	  
	  <script type="text/javascript">
            //<![CDATA[
            
            // initialize time
            $(document).ready(function() {
                // set last game
                if(supportsLocalStorage()) {
	                var lastGameMillis = parseInt(localStorage['lastGame'])
	                if(!isNaN(parseInt(localStorage['lastGame']))){
	                    var lastGame = new Date(lastGameMillis);
	                	$("#lastgame p").replaceWith('<p>Letztes Spiel: <time datetime="'
	                			+ lastGame.toUTCString()
	                			+ '">'
	                			+ lastGame.toLocaleString()
	                			+ '</time></p>')
	                }
            	}
            });            
            //]]>
        </script>
    </body>
</html>
