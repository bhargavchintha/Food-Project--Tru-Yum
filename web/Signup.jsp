<!DOCTYPE html>
<html lang="en">
<head>
      <link rel="icon" href='images/TRU-YUM.png' />
  <link rel="icon" href='https://www.visitstaugustine.com/sites/default/files/styles/cover/public/No_name_front_5x3.jpg?itok=T_w4Aehh.96x96.png' />
    <!--this is fontawesome pro icon script start here--><link href="https://kit-pro.fontawesome.com/releases/v5.12.1/css/pro.min.css" rel="stylesheet"><!--end here-->
    <meta charset="UTF-8">
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Styles.css">
    <title> sign-up page Details</title>
    
    
    <%
        String name=request.getParameter("name");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    String password=request.getParameter("password");
    String cpassword=request.getParameter("cpassword");
   // out.print(name);
    //out.print(email);
    //out.print(phone);out.print(password);out.print(cpassword);
    
    
        %>
    
    
    
    
    
    
    </head>
    
    <style>
        *{
            margin: auto;
            padding: auto;
            box-sizing: border-box;
        }
        body{
            background-image: url("images/background.jpg");
            width: 100%;
            height: 100%;
            background-size: 70% 100%;
            background-position: left;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        @media screen and (max-width:690px){
          body{
            background-size: 100% 100%;
          }
        }
        div.LOGIN-SIGN{
            text-align: right;
            justify-content: right;
            margin-right:1px;
            width: 30%;
            height: 100%;
            min-height: 100vh;
            background-color: white;
            -webkit-box-shadow: 0 0 5px 2px #fff;
           -moz-box-shadow: 0 0 5px 2px #fff;
            box-shadow: 0 0 5px 2px #fff;
        }
        @media screen and (max-width:1250px) {
          div.LOGIN-SIGN{
            width: 38%;
          }
        }
        @media screen and (max-width:890px) {
          div.LOGIN-SIGN{
            width: 45%;
          }
        }
        @media screen and (max-width:752px) {
          div.LOGIN-SIGN{
            width: 49%;
          }
        }
        @media screen and (max-width:690px) {
          div.LOGIN-SIGN{
            text-align: center;
            justify-content: center;
            margin: auto;
            margin-right: none;
            width: 60%;
          }
        }
        @media screen and (max-width:590px) {
          div.LOGIN-SIGN{
            width: 70%;
          }
        }
        @media screen and (max-width:480px) {
          div.LOGIN-SIGN{
            width: 80%;
          }
        }
        div.LOGIN-SIGN-1{
            width: 100%;
            height: 100%;
            margin: auto;
            text-align: left;
        }
        div.LOGIN-SIGN-1{
            width: 80%;
            margin: auto;
            padding-top: 50px;
            padding-bottom: 50px;
        }
         form.LOGIN{
             padding-top: 30px;
             padding-bottom: 30px;
         }
        /* div.Tum{
             padding-top: 15px;
             padding-bottom: 30px;
         }
         h1.TUM{
            color: rgb(46, 43, 43);
            text-shadow: 2px 0px 2px;
         }*/
         div.LOGIN-h1{
            padding-top: 10px;
             padding-bottom: 30px; 
         }
         @media screen and (max-width:690px) {
           div.LOGIN-h1,
           div.sign-up-1{
             padding-top:50px;
           }
         }
         h1.Login{
            color: #204F7A;
            text-shadow: 2px 0px 2px;
         }

        h1{
            color: aliceblue;
            position: absolute;
        }
        div.label-email,
        div.password-label{
            padding-top: 10px;
            padding-bottom: 5px;
        }
        
        label.Email,
        label.Password{
            color:rgb(51, 51, 51) ;
            font-size: 22px;
        }
        div.Input-email{
          padding-bottom: 20px;
         }
        input[type="email"],
        input[type="password"]{
            width: 100%;
            outline: none;
            padding: 20px 10px;
            border: 1px solid #d7d7d7;
            border-radius: 5px;
            text-align: center;
            color: #0a3847;
        }
        input[type="email"]:hover,
        input[type="password"]:hover{
            border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
        }
        input[type="email"]:focus,
        input[type="password"]:hover{
            border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
        }
        input[type="submit"]{
             margin-top: 20px;
             margin-bottom: 15px;
           width: 100%;
            padding: 15px 20px;
            border-radius:5px;
            font-size: 18px;
            color: #fff;
            font-weight: 600;
           background-color: #1574f5;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
         }
         input[type="submit"]:hover{
            color: #1da1f2;
            background-color: #fff;
            box-shadow: 0 0 8px 0 #000; 
         }
        div.remember-forgotpassword{
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        div.Remember{
            text-align: left;
            justify-content: left;
            margin-right: 200px;
        }
        
       span.Remember{
         margin-left: 10px;
        }

a.Forgot-password{
    color: #1574f5;
    font-size: 18px;
    text-decoration: none;
}
a.Forgot-password:hover{
    color: rgb(51, 51, 51);
}
span.Account{
    font-size: 20px;
    color: rgb(51, 51, 51);
}
button#sign-up-button{
    outline: none;
    border: none;
    background-color: transparent;
    color:#1574f5;
    font-size: 19px;
    cursor: pointer;
}
button#sign-up-button:hover{
    text-decoration: underline;
    color: black;
}
div.Tru-Yums{
             color: #fff;
               position: absolute;
               top:3%;
               margin-left: 50px;
               
}

