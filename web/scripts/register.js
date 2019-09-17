////////REGISTER /////////////////////////////
     var firstName,lastName,eMail,password,password2,hintSpan, fNameHint,lNameHint,emailHint,pwHint, pw2Hint,birthYear,birthMonth, gender,genBtn,
    birthDay, genderM, genderF, mBtn, fBtn,date,info;





                         var addListeners = function(){

                        birthYear.onchange = function(){
                         birthMonth.disabled=false;
                         if(birthDay.disabled===false) populateD();
                     }; 
                    
                         birthMonth.onchange= function(){  
                             populateD();
                             birthDay.disabled=false;
                         };
            
                         genBtn.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           fBtn.style.backgroundColor="gray";
                           genderF.checked=false;
                           genderM.checked=false;
                        });
                        genBtn.addEventListener("mouseover",function(){
                           genBtn.style.backgroundColor="black"; 
                        });
                        genBtn.addEventListener("mouseout",function(){
                           genBtn.style.backgroundColor="gray"; 
                        });
                        fBtn.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           genderF.checked=true; 
                           fBtn.style.backgroundColor="#990000";
                        });
                        mBtn.addEventListener("click",function(){
                           fBtn.style.backgroundColor="gray";
                           genderM.checked=true; 
                           mBtn.style.backgroundColor="#006699";
                        });
                        genderF.addEventListener("click",function(){
                           mBtn.style.backgroundColor="gray";
                           genderF.checked=true; 
                           fBtn.style.backgroundColor="#990000";
                        });
                        genderM.addEventListener("click",function(){
                           fBtn.style.backgroundColor="gray";
                           genderM.checked=true; 
                           mBtn.style.backgroundColor="#006699";
                       });
                    };
                    
                    
                     var selectItems = function(){
                            firstName = document.querySelector("#firstName");
                            lastName = document.querySelector("#lastName");
                            eMail = document.querySelector("#eMail");
                            password = document.querySelector("#password");
                            password2 = document.querySelector("#password2"); 
                            hintSpan = document.querySelectorAll(".hintSpan");
                            fNameHint = document.querySelector("#fNameHint");
                            lNameHint = document.querySelector("#lNameHint");
                            emailHint = document.querySelector("#emailHint");     
                            pwHint = document.querySelector("#pwHint");
                            pw2Hint = document.querySelector("#pw2Hint");                     
                            birthYear = document.querySelector("#birthYear");
                            birthMonth = document.querySelector("#birthMonth");
                            birthDay = document.querySelector("#birthDay");
                            genderM = document.querySelector("#maleRadio");
                            genderF = document.querySelector("#femRadio"); 
                            mBtn = document.querySelector("#mBtn");
                            fBtn = document.querySelector("#fBtn");
                            genBtn = document.querySelector("#genBtn");
                            info = document.querySelector("#infoSpan");
                            birthMonth.disabled=true;
                            birthDay.disabled=true;
                            
                          for(var i=2005; i>1920; i--){
                          var opt = document.createElement('option');
                          opt.value = i;
                          opt.innerHTML = i;
                          birthYear.appendChild(opt);      
                            };
                            addListeners();
                          } ;
                          
                              
                        //HOW MANY DAYS ARE IN MONTH
                     var getDaysInMonth = function(month,year) { 
                            return new Date(year, month, 0).getDate();
                           };
                      //FILL DAY OPTIONS
                    var   populateD = function(){
                           while (birthDay.options.length) {
                            birthDay.remove(0);
                             }
                            var days = getDaysInMonth(birthMonth.value, birthYear.value);
                             for(var i=1; i<=days; i++){
                                 var opt = document.createElement('option');
                                 opt.value=i;
                                 opt.innerHTML = i;
                                 birthDay.appendChild(opt);
                         };}; 
                     
                        
                        //VALIDATION FUNCTIONS 
                    var checkPass = function(paw)  {  //PASSWORD
                    return /^(?=.*\d)(?=.*[a-z]).{6,15}$/.test(paw);  };

                        
                    var isMail = function(email){   //MAIL
                    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);  };

         
                        
                    var checkGender = function(){ //GENDER
				if(genderF.checked === true)
						gender = "F";
				else if(genderM.checked === true)
						gender = "M";
				else gender = null;};

                    var isSamePw = function(pw, pw2){ //DA LI JE ISTI PASSWORD
                                if(pw !== pw2){
                                    pw2Hint.innerHTML = "*Lozinke moraju biti identične*";
                                            return false;
                                        }else{
                                         if(checkPass(pw))return true;   
                                        else{if(isNumber(pw)||isWord(pw))
                                           pwHint.innerHTML = "Lozinka mora sadržati bar jedno slovo i bar jednu cifru.";
                                            if(pw.length<6 || pw.length>15) 
                                           pwHint.innerHTML = "Lozinka se mora sastojati od najmanje 6 i najviše 15 karaktera.";
                                            return false;
                                        }
                                    }};	
                        
                        //HELPER FUNCTIONS- IS CHAR LETTER/DIGIT
                        var isCharLetter = function (c){
   			 if (c >= '0' && c <= '9') 
   			 	return false;
				else  return true;	
			};

			var isCharNumber = function(c){
   			 if (c >= '0' && c <= '9') 
    			return true;
				 else return false;
			};
                        //FUNCTIONS  IS WORD OR NUBMER
			var isNumber = function(sl,num){
				sl= sl.replace(/\s/g, "");
				var provera = true;
                                if(sl.length!==0 &&((isCharNumber(sl.charAt(0)))||(sl.charAt(0)==="+")))provera=true;
                                else return false;
				for(var i =1; i<sl.length; i++){
                                    if(!isCharNumber(sl.charAt(i))){
                                        provera=false;
                                        break;
                                    }
				} if(sl.length<num)provera=false;
                                return provera;
			};

			var isWord = function(sl){
				var provera;
				if(sl===""||sl.length<2) return false;
				for(var i =0; i<sl.length; i++){
					if(isCharLetter(sl.charAt(i))) provera = true;
						else{ provera = false;
							break;
					}
				}return provera;
			};


			var capitalize = function(str){
				if(typeof str !== 'string') return '';
			 	return str.charAt(0).toUpperCase()+ str.slice(1);
			};
                        
                        
                        var takeValues= function(){
                        fNameVal = firstName.value;
			lNameVal = lastName.value;
			passwordVal = password.value;
			password2Val = password2.value;
			mailVal = eMail.value;
                        dayVal = birthDay.value;
                        monthVal= birthMonth.value;
                        yearVal = birthYear.value;
                        checkGender(); //uzima vrednost za pol  
                        };
                        
                        
                        var clear = function(){
                           firstName.style.borderColor="white"; 
                           lastName.style.borderColor="white"; 
                           eMail.style.borderColor="white"; 
                           password.style.borderColor="white"; 
                           password2.style.borderColor="white"; 
                           fNameHint.innerHTML="";
                           lNameHint.innerHTML="";
                           emailHint.innerHTML="";
                           pwHint.innerHTML="";
                           pw2Hint.innerHTML="";   
                           for(var i=0; i<hintSpan.length;i++)
                               hintSpan[i].innerHTML="";
                        };
        
                         
                         var check = function(){
                            clear();
                            if(!isWord(fNameVal)){ firstName.style.borderColor="#990000";
                            hintSpan[0].innerHTML="*";
                            fNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(fNameVal.length===0) fNameHint.innerHTML="Polje za unos imena ne može ostati prazno";
                            }
                            if(!isWord(lNameVal)){ lastName.style.borderColor="#990000";
                            hintSpan[1].innerHTML="*";
                            lNameHint.innerHTML="U ovo polje možete uneti samo slova.";
                            if(lNameVal.length===0) lNameHint.innerHTML="Polje za prezime ne može ostati prazno";
                        }
                        if(!isMail(mailVal)){
                                 eMail.style.borderColor="#990000";
                                 hintSpan[2].innerHTML="*";
                                 emailHint.innerHTML="Unos mora biti u skladu sa e-mail formatom";
                             }
                            if(!isSamePw(passwordVal,password2Val)){
                                    hintSpan[3].innerHTML="*";
                                    password.style.borderColor="#990000";
                                    password2.style.borderColor="#990000";
                                    hintSpan[4].innerHTML="*";
                                        }
                 
                             if(isWord(fNameVal)&&(isWord(lNameVal))&&(isSamePw(passwordVal,password2Val))&&(isMail(mailVal)))
                                  return true;
                                else         
                                      return false;
               
		
                       };
                       
                       var validate = function(){
                            takeValues();
                            if(check()) return true;
                            else return false;
                                //console.log("RegisterServlet?gender="+gender+"&fName="+fNameVal+"&lName="+lNameVal+
                                   // "&pw="+passwordVal+"&mail="+mailVal+"&date="+date);
                        };
