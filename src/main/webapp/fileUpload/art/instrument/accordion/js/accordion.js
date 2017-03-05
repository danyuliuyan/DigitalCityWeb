// JavaScript Document
//按键动画以及声音控制
/*@author 淡雨流烟*/
/*version 1.1.0*/
 document.onkeydown = function(e) {
		var pressEvent = e || window.event;
		var keyCode = '';
		if(pressEvent.keyCode){
			keyCode = pressEvent.keyCode;
		}else if(pressEvent.charCode){
			keyCode = pressEvent.charCode;
		}else if(pressEvent.which){
			keyCode = pressEvent.which;
		}
		switch(keyCode) {   
				/*左手键*/
		case 96:
		{   
			var musicfile='audio/E.mp3';
	     playMusic=new Audio(musicfile);
         playMusic.play();
		 var change="document.getElementById('youjian').style.background="+"url('../images/zuojian0.png')"
		 document.getElementById('youjian').style.background="url('../images/zuojian1.png')";	
         setTimeout(change,100);}
	    
		/*右手白键0*/
		case 188: {
	     var musicfile='audio/diyinG.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key0').style.visibility='visible';
	     setTimeout("document.getElementById('key0').style.visibility='hidden'",100);
	        break;} ; 
			case 190: {
	     var musicfile='audio/diyinA.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key1').style.visibility='visible';
	     setTimeout("document.getElementById('key1').style.visibility='hidden'",100);
	        break;} ; 
			case 191: {
	     var musicfile='audio/diyinB.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key2').style.visibility='visible';
	     setTimeout("document.getElementById('key2').style.visibility='hidden'",100);
	        break;} ; 
		
		 
	   /*右手白键1*/	      //zxcvbnm
		case 90: {
	     var musicfile='audio/C.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key3').style.visibility='visible';
	     setTimeout("document.getElementById('key3').style.visibility='hidden'",100);
	        break;} ; 
	 
	 
	                       
		case 88: {var musicfile='audio/D.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key4').style.visibility='visible';
	     setTimeout("document.getElementById('key4').style.visibility='hidden'",100);
	      break;} ;  
	 
	          
		case 67: {var musicfile='audio/E.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key5').style.visibility='visible';
	     setTimeout("document.getElementById('key5').style.visibility='hidden'",100);
	      break;} ; 
		  
		  
		case 86: {var musicfile='audio/F.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key6').style.visibility='visible';
	     setTimeout("document.getElementById('key6').style.visibility='hidden'",100);
	      break;} ; 
		  
		  
		case 66: {var musicfile='audio/G.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key7').style.visibility='visible';
	     setTimeout("document.getElementById('key7').style.visibility='hidden'",100);
	     break;} ; 
		 
		 
		case 78: {var musicfile='audio/A.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key8').style.visibility='visible';
	     setTimeout("document.getElementById('key8').style.visibility='hidden'",100);
	     break;} ; 
		 
		case 77: {var musicfile='audio/B.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key9').style.visibility='visible';
	     setTimeout("document.getElementById('key9').style.visibility='hidden'",100);
	 break;} ; 
		/* 右手黑键1*/
		case 68: {} ;          //dfghj  
		case 70: {} ; 
		case 71: {} ; 
		case 72: {} ;
		case 73: {} ;   
		
		/*右手白键2*/
		 
		case 81: {var musicfile='audio/gaoyinC.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key10').style.visibility='visible';
	     setTimeout("document.getElementById('key10').style.visibility='hidden'",100);
	 break;} ;           //qwertyu 
		case 87: {var musicfile='audio/gaoyinD.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key11').style.visibility='visible';
	     setTimeout("document.getElementById('key11').style.visibility='hidden'",100);
	 break;} ; 
		case 69: {var musicfile='audio/gaoyinE.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key12').style.visibility='visible';
	     setTimeout("document.getElementById('key12').style.visibility='hidden'",100);
	 break;} ; 
		case 82: {var musicfile='audio/gaoyinF.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key13').style.visibility='visible';
	     setTimeout("document.getElementById('key13').style.visibility='hidden'",100);
	 break;} ; 
		case 84: {var musicfile='audio/gaoyinG.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key14').style.visibility='visible';
	     setTimeout("document.getElementById('key14').style.visibility='hidden'",100);
	 break;} ; 
		case 89: {var musicfile='audio/gaoyinA.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key15').style.visibility='visible';
	     setTimeout("document.getElementById('key15').style.visibility='hidden'",100);
	 break;} ;
		case 85: {var musicfile='audio/gaoyinB.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key16').style.visibility='visible';
	     setTimeout("document.getElementById('key16').style.visibility='hidden'",100);
	 break;} ;
	
	/*	右手黑键2      */     //asiop
	//	case 65: {} ;
		case 82: {} ;
		case 73: {} ;
		case 79: {} ;
		case 80: {} ;    
	/*右手白键3*/
	    case 219: {var musicfile='audio/ac_gao2_C.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key17').style.visibility='visible';
	     setTimeout("document.getElementById('key17').style.visibility='hidden'",100);
	 break;}
	  case 220:{var musicfile='audio/ac_gao2_D.mp3'
	     playMusic=new Audio(musicfile);
         playMusic.play();
	     document.getElementById('key18').style.visibility='visible';
	     setTimeout("document.getElementById('key18').style.visibility='hidden'",100);
	 break;}
		

		}
		}