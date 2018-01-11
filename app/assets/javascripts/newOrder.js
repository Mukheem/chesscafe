$(function () {
    //var flag = 1;
    var addInputRow = function () {
        //create <tr> tag and <td> tags
                var tr = document.createElement("tr");
                

            function callback(attribname,siz){
                //Replace 0 with falg variable orderplaced[][itemname] 
                /*idAttributitemname = 
                       "order[orderplaced][" + attribname + "][0]".replace("0", flag);
                nameAttributitemname = 
                       "order[orderplaced][" + attribname + "][0]".replace("0", flag);*/

                nameAttributitemname = 
                       "order[order_placed][][" + attribname + "]";
                
                //create input for itemname, set it's type, id and name attribute
                var inputitemname = document.createElement("INPUT");
                inputitemname.setAttribute("type", "text");
                inputitemname.setAttribute("name", nameAttributitemname);
                inputitemname.setAttribute("size", siz);
                inputitemname.setAttribute("class", "form-control");
                //and append it to <td> element and then <tr> 
                var td = document.createElement("td");
                td.appendChild(inputitemname);  
                tr.appendChild(td);
            }

            callback("itemname","30");
            callback("quantity","10");
            callback("unitprice","10");
            callback("tax","10");
            callback("discount","10");
            callback("itemtotalprice","10");
            
               document.getElementById("template").appendChild(tr);

               // flag = flag + 1;

        //$('#input').append($('#template').html());
    }; 

    var addAll = function (){
         addInputRow();
    };

    $('#ActionAddRow').on('click', addAll);



    
});