/**
 * Created by liuyan on 2016/12/17.
 */
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

	Label:if (keyCode === 81) {
		{
			var musicfile = 'audio/C3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			setTimeout(function(){$("#key0").removeClass("whitebt_press_special");},500);



		}
	} else if (keyCode === 87) {
		{
			var musicfile = 'audio/D3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key1").removeClass("whitebt_normal");
			$("#key1").addClass("whitebt_press_special");

			setTimeout(function(){$("#key1").removeClass("whitebt_press_special");},500);
			$("#key1").addClass("whitebt_normal");
		}
	} else if (keyCode === 69) {
		{
			var musicfile = 'audio/E3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key2").removeClass("whitebt_normal");
			$("#key2").addClass("whitebt_press_special");

			setTimeout(function(){$("#key2").removeClass("whitebt_press_special");},500);
			$("#key2").addClass("whitebt_normal");
		}
	} else if (keyCode === 82) {
		{
			var musicfile = 'audio/F3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key3").removeClass("whitebt_normal");
			$("#key3").addClass("whitebt_press_special");

			setTimeout(function(){$("#key3").removeClass("whitebt_press_special");},500);
			$("#key3").addClass("whitebt_normal");

		}
	} else if (keyCode === 84) {
		{
			var musicfile = 'audio/G3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key4").removeClass("whitebt_normal");
			$("#key4").addClass("whitebt_press_special");

			setTimeout(function(){$("#key4").removeClass("whitebt_press_special");},500);
			$("#key4").addClass("whitebt_normal");
		}
	} else if (keyCode === 89) {
		{
			var musicfile = 'audio/A3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key5").removeClass("whitebt_normal");
			$("#key5").addClass("whitebt_press_special");

			setTimeout(function(){$("#key5").removeClass("whitebt_press_special");},500);
			$("#key5").addClass("whitebt_normal");
		}
	} else if (keyCode === 85) {
		{
			var musicfile = 'audio/B3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key6").removeClass("whitebt_normal");
			$("#key6").addClass("whitebt_press_special");

			setTimeout(function(){$("#key6").removeClass("whitebt_press_special");},500);
			$("#key6").addClass("whitebt_normal");
		}
	} else if (keyCode === 90) {
		{
			var musicfile = 'audio/C4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key7").removeClass("whitebt_normal");
			$("#key7").addClass("whitebt_press_special");

			setTimeout(function(){$("#key7").removeClass("whitebt_press_special");},500);
			$("#key7").addClass("whitebt_normal");
		}
	} else if (keyCode === 88) {
		{
			var musicfile = 'audio/D4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key8").removeClass("whitebt_normal");
			$("#key8").addClass("whitebt_press_special");

			setTimeout(function(){$("#key8").removeClass("whitebt_press_special");},500);
			$("#key8").addClass("whitebt_normal");
		}
	} else if (keyCode === 67) {
		{
			var musicfile = 'audio/E4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key9").removeClass("whitebt_normal");
			$("#key9").addClass("whitebt_press_special");

			setTimeout(function(){$("#key9").removeClass("whitebt_press_special");},500);
			$("#key9").addClass("whitebt_normal");
		}
	} else if (keyCode === 86) {
		{
			var musicfile = 'audio/F4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key10").removeClass("whitebt_normal");
			$("#key10").addClass("whitebt_press_special");

			setTimeout(function(){$("#key10").removeClass("whitebt_press_special");},500);
			$("#key10").addClass("whitebt_normal");
		}
	} else if (keyCode === 66) {
		{
			var musicfile = 'audio/G4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key11").removeClass("whitebt_normal");
			$("#key11").addClass("whitebt_press_special");

			setTimeout(function(){$("#key11").removeClass("whitebt_press_special");},500);
			$("#key11").addClass("whitebt_normal");
		}
	} else if (keyCode === 78) {
		{
			var musicfile = 'audio/A4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key12").removeClass("whitebt_normal");
			$("#key12").addClass("whitebt_press_special");

			setTimeout(function(){$("#key12").removeClass("whitebt_press_special");},500);
			$("#key12").addClass("whitebt_normal");
		}
	} else if (keyCode === 77) {
		{
			var musicfile = 'audio/B4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key13").removeClass("whitebt_normal");
			$("#key13").addClass("whitebt_press_special");

			setTimeout(function(){$("#key13").removeClass("whitebt_press_special");},500);
			$("#key13").addClass("whitebt_normal");
		}
	} else if (keyCode === 188) {
		{
			var musicfile = 'audio/C5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key14").removeClass("whitebt_normal");
			$("#key14").addClass("whitebt_press_special");

			setTimeout(function(){$("#key14").removeClass("whitebt_press_special");},500);
			$("#key14").addClass("whitebt_normal");
		}
	} else if (keyCode === 191) {
		{
			var musicfile = 'audio/D5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key15").removeClass("whitebt_normal");
			$("#key15").addClass("whitebt_press_special");

			setTimeout(function(){$("#key15").removeClass("whitebt_press_special");},500);
			$("#key15").addClass("whitebt_normal");
		}
	} else if (keyCode === 76) {
		{
			var musicfile = 'audio/E5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key16").removeClass("whitebt_normal");
			$("#key16").addClass("whitebt_press_special");

			setTimeout(function(){$("#key16").removeClass("whitebt_press_special");},500);
			$("#key16").addClass("whitebt_normal");
		}
	} else if (keyCode === 186) {
		{
			var musicfile = 'audio/F5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key17").removeClass("whitebt_normal");
			$("#key17").addClass("whitebt_press_special");

			setTimeout(function(){$("#key17").removeClass("whitebt_press_special");},500);
			$("#key17").addClass("whitebt_normal");
		}
	} else if (keyCode === 79) {
		{
			var musicfile = 'audio/G5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key18").removeClass("whitebt_normal");
			$("#key18").addClass("whitebt_press_special");

			setTimeout(function(){$("#key18").removeClass("whitebt_press_special");},500);
			$("#key18").addClass("whitebt_normal");
		}
	} else if (keyCode === 56) {
		{
			var musicfile = 'audio/A5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key19").removeClass("whitebt_normal");
			$("#key19").addClass("whitebt_press_special");

			setTimeout(function(){$("#key19").removeClass("whitebt_press_special");},500);
			$("#key19").addClass("whitebt_normal");
		}
	} else if (keyCode === 48) {
		{
			var musicfile = 'audio/B5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key20").removeClass("whitebt_normal");
			$("#key20").addClass("whitebt_press_special");

			setTimeout(function(){$("#key20").removeClass("whitebt_press_special");},500);
			$("#key20").addClass("whitebt_normal");
		}
	} else if (keyCode === 97) {
		{
			var musicfile = 'audio/C6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key21").removeClass("whitebt_normal");
			$("#key21").addClass("whitebt_press_special");

			setTimeout(function(){$("#key21").removeClass("whitebt_press_special");},500);
			$("#key21").addClass("whitebt_normal");
		}
	} else if (keyCode === 99) {
		{
			var musicfile = 'audio/D6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key22").removeClass("whitebt_normal");
			$("#key22").addClass("whitebt_press_special");

			setTimeout(function(){$("#key22").removeClass("whitebt_press_special");},500);
			$("#key22").addClass("whitebt_normal");
		}
	} else if (keyCode === 101) {
		{
			var musicfile = 'audio/E6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key23").removeClass("whitebt_normal");
			$("#key23").addClass("whitebt_press_special");

			setTimeout(function(){$("#key23").removeClass("whitebt_press_special");},500);
			$("#key23").addClass("whitebt_normal");
		}
	} else if (keyCode === 102) {
		{
			var musicfile = 'audio/F6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key24").removeClass("whitebt_normal");
			$("#key24").addClass("whitebt_press_special");

			setTimeout(function(){$("#key24").removeClass("whitebt_press_special");},500);
			$("#key24").addClass("whitebt_normal");
		}
	} else if (keyCode === 104) {
		{
			var musicfile = 'audio/G6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key25").removeClass("whitebt_normal");
			$("#key25").addClass("whitebt_press_special");

			setTimeout(function(){$("#key25").removeClass("whitebt_press_special");},500);
			$("#key25").addClass("whitebt_normal");
		}
	} else if (keyCode === 111) {
		{
			var musicfile = 'audio/A6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key26").removeClass("whitebt_normal");
			$("#key26").addClass("whitebt_press_special");

			setTimeout(function(){$("#key26").removeClass("whitebt_press_special");},500);
			$("#key26").addClass("whitebt_normal");
		}
	} else if (keyCode === 109) {
		{
			var musicfile = 'audio/B6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key27").removeClass("whitebt_normal");
			$("#key27").addClass("whitebt_press_special");

			setTimeout(function(){$("#key27").removeClass("whitebt_press_special");},500);
			$("#key27").addClass("whitebt_normal");
		}
	} else if (keyCode === 50) {
		{
			var musicfile = 'audio/DB3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#key28").removeClass("whitebt_normal");
			$("#key28").addClass("whitebt_press_special");

			setTimeout(function(){$("#key28").removeClass("whitebt_press_special");},500);
			$("#key28").addClass("whitebt_normal");
		}
	}
	else if (keyCode === 50) {
		{
			var musicfile = 'audio/DB03.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb19").removeClass("blackbt-normal");
			$("#keyb19").addClass("blackbt-press");
			setTimeout(function(){$("#keyb19").removeClass("blackbt-press");},500);
			$("#keyb19").addClass("blackbt-normal");
		}
	}
	else if (keyCode === 51) {
		{
			var musicfile = 'audio/EB3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();

			$("#keyb0").removeClass("blackbt-normal");
			$("#keyb0").addClass("blackbt-press");
			setTimeout(function(){$("#keyb0").removeClass("blackbt-press");},500);
			$("#keyb0").addClass("blackbt-normal");
		}
	} else if (keyCode === 53) {
		{
			var musicfile = 'audio/F03.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb1").removeClass("blackbt-normal");
			$("#keyb1").addClass("blackbt-press");
			setTimeout(function(){$("#keyb1").removeClass("blackbt-press");},500);
			$("#keyb1").addClass("blackbt-normal");
		}
	} else if (keyCode === 54) {
		{
			var musicfile = 'audio/G03.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb2").removeClass("blackbt-normal");
			$("#keyb2").addClass("blackbt-press");

			setTimeout(function(){$("#keyb2").removeClass("blackbt-press");},500);
			$("#keyb2").addClass("blackbt-normal");
		}
	} else if (keyCode === 55) {
		{
			var musicfile = 'audio/BB3.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb3").removeClass("blackbt-normal");
			$("#keyb3").addClass("blackbt-press");

			setTimeout(function(){$("#keyb3").removeClass("blackbt-press");},500);
			$("#keyb3").addClass("blackbt-normal");
		}
	} else if (keyCode === 83) {
		{
			var musicfile = 'audio/DB4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb4").removeClass("blackbt-normal");
			$("#keyb4").addClass("blackbt-press");

			setTimeout(function(){$("#keyb4").removeClass("blackbt-press");},500);
			$("#keyb4").addClass("blackbt-normal");

		}
	} else if (keyCode === 68) {
		{
			var musicfile = 'audio/EB4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb5").removeClass("blackbt-normal");
			$("#keyb5").addClass("blackbt-press");

			setTimeout(function(){$("#keyb5").removeClass("blackbt-press");},500);
			$("#keyb5").addClass("blackbt-normal");
		}
	} else if (keyCode === 71) {
		{
			var musicfile = 'audio/F04.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb6").removeClass("blackbt-normal");
			$("#keyb6").addClass("blackbt-press");

			setTimeout(function(){$("#keyb6").removeClass("blackbt-press");},500);
			$("#keyb6").addClass("blackbt-normal");
		}
	} else if (keyCode === 72) {
		{
			var musicfile = 'audio/G04.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb7").removeClass("blackbt-normal");
			$("#keyb7").addClass("blackbt-press");

			setTimeout(function(){$("#keyb7").removeClass("blackbt-press");},500);
			$("#keyb7").addClass("blackbt-normal");
		}
	} else if (keyCode === 74) {
		{
			var musicfile = 'audio/BB4.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb8").removeClass("blackbt-normal");
			$("#keyb8").addClass("blackbt-press");

			setTimeout(function(){$("#keyb8").removeClass("blackbt-press");},500);
			$("#keyb8").addClass("blackbt-normal");
		}
	} else if (keyCode === 190) {
		{
			var musicfile = 'audio/DB5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb9").removeClass("blackbt-normal");
			$("#keyb9").addClass("blackbt-press");

			setTimeout(function(){$("#keyb9").removeClass("blackbt-press");},500);
			$("#keyb9").addClass("blackbt-normal");
		}
	} else if (keyCode === 75) {
		{
			var musicfile = 'audio/EB5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb10").removeClass("blackbt-normal");
			$("#keyb10").addClass("blackbt-press");

			setTimeout(function(){$("#keyb10").removeClass("blackbt-press");},500);
			$("#keyb10").addClass("blackbt-normal");
		}
	} else if (keyCode === 73) {
		{
			var musicfile = 'audio/F05.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb11").removeClass("blackbt-normal");
			$("#keyb11").addClass("blackbt-press");

			setTimeout(function(){$("#keyb11").removeClass("blackbt-press");},500);
			$("#keyb11").addClass("blackbt-normal");
		}
	} else if (keyCode === 80) {
		{
			var musicfile = 'audio/G05.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb12").removeClass("blackbt-normal");
			$("#keyb12").addClass("blackbt-press");

			setTimeout(function(){$("#keyb12").removeClass("blackbt-press");},500);
			$("#keyb12").addClass("blackbt-normal");
		}
	} else if (keyCode === 57) {
		{
			var musicfile = 'audio/BB5.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb13").removeClass("blackbt-normal");
			$("#keyb13").addClass("blackbt-press");

			setTimeout(function(){$("#keyb13").removeClass("blackbt-press");},500);
			$("#keyb13").addClass("blackbt-normal");
		}
	} else if (keyCode === 98) {
		{
			var musicfile = 'audio/DB6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb14").removeClass("blackbt-normal");
			$("#keyb14").addClass("blackbt-press");

			setTimeout(function(){$("#keyb14").removeClass("blackbt-press");},500);
			$("#keyb14").addClass("blackbt-normal");
		}
	} else if (keyCode === 100) {
		{
			var musicfile = 'audio/EB6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb15").removeClass("blackbt-normal");
			$("#keyb15").addClass("blackbt-press");

			setTimeout(function(){$("#keyb15").removeClass("blackbt-press");},500);
			$("#keyb15").addClass("blackbt-normal");
		}
	} else if (keyCode === 103) {
		{
			var musicfile = 'audio/F06.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb16").removeClass("blackbt-normal");
			$("#keyb16").addClass("blackbt-press");

			setTimeout(function(){$("#keyb16").removeClass("blackbt-press");},500);
			$("#keyb16").addClass("blackbt-normal");
		}
	} else if (keyCode === 105) {
		{
			var musicfile = 'audio/G06.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb17").removeClass("blackbt-normal");
			$("#keyb17").addClass("blackbt-press");

			setTimeout(function(){$("#keyb17").removeClass("blackbt-press");},500);
			$("#keyb17").addClass("blackbt-normal");
		}
	} else if (keyCode === 106) {
		{
			var musicfile = 'audio/BB6.mp3'
			playMusic = new Audio(musicfile);
			playMusic.play();
			$("#keyb18").removeClass("blackbt-normal");
			$("#keyb18").addClass("blackbt-press");

			setTimeout(function(){$("#keyb18").removeClass("blackbt-press");},500);
			$("#keyb18").addClass("blackbt-normal");
		}
	}


}

