function showMenu(event, menuId) {
    var menu = document.getElementById(menuId);
    var link = event.target;
    var menus = menu.parentElement.querySelectorAll("ul");
    for (var i = 0; i < menus.length; i++) {
        if (menus[i] !== menu) {
            menus[i].style.display = "none";
        }
    }
    if (menu.style.display === "none") {
        menu.style.display = "block";
        menu.style.left = (link.offsetLeft-40) + "px";

    } else {
        menu.style.display = "none";
    }
}

document.addEventListener('click', function(event) {
    var menu = document.getElementById('company-menu');
    var link = document.querySelector('.menu-link');
    if (event.target !== menu && event.target !== link) {
        menu.style.display = 'none';
    }
});

document.getElementById("edit-201").addEventListener("click", function() {
    var newText = prompt("Enter new text for room 201:");
    if (newText) {
        document.getElementById("text-201").textContent = newText;
    }
});

document.getElementById("edit-202").addEventListener("click", function() {
    var newText = prompt("Enter new text for room 202:");
    if (newText) {
        document.getElementById("text-202").textContent = newText;
    }
});

document.getElementById("edit-203").addEventListener("click", function() {
    var newText = prompt("Enter new text for room 203:");
    if (newText) {
        document.getElementById("text-203").textContent = newText;
    }
});