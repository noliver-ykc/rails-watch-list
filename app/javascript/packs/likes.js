let button = document.getElementById("likes");
let counter = document.getElementById("counter");
count = 5;
button.onclick = function() {
  count += 1;
  counter.innerHTML = count;
};
