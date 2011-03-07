<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:include page="jsp/layout/header_menu.jsp" />
      <div id="main">
        <!-- begin: #col1 - first float column -->
        <div id="col1" role="complementary">
          <div id="col1_content" class="clearfix">
          </div>
        </div><!-- end: #col1 -->
        <!-- begin: #col3 static column -->
        <div id="col3" role="main">
          <div id="col3_content" class="clearfix">
          <div class="header_section">
          <span class="name_section">Manage Rooms</span>
          <div class="right">
		    <button class="btn_add_new">ADD NEW</button>
            <button class="btn_save_all">SAVE ALL</button>
            </div>
          </div>
          <div>
		 <form method="post" action="" class="yform full" role="application">
            <fieldset>
              <legend>Camera Singola</legend>
				<div class="subcolumns type-text">
              <div class="c33r">
              <span>Describe As:&nbsp;</span>
              <input class="describe" style="width:60px; display: inline;" readonly="true" type="text" name="description" value="room"  />
            	<a class="describe_edit" href="#" title="describe"><img src="images/sign-up-icon.png" alt="edit" /></a>
              <p>(e.g. room or villa)</p>
              </div>
              </div>
             <div class="subcolumns type-text">
      <span class="title_season">All Year round</span>&nbsp; <input type="text" class="small_input" id="all_year" name="room_price" value="30" />
             <span>&nbsp;&euro;</span>
              </div>
               <div class="subcolumns">
              &nbsp;
              </div>
              <div class="subcolumns type-text">
            <div class="c10l">
      		<span class="title_season">Max Guests:</span>&nbsp;
      		</div>
      		<div class="c10l">
      		        <div class="type_rooms">
                      <input type="input" class="small_input" name="sleeps" value="1" />
                    </div>                
                    </div>
              </div>
			 <div class="subcolumns">
              &nbsp;
              </div>
            <div class="subcolumns type-text">
            <div class="c50l">
      		<span class="title_season">Note:</span>&nbsp;
      		<textarea name="note" rows="5" cols="60"></textarea>
      		</div>
      		</div>
      		<div class="subcolumns">
              &nbsp;
              </div>
            <div class="type-button">
            <input type="text" name="new_name_season" id="chng_season_name" value=""/>
            <button class="btn_save">SAVE</button>
            <button class="btn_delete">DELETE</button>
            </div>
              </fieldset>
           </form>        
		</div>        
          </div>
<jsp:include page="jsp/layout/footer.jsp" />     