@media screen and (max-width:690px) {
  div.Tru-Yums{
    top: 0%;
    left: 30%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:650px) {
  div.Tru-Yums{
    top: 0%;
    left: 27.5%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:600px) {
  div.Tru-Yums{
    top: 0%;
    left: 25%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:550px) {
  div.Tru-Yums{
    top: 0%;
    left: 22.5%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:500px) {
  div.Tru-Yums{
    top: 0%;
    left: 20%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:450px) {
  div.Tru-Yums{
    top: 0%;
    left: 17.5%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:400px) {
  div.Tru-Yums{
    top: 0%;
    left: 15%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:350px) {
  div.Tru-Yums{
    top: 0%;
    left: 11%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:330px) {
  div.Tru-Yums{
    top: 0%;
    left: 5%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:200px) {
  div.Tru-Yums{
    top: 0%;
    left: 2%;
    transition: all 0.4s ease;
  }
}
@media screen and (max-width:150px) {
  div.Tru-Yums{
    top: 0%;
    left: -20%;
    transition: all 0.4s ease;
  }
}
 h1.Tru-Yum-1{
             font-size: 70px;
             line-height: 100px;
             margin-left: -10px;
             color: transparent;
             -webkit-text-stroke: 1px #fff;  
             -webkit-background-clip: text;      
             /*background-image: url("https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg");
             */
             background-image: url(images/background.png);
             background-position: 0 0;
             animation: back 20s linear infinite;
             z-index: 9999;
             position: fixed;
           }
           @keyframes back{
               100%{
                   background-position: 2000px 0;
               }
           }
           @media screen and (max-width:690px) {
            h1.Tru-Yum-1{
              font-size: 55px;
              -webkit-text-stroke: 1px #000; 
               position: relative;
            }
           }
            
           @media screen  and (max-width:300px){
            h1.Tru-Yum-1{
              font-size: 35px;
              -webkit-text-stroke: 1px #000; 
            }
           }
           @media screen  and (max-width:250px){
            h1.Tru-Yum-1{
              font-size: 25px;
              -webkit-text-stroke: 1px #000; 
            }
           }
           div.LOGIN-SIGN-2{
               overflow: inherit;
           }
           @media screen  and (max-width:250px){
              div.LOGIN-SIGN-2{
               overflow: hidden;
           } 
           }
           
    </style>

<body  >
    <!--<div id="google_translate_element"></div>
    <script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>-->

  <div class="Tru-Yums"><h1 class="Tru-Yum-1">TruYum <!--<span><i id="Knife" class="fad fa-utensils-alt"></i></span>--></h1> </div>
    <div class="LOGIN-SIGN">  
        <div class="LOGIN-SIGN-1">   
            <div class="LOGIN-SIGN-2">
              <div class="login-page">
                  <div class="tab">
                   
                     
                  </div>
                </div>


            
              <style>
                  div.Name-Sign{
                      padding-top: 50px;
                  }
                  div.Name-label,
                  div.Email-label,
                  div.phone-label{
                      padding-top: 5px;
                      padding-bottom: 5px;
                  }
                  label.Name{
                      font-size: 19px;
                      color:rgb(51, 51, 51) ;
                  }
                  div.Name-input{
                      padding-bottom: 10px;
                  }
                  input[type="text"],input[type="password"]{
                    width: 100%;
                     outline: none;
                     padding: 10px 10px;
                    border: 1px solid #d7d7d7;
                     border-radius: 5px;
                    text-align: center;
                    color: #0a3847;
                  }
                  input[type="text"]:hover,input[type="password"]:hover{
                    border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
                  }
                  input[type="text"]:focus,input[type="password"]:focus{
                    border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
                  }
                  div.phone-sign{
                      padding-top: 10px;
                      padding-bottom: 10px;
                  }
                  span.char{
                      font-size: 13px;
                  }
                  span.Already{
                    font-size: 20px;
                    color: rgb(51, 51, 51);
                  }
                  span.Already button{
                    outline: none;
                    border: none;
                    background-color: transparent;
                    color:#1574f5;
                   font-size: 19px;
                   cursor: pointer;
                  }
                  span.Already button:hover{
                      color: #000;
                      text-decoration: underline;
                      transition: all 0.4 ease;
                  }
                  a.indx{
                      color: #1574F5;
                      text-decoration: none;
                  }
                  a.indx:hover{
                      text-decoration: underline;
                  }
                  
                  div.Email{
            padding-bottom: 15px;
        }
        div.label-email{
            padding-top: 5px;
            padding-bottom: 5px;
        }
        label.Email,
        div.label-option{
            font-size: 19px;
            color: rgb(51, 51, 51);
            padding-bottom: 10px;
        }
        div.Input-text{
        padding-top: 10px;
        padding-bottom: 10px;
        }  
        option:checked{
           background: #1574f5;
           font-weight: bold;
        }
        #option1,#option2,#option3{
            width: 100%;
            outline: none;
            padding: 10px 10px;
            border: 1px solid #d7d7d7;
            border-radius: 5px;
            text-align: center;
            color: #0a3847;
        }
        #option1:hover,#option2:hover,#option3:hover{
                    border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
         }
                 
        #option1:focus,#option2:focus,#option3:focus{
                    border:1px solid #1574f5 ;
            box-shadow:inset 0 0 0 1px #1574f5;
        }
        div.Option{
            padding-top: 20px;
            transition: 0.3s all linear;
        }
        div.sign-up-2{
            padding-top: 10px;
        }
        a.Back-To {
  background-color: #fff;
  color: #1574f5;
  padding: 7px 20px;
  transition: 0.3s linear all;
  text-decoration: none;
  border: 1px solid #1574F5;
  margin-top: 20px;
  border-radius: 5px;
}

a.Back-To:hover {
  background-color: #1574F5;
  color: #fff;
  box-shadow: 0 0 8px 0 #1574F5;
  padding: 7px 30px; 
}

span.Arrow-left {
  display: none;
}

a.Back-To:hover span.Arrow-left {
  display: inline;
}
div.hidden{
    display: none;
}

              </style>
              <div id="sign-up" class="tabcontent">
                <div class="sign-up-1">
                    <a class="Back-To" href="Signup.html"> <span class="Arrow-left"><i class="fa fa-arrow-left"></i></span> Back</a>
                  <div class="sign-up-2">
                      <form  method="post"  name="contactForm" action="fromsignup.jsp" onsubmit=" validateForms()" >

                          <div class="hidden">
                               <input type="hidden" pattern="[a-z]{1,15}"  placeholder=" Enter Your Name"  name="name"  value="<%=name %> "  required  />
                               <input type="hidden" id="email" 
                                    pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
                                    placeholder="Email"  name="email"  value="<%=email %>" required />
                               <input type="hidden"  pattern="^\d{3}\d{3}\d{4}$"  name="phone" value="<%=phone %>" placeholder="Phone number"  required />
                               <input type="hidden" id="password" minlength="8" required value="<%=password %>" placeholder="Password" name="password" />
                               <input type="hidden"  id="cpassword" minlength="8" required value="<%=cpassword %>" placeholder=" Confirm  Password" name="cpassword" />
                          </div>
                          
                          <div class="Option">    
                    
                    <div class="label-option"><label for="option1">Option 1:</label></div>
                
                 <select id="option1" name="option1" onchange="updateOptions()">
                <option disabled selected>Choose an option</option>
                <option value="what is your best friend Name?">what is your best friend Name</option>
                <option value="what is your favorite Color?">what is your favorite Color?</option>
                <option value="what is your favorite Dog?">what is your favorite Dog?</option>
                <option value="what is your favorite Place?">what is your favorite Place?</option>
                <option value="What is your best place to visit?">What is your best place to visit?</option>
                <option value="what is your favorite Car name?">what is your favorite Car name?</option>
                <option value="what is your favorite Bike name?">what is your favorite Bike name?</option>
                </select>
                    <div class="Input-text"><input type="text" name="inputone" placeholder="Enter answer for option 1" required=""  ></div>

                <div class="label-option"><label for="option2">Option 2:</label></div>
                <select id="option2" name="option2" onchange="updateOptions()">
                <option disabled selected>Choose an option</option>
                <option value="what is your best friend Name?">what is your best friend Name</option>
                <option value="what is your favorite Color?">what is your favorite Color?</option>
                <option value="what is your favorite Dog?">what is your favorite Dog?</option>
                <option value="what is your favorite Place?">what is your favorite Place?</option>
                <option value="What is your best place to visit?">What is your best place to visit?</option>
                <option value="what is your favorite Car name?">what is your favorite Car name?</option>
                <option value="what is your favorite Bike name?">what is your favorite Bike name?</option>
                </select>
                <div class="Input-text"><input type="text" name="inputtwo" placeholder="Enter answer for option 2"  required="" ></div>

                <div class="label-option"><label for="option3">Option 3:</label></div>
                <select id="option3" name="option3" onchange="updateOptions()">
                <option disabled selected>Choose an option</option>
                <option value="what is your best friend Name?">what is your best friend Name</option>
                <option value="what is your favorite Color?">what is your favorite Color?</option>
                <option value="what is your favorite Dog?">what is your favorite Dog?</option>
                <option value="what is your favorite Place?">what is your favorite Place?</option>
                <option value="What is your best place to visit?">What is your best place to visit?</option>
                <option value="what is your favorite Car name?">what is your favorite Car name?</option>
                <option value="what is your favorite Bike name?">what is your favorite Bike name?</option>
                </select>
                <div class="Input-text"><input type="text" name="inputthree" placeholder="Enter answer for option 3"  required="" ></div>
                          <script>
 // Get references to the select elements and text input fields
const option1Select = document.getElementById("option1");
const option2Select = document.getElementById("option2");
const option3Select = document.getElementById("option3");
const option1Input = document.getElementsByName("option1_input");
const option2Input = document.getElementsByName("option2_input");
const option3Input = document.getElementsByName("option3_input");

// Add event listeners to the select elements to update options when changed
option1Select.addEventListener("change", updateOptions);
option2Select.addEventListener("change", updateOptions);
option3Select.addEventListener("change", updateOptions);

function updateOptions() {
  // Get the selected values
  const option1 = option1Select.value;
  const option2 = option2Select.value;
  const option3 = option3Select.value;

  // Hide previously selected options in all three select elements
  const options = [option1, option2, option3];
  const optionInputs = [option1Select, option2Select, option3Select];
  
  for (let i = 0; i < optionInputs.length; i++) {
    const selectedOption = options[i];
    const otherOptions = options.filter(option => option !== selectedOption && option !== "");
    const otherOptionInputs = optionInputs.filter(input => input !== optionInputs[i]);
    
    for (let j = 0; j < otherOptionInputs.length; j++) {
      const otherOptionInput = otherOptionInputs[j];
      const otherOptionValues = Array.from(otherOptionInput.options).map(option => option.value).filter(value => value !== "");
      
      for (let k = 0; k < otherOptionValues.length; k++) {
        const value = otherOptionValues[k];
        
        if (value === selectedOption) {
          otherOptionInput.querySelector(`option[value='${value}']`).style.display = "none";
        } else if (!otherOptions.includes(value)) {
          otherOptionInput.querySelector(`option[value='${value}']`).style.display = "block";
        }
      }
    }
  }
  
  // Clear the value and text input for any select element that matches another select element
  if (option1 === option2 && option1 !== "") {
    option2Select.value = "";
    option2Input.value = "";
  }
  
  if (option1 === option3 && option1 !== "") {
    option3Select.value = "";
    option3Input.value = "";
  }
  
  if (option2 === option3 && option2 !== "") {
    option3Select.value = "";
    option3Input.value = "";
  }
}


</script>
                          </div>
                
                

                            <input type="submit" value="Submit"    >
                      </form>
                      <div class="LOGIN">
                          <span class="Already"> Already have an account?  <a class="indx"  href="index.html"> Login </a> </span>
                      </div>  
                    </div>  
                </div>
              </div>
      

                  
                  
             </div>
        </div>
    </div> 
    
    






    <div class="recaptcha">
       
        <div class="recaptcha-1">
          <div class="recaptcha-2">
            <div class="recaptcha-3 left">
              <div class="recaptcha-image"></div>
              <div class="recaptcha-2">
              <a href="https://www.google.com/intl/en/policies/privacy/" target="_blank" class="recaptcha"> Privacy</a><span></span>  <span><a class="recaptcha" href="https://www.google.com/intl/en/policies/terms/">Terms </a></span>
             </div>  
            </div>
            <div class="recaptcha-3 right" >
            <span> <p class="protected" >protected by  <strong>reCAPTCHA</strong>  </p></span>
            <div class="recaptcha-4">
            <a href="https://www.google.com/intl/en/policies/privacy/" target="_blank" class="recaptcha-1"> Privacy</a><span class="recaptcha" > &nbsp;</span><a class="recaptcha-1" href="https://www.google.com/intl/en/policies/terms/">Terms </a></span>
          </div>  
          </div>
          </div>
        
        </div>
        </div>
    
  
  
  
  
  <script >
        
        const cookieContainer = document.querySelector(".cookie-container");
        const cookieButton = document.querySelector(".cookie-btn");
        
    cookieButton.addEventListener("click", () => {
    cookieContainer.classList.remove("active");
    
    localStorage.setItem("_grecaptcha(done by bhargav)",  "09AINsHFc2uoI1NI35z0ref-oSZUuZUxeHb6E2g-zYQ7VS7l6GUozDM2ZnCgQ2BeiDsDMeZirZK2p5cOPVMKflDc0",);
    });
    
    
    setTimeout(() => {
    if (!localStorage.getItem("_grecaptcha(done by bhargav)")) {
      cookieContainer.classList.add("active");
    }
    }, 100);
      </script>
  
  

 <script>
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('message');
    if (message) {
        alert(message);
    }
</script>

  
</body>
</html>