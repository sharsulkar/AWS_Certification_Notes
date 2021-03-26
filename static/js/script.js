// When the user scrolls down 20px from the top of the document, show the button
/*window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}
*/
// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

//word count 
//reference - https://stackoverflow.com/questions/31206533/count-words-with-javascript
var words = document.getElementsByTagName('main')[0].innerHTML.replace(/<.*?>/g, '');
//console.log(words.match(/\S+/g).length-3);
//reference https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent
document.getElementById('read_time').textContent = 'Read time: '.concat(Math.floor((words.match(/\S+/g).length-3)/100),' minutes.');
