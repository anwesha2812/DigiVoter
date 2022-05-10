/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function compare() {
    var a = new Date(document.getElementById("Application_Opening_Date").value);
    var b = new Date(document.getElementById("Application_Closing_Date").value);
    var c = new Date(document.getElementById("Voting_Opening_Date").value);
    var d = new Date(document.getElementById("Voting_Closing_Date").value);
    var resultapp ;
    var resultvote;
    var result;


    if(a>b ){
            resultapp="Please enter a valid Closing Date";
            document.getElementById("submit").disabled=true;
            document.getElementById("Voting_Opening_Date").disabled=true;
            document.getElementById("Voting_Closing_Date").disabled=true;
            document.getElementById("app").style.color="yellow";
        
        return resultapp;
    
         }

    else if(c>d){
        
        resultvote="Please enter a valid Closing Date";
        document.getElementById("submit").disabled=true;
        document.getElementById("vote").style.color="yellow";
        return resultvote;
        
    }
    
    else{
        result="Dates are valid";
        document.getElementById("Voting_Opening_Date").disabled=false;
        document.getElementById("Voting_Closing_Date").disabled=false;
            document.getElementById("submit").disabled=false;
            document.getElementById("app").style.color="#8AFFB3";
            document.getElementById("vote").style.color="#8AFFB3";
            return result;
        }
         
 }