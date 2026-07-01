(function () {
  var nav = document.querySelector('.navbar[color-on-scroll]');
  if (nav && nav.classList.contains('navbar-transparent')) {
    var threshold = parseInt(nav.getAttribute('color-on-scroll'), 10) || 400;
    function onScroll() {
      nav.classList.toggle('navbar-transparent', window.scrollY <= threshold);
    }
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
  }

  var toggle = document.getElementById('nav-toggle');
  var navigation = document.getElementById('navigation');
  if (toggle && navigation) {
    navigation.addEventListener('click', function (event) {
      if (event.target.closest('a')) {
        toggle.checked = false;
      }
    });
  }
})();
