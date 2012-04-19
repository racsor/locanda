<%--
 *
 *  Copyright 2011 - Sardegna Ricerche, Distretto ICT, Pula, Italy
 *
 * Licensed under the EUPL, Version 1.1.
 * You may not use this work except in compliance with the Licence.
 * You may obtain a copy of the Licence at:
 *
 *  http://www.osor.eu/eupl
 *
 * Unless required by applicable law or agreed to in  writing, software distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and limitations under the Licence.
 * In case of controversy the competent court is the Court of Cagliari (Italy).
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:include page="layout/header_menu.jsp" />
<script>
Entity = {name: "priceList", 
		model: function(options){ return new PriceList( options );},
		collection: function(options){ return new PriceList( options );},
		editView: null,
		idStructure : <s:property value="#session.user.structure.id"/>
		};
</script>
<link rel='stylesheet' type='text/css' href='css/screen/basemod_2col_left_tree.css'/>
  <div id="main">
    <div id="col2" role="complementary">
      <div id="col2_content" class="clearfix">
        <div class="header_section">
       	  <span class="name_section"><s:text name="extraPriceLists"/></span>
      	</div>
      </div>
    </div>
      
    <div id="col1" role="complementary">
      <div id="col1_content" class="clearfix">
        <div class="treeContainer">
      	  <div class="extra_tree"></div>
      	</div>
      </div>
    </div>
        
    <div id="col3" role="main">
      <div id="col3_content" class="clearfix">   	
        <div class="priceTable">
          <form class="yform json full noBorder" id="priceList_form" action="updateExtraPriceListItems.action">
	  	    <fieldset>
          	  <legend>
          	    <span><s:text name="priceListEdit"/> -></span>
          	    <a href="#" id="priceList_edit"><img src="images/sign-up-icon.png" alt="edit"/></a>
          	    <span id="path_nodes"></span>
          	  </legend>
          	  <table class="full priceList_table">
          	    <thead>
          	  	  <tr>
          		    <th><s:text name="extra"/></th><th><s:text name="price"/></th>
          		  </tr>
          	    </thead>
          	    <tbody>
          	    <!-- here an AJAX call puts the table rows-->
          	   </tbody>
          	  </table>
          	  <div class="type-button right" id=priceList_buttons></div>
            </fieldset>
          </form>
        </div>  	
	  </div>
    </div>
  </div>	  
<jsp:include page="layout/footer.jsp" />